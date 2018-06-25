package kosta.spring.postIT.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.AuthorityDTO;

@Repository
public class AuthoritiesDAOImpl implements AuthoritiesDAO {

	 @Autowired
	 private SqlSession sqlSession;
	
	 @Override
	 public int insertAuthority(AuthorityDTO authorityDTO) {
		// System.out.println("authorityDTO1 : "+authorityDTO.getUserId());
		// System.out.println("authorityDTO2 : "+authorityDTO.getRole());
			
		 return sqlSession.insert("authoritiesMapper.insertAuthority", authorityDTO);
	 }

	@Override
	public List<AuthorityDTO> selectAuthorityByUserName(String userId) {
		//수정필요
		return sqlSession.selectList("authoritiesMapper.selectAuthorityByUserName" , userId);

	}

}





