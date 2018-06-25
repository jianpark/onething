package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;

public interface AdminService {

	List<MenteeDTO> menteeSelect();
	
	int menteeDelete(String userId);
	
	List<MentoDTO> mentoSelect();
	
	int mentoDelete(String userId);
	
}
