package jcappy.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaDao dao;
	
	@Override
	public int insert(QnaVo vo) {
		if	(dao.insert(vo) > 0) {
			dao.gno(vo.getQ_gno());
			return 1;
		} else {
			return 0;
		}
	}
}
