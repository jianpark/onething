package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.AuthorityDTO;

public interface AuthoritiesDAO {

	/**
	 * ����� ���� ���
	 * (�� USER(���̵�)�� �������� ������ ���� �� �ִ�.
	 * */
	int insertAuthority(AuthorityDTO authorityDTO);
	
	/**
	 * id�� �ش��ϴ� ���� �˻�.
	 * */
	List<AuthorityDTO> selectAuthorityByUserName(String userId);
}






