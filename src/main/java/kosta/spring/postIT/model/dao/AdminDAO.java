package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;

public interface AdminDAO {

	List<MenteeDTO> menteeSelect();
	
	int menteeDelete(String userId);
	
	List<MentoDTO> mentoSelect();
	
	int mentoDelete(String userId);

}
