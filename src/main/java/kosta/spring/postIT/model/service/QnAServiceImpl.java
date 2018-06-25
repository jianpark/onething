package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.QnADAO;
import kosta.spring.postIT.model.dto.QnADTO;
@Service
public class QnAServiceImpl implements QnAService {
	
	@Autowired
	QnADAO qnADAO;
	
	@Override
	public List<QnADTO> selectAll() {
		return qnADAO.selectAll();
	}

	@Override
	public int insertQnA(QnADTO qnADTO) {
		return qnADAO.insertQnA(qnADTO);
	}

	@Override
	public QnADTO select(String qaCode) {
		return qnADAO.select(qaCode);
	}

	@Override
	public int delete(String qaCode) {
		return qnADAO.delete(qaCode);
	}

	@Override
	public int update(QnADTO qnADTO) {
		return qnADAO.update(qnADTO);
	}

	@Override
	public int insertRep(QnADTO qnADTO) {
		return qnADAO.insertRep(qnADTO);
	}

	@Override
	public List<QnADTO> selectRepAll() {
		return qnADAO.selectRepAll();
	}

}
