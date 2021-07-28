package jcappy.shopcart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopcartServiceImpl implements ShopcartService {
	
	@Autowired
	ShopcartDao shopcartDao;

	public int insert(ShopcartVo vo) {
		return shopcartDao.insert(vo);
	}
	
	public List<ShopcartVo> selectAll() {
		return shopcartDao.selectAll();
	}
	
	public int update(ShopcartVo vo) {
		return shopcartDao.update(vo);
	}
	
	public int delete(ShopcartVo vo) {
		return shopcartDao.delete(vo);
	}
}
