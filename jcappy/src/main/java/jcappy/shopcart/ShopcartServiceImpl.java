package jcappy.shopcart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopcartServiceImpl implements ShopcartService {
	
	@Autowired
	ShopcartDao shopcartDao;

	@Override
	public int insert(ShopcartVo vo) {
		return shopcartDao.insert(vo);
	}
	
	@Override
	public List<ShopcartVo> selectAll() {
		return shopcartDao.selectAll();
	}
	
	@Override
	public int update(ShopcartVo vo) {
		return shopcartDao.update(vo);
	}
	
	@Override
	public int delete(ShopcartVo vo) {
		return shopcartDao.delete(vo);
	}
}
