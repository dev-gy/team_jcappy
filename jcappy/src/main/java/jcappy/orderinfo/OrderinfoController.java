package jcappy.orderinfo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;

import jcappy.coupon.CouponService;
import jcappy.coupon.CouponVo;
import jcappy.members.MembersService;
import jcappy.members.MembersVo;
import jcappy.orderlist.OrderlistService;
import jcappy.orderlist.OrderlistVo;
import jcappy.product.ProductService;
import jcappy.product.ProductVo;
import jcappy.shopcart.ShopcartService;
import jcappy.shopcart.ShopcartVo;

@Controller
public class OrderinfoController {
	
	@Autowired
	OrderinfoService orderinfoService;
	@Autowired
	ProductService productService;
	@Autowired
	MembersService membersService;
	@Autowired
	CouponService couponService;
	@Autowired
	OrderlistService orderlistService;
	@Autowired
	ShopcartService shopcartService;
	
	IamportClient client;
	
	public OrderinfoController() {
		String api_key = "5283584635490063";
		String api_secret = "f7abd8d5d5826709870248b95e947dfd8b4d143f52c7a114227b9ef0f16fe71beb71f507240e754c";
		client = new IamportClient(api_key, api_secret);
	}
	
	@RequestMapping("/pay") // 인터셉터 걸기위해 PostMapping을 RequestMapping으로 바꿈.
	public String payIndex(Model model, HttpServletRequest request,
			@RequestParam(value = "sno", required = false) List<Integer> snoList, 
			@RequestParam("pno") List<Integer> pnoList, 
			@RequestParam("count") List<Integer> countList,
			@RequestParam("name") List<String> nameList,
			@RequestParam("img") List<String> imgList,
			@RequestParam("delivery_price") List<Integer> delivery_priceList,
			@RequestParam("total_price") List<Integer> total_priceList) {
		
		// 넘겨받은 상품정보들을 정리 및 총합배송비, 총합상품금액 구하기
		ArrayList<Map<String, Object>> pList = new ArrayList<Map<String,Object>>();
		int totalAllPrice = 0;
		int deliveryAllPrice = 0;
		for (int i = 0; i < pnoList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (snoList != null) {
				map.put("sno", snoList.get(i));
			}
			map.put("pno", pnoList.get(i));
			map.put("count", countList.get(i));
			map.put("name", nameList.get(i));
			map.put("img", imgList.get(i));
			map.put("delivery_price", delivery_priceList.get(i));
			map.put("total_price", total_priceList.get(i));
			pList.add(map);
			
			totalAllPrice += total_priceList.get(i);
			deliveryAllPrice += delivery_priceList.get(i);
		}
		// 총합상품금액 전달 
		model.addAttribute("totalAllPrice", totalAllPrice);
		// 총합배송비 전달 
		model.addAttribute("deliveryAllPrice", deliveryAllPrice);
		// 구매상품목록 전달
		model.addAttribute("pList", pList);

		// 회원정보를 전달
		MembersVo membersVo = membersService.detail((MembersVo)request.getSession().getAttribute("membersInfo"));
		model.addAttribute("mVo", membersVo);
		
		// 최근 배송 데이터를 전달
		model.addAttribute("oVo", orderinfoService.selectLastOne(membersVo.getMno()));
		
		// 회원의 쿠폰 리스트를 전달
		// 사용안한 쿠폰 중 쿠폰의 두배 값이 총상품금액 이하인 쿠폰만 담는다 
		CouponVo couponVo = new CouponVo();
		couponVo.setMno(membersVo.getMno());
		List<CouponVo> cList = new ArrayList<CouponVo>();
		for (CouponVo vo : couponService.selectAllByMno(couponVo)) {
			if (vo.getCprice() * 2 <= totalAllPrice) {
				cList.add(vo);
			}
		}
		model.addAttribute("cList", cList);
		
		return "/pay/index";
	}
	
	@PostMapping("/pay/check")
	public String payCheck(Model model, String imp_uid) throws IamportResponseException, IOException {
		
		model.addAttribute("result", new ObjectMapper().writeValueAsString(client.paymentByImpUid(imp_uid)));
		return "/include/result";
	}
	
	@PostMapping("/pay/complete")
	public String payComplete(Model model, 
			OrderinfoVo vo, 
			@RequestParam(required = false, value = "snoList[]") int[] snoList,
			@RequestParam("pnoList[]") int[] pnoList, 
			@RequestParam("pcountList[]") int[] pcountList,
			HttpServletRequest request) throws IamportResponseException, IOException {
		String filePath = request.getServletContext().getContextPath() + "/upload/";
		// 주문내역 추가 및 추가한 데이터의 ono를 vo에 반환 (주문상품 데이터 추가할때 쓸 것)
		boolean isSuccess = true;
		if (orderinfoService.insert(vo) > 0) {
			// 사용된 쿠폰 사용여부 사용으로 변경 
			if (vo.getCno() != 0) {
				CouponVo cVo = new CouponVo();
				cVo.setCno(vo.getCno());
				couponService.use(cVo);
			}
			
			// 결제한 상품 중 장바구니 상품이 있다면 장바구니 목록에서 삭제
			if (snoList != null) {
				ShopcartVo sVo = new ShopcartVo();
				for (int i = 0; i < snoList.length; i++) {
					if (!isSuccess) {
						break;
					}
					sVo.setSno(snoList[i]);
					isSuccess = shopcartService.delete(sVo) > 0;
				}
			}
			
			// 주문상품내역 데이터 담아서 추가
			OrderlistVo olVo = null;
			ProductVo pVo = null; 
			for (int i = 0; i < pnoList.length; i++) {
				if (!isSuccess) {
					break;
				}
				// product pno 값으로 해당 상품 데이터 찾기
				pVo = new ProductVo();
				pVo.setPno(pnoList[i]);
				pVo = productService.detail(filePath, pVo);
				
				// orderlist 값 셋팅 후 저장
				olVo = new OrderlistVo();
				olVo.setOno(vo.getOno());
				olVo.setPno(pVo.getPno());
				olVo.setOl_count(pcountList[i]);
				olVo.setOl_price(pVo.getPprice());
				olVo.setOl_pname(pVo.getPname());
				isSuccess = orderlistService.insert(olVo) > 0;
			}
		}
		model.addAttribute("result", isSuccess);
		
		return "/include/result";
	}
	
	@PostMapping("/pay/cancel")
	public String cancel(Model model, String imp_uid) throws IamportResponseException, IOException {
		CancelData cancelData = new CancelData(imp_uid, true);
		model.addAttribute("result", new ObjectMapper().writeValueAsString(client.cancelPaymentByImpUid(cancelData)));
		return "/include/result";
	}
	
	@RequestMapping("/mypage/order")
	public String orderIndex(Model model, OrderinfoVo vo, HttpServletRequest request) {
		vo.setMno(((MembersVo)request.getSession().getAttribute("membersInfo")).getMno());
		model.addAttribute("list", orderinfoService.selectAll(vo));
		return "/mypage/order/index";
	}
	
	@RequestMapping("/mypage/order/detail/{ono}")
	public String orderDetail(Model model, @PathVariable int ono) {
		OrderinfoVo oiVo = new OrderinfoVo();
		oiVo.setOno(ono);
		
		OrderlistVo olVo = new OrderlistVo();
		olVo.setOno(ono);
		List<OrderlistVo> olList = orderlistService.selectAll(olVo);
		
		model.addAttribute("oiVo", orderinfoService.detailIncludingPrice(oiVo));	// 주문정보
		model.addAttribute("olList", olList);	// 주문목록들
		return "/mypage/order/detail";
	}
	
	@RequestMapping("/mypage/order/cancel")
	public String orderCancel(Model model, OrderinfoVo vo, HttpServletRequest request) {
		vo.setMno(((MembersVo)request.getSession().getAttribute("membersInfo")).getMno());
		
		vo.setStype("oc_cancel");
		vo.setSval("1");
		model.addAttribute("list", orderinfoService.selectAll(vo));
		return "/mypage/order/cancel";
	}
	
	@RequestMapping("/mypage/order/canceldetail/{ono}")
	public String orderCanceldetail(Model model, @PathVariable int ono, HttpServletRequest request) {
		OrderinfoVo oiVo = new OrderinfoVo();
		oiVo.setOno(ono);
		model.addAttribute("oiVo", orderinfoService.detailIncludingPrice(oiVo));
		OrderlistVo olVo = new OrderlistVo();
		olVo.setOno(ono);
		model.addAttribute("olList", orderlistService.selectAll(olVo));
		return "/mypage/order/canceldetail";
	}
	
	@RequestMapping("/mypage/order/cancelwrite/{ono}")
	public String orderCancelwrite(Model model, @PathVariable int ono, HttpServletRequest request) {
		OrderinfoVo vo = new OrderinfoVo();
		vo.setOno(ono);
		model.addAttribute("vo", orderinfoService.detailIncludingPrice(vo));
		return "/mypage/order/cancelwrite";
	}
	
	@RequestMapping("/mypage/order/cancelupdate")
	public String orderCancelupdate(Model model, OrderinfoVo vo, HttpServletRequest request) {
		int res = orderinfoService.orderCancelupdate(vo);
		// r > 0 : 정상 -> alert -> 목록으로 이동
		// r == 0 : 비정상 -> alert -> 이전페이지로 이동
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "/jcappy/mypage/order/detail/"+vo.getOno());
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "/jcappy/mypage/order/cancelwrite/"+vo.getOno());
		}
		return "include/alert";
	}
}
