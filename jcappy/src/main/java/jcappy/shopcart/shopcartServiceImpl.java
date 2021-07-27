package jcappy.shopcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class shopcartServiceImpl implements shopcartService {
	
	@Autowired
	shopcartDao shopcartDao;
	
	public int insert(shopcartVo vo) {
		return shopcartDao.insert(vo);
	}
}
