package jcappy.orderinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminOrderinfoServiceImpl implements AdminOrderinfoService {
	
	@Autowired
	OrderinfoDao orderinfoDao;
}
