package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.QnADTO;

public interface QnAService {
	List<QnADTO> selectAll();
	
	int insertQnA(QnADTO qnADTO);

	QnADTO select(String qaCode);
	
	int delete(String qaCode);
	
	int update(QnADTO qnADTO);
	
	int insertRep(QnADTO qnADTO);
	
	List<QnADTO> selectRepAll();

}
