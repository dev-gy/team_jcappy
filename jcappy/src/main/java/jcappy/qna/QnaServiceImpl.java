package jcappy.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaDao dao;
	
	@Override
	public int insert(QnaVo vo) {
		return dao.insert(vo);
	}
}
