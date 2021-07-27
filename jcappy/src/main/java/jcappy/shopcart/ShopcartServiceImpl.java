package jcappy.shopcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopcartServiceImpl implements ShopcartService {
	
	@Autowired
	ShopcartDao shopcartDao;

	public int insert(ShopcartVo vo) {
		return shopcartDao.insert(vo);
	}
}
