package jcappy.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	SalesDao dao;
	@Override
	public List<SalesVo> selectAll(SalesVo vo) {
		return dao.selectAll(vo);
	}

}
