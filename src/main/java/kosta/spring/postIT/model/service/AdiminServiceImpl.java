package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.AdminDAO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;

@Service
public class AdiminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<MenteeDTO> menteeSelect() {
		
		return dao.menteeSelect();

	}

	@Override
	public int menteeDelete(String userId) {
		
		return dao.menteeDelete(userId);
	
	}

	@Override
	public List<MentoDTO> mentoSelect() {
		
		return dao.mentoSelect();
		
	}

	@Override
	public int mentoDelete(String userId) {
		
		return dao.mentoDelete(userId);
		
	}

	
	
	
}
