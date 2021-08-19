package jcappy.orderinfo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcappy.coupon.CouponDao;
import jcappy.coupon.CouponVo;
import jcappy.orderlist.OrderlistDao;
import jcappy.orderlist.OrderlistVo;
import jcappy.product.ProductDao;
import jcappy.product.ProductVo;

@Service
public class AdminOrderinfoServiceImpl implements AdminOrderinfoService {

	@Autowired
	OrderinfoDao dao;
	@Autowired
	OrderlistDao olDao;
	@Autowired
	ProductDao pDao;
	@Autowired
	CouponDao cDao;
	
	@Override
	public List<Map<String, String>> admin_selectList(OrderinfoVo vo) {
		
		int totalCount = dao.count(vo);
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) {totalPage++;}
		
		vo.setTotCount(totalCount);
		vo.setTotPage(totalPage);

		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totalPage) {endPage = totalPage;}
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return dao.admin_selectList(vo);
	}

	@Override
	public int pay_check(OrderinfoVo vo) {
		return dao.pay_check(vo);
	}
	
	@Override
	public int delivery_check(OrderinfoVo vo) {
		return dao.delivery_check(vo);
	}

	@Override
	public OrderinfoVo detail(OrderinfoVo vo) {
		return dao.detail(vo);
	}

	@Override
	public Map<String, String> admin_pre_del(OrderinfoVo vo) {
		return dao.admin_pre_del(vo);
	}

	@Override
	public int detail_pay_check(OrderinfoVo vo) {
		return dao.detail_pay_check(vo);
	}

	@Override
	public int detail_delivery_check(OrderinfoVo vo) {
		return dao.detail_delivery_check(vo);
	}

	@Override
	public int admin_order_update(OrderinfoVo vo) {
		return dao.admin_order_update(vo);
	}

	@Override
	public int request_cancel(OrderinfoVo vo) {
		List<OrderlistVo> list = null;
		if ("결제대기".equals(vo.getO_state())) {
			list = olDao.listForUpdateCount(vo);
		}
		int result = dao.request_cancel(vo);
		if (result > 0 && list != null) {
			ProductVo pv = new ProductVo();
			for(int i = 0; i < list.size(); i++) {
				pv.setPno(list.get(i).getPno());
				pv.setPcount(list.get(i).getOl_count());
				result += pDao.pcountUpdate(pv);
			}
		}
		return result;
	}

	@Override
	public int accept_cancel(OrderinfoVo vo) {
		int result = dao.accept_cancel(vo);
		
		if (result > 0) {
			List<OrderlistVo> list = olDao.listForUpdateCount(vo);
			ProductVo pv = new ProductVo();
			for(int i = 0; i < list.size(); i++) {
				pv.setPno(list.get(i).getPno());
				pv.setPcount(list.get(i).getOl_count());
				result += pDao.pcountUpdate(pv);
			}
		}
		return result;
	}

	@Override
	public int reject_cancel(OrderinfoVo vo) {
		return dao.reject_cancel(vo);
	}

	@Override
	public int remake_coupon(OrderinfoVo vo) {
		return dao.remake_coupon(vo);
	}

	@Override
	public int insert(OrderinfoVo vo, HttpServletRequest req) {
		
		int result = 0;
		
		int mno = Integer.parseInt(req.getParameter("mno"));
		int cno = Integer.parseInt(req.getParameter("cno"));
		String oname = req.getParameter("oname");
		String ophone = req.getParameter("ophone");
		String ozipcode = req.getParameter("ozipcode");
		String oaddr = req.getParameter("oaddr");
		String oaddrde = req.getParameter("oaddrde");
		String orequest = req.getParameter("orequest");
		String opay = req.getParameter("opay");
		String o_state = "결제대기";
		
		vo.setMno(mno);
		vo.setCno(cno);
		vo.setOname(oname);
		vo.setOphone(ophone);
		vo.setOzipcode(ozipcode);
		vo.setOaddr(oaddr);
		vo.setOaddrde(oaddrde);
		vo.setOrequest(orequest);
		vo.setOpay(opay);
		vo.setO_state(o_state);
		
		// orderinfo INSERT
		result += dao.insert(vo);
		int ono = vo.getOno();
		
		String[] pcount = req.getParameterValues("pcount");
		String[] pname = req.getParameterValues("pname");
		String[] pno = req.getParameterValues("pno");
		String[] pprice = req.getParameterValues("pprice");
		
		OrderlistVo ol = new OrderlistVo();
		ol.setOno(ono);
		for (int i = 0; i < pcount.length; i++) {
			ol.setOl_count(Integer.parseInt(pcount[i]));
			ol.setOl_pname(pname[i]);
			ol.setPno(Integer.parseInt(pno[i]));
			ol.setOl_price(Integer.parseInt(pprice[i]));
			// orderlist INSERT
			result += olDao.insert(ol);
		}
		
		ProductVo pv = new ProductVo(); 
		for (int i = 0; i < pcount.length; i++) {
			pv.setPno(Integer.parseInt(pno[i]));
			pv.setPcount(Integer.parseInt(pcount[i]) * -1);
			// product 재고 update
			result += pDao.pcountUpdate(pv);
		}

		if (cno != 0) {
			CouponVo cv = new CouponVo();
			cv.setCno(cno);
			// 사용한 쿠폰이 있다면, 쿠폰 사용 처리
			result += cDao.use(cv);
		}
		return result;
	}
}
