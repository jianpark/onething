package kosta.spring.postIT.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<MenteeDTO> menteeSelect() {
		
		return session.selectList("adminMapper.selectMentee");

	}

	@Override
	public int menteeDelete(String userId) {
		
		return session.delete("adminMapper.deleteMentee",userId);
		
	}

	@Override
	public List<MentoDTO> mentoSelect() {

		return session.selectList("adminMapper.selectMento");
	}

	@Override
	public int mentoDelete(String userId) {
		
		return session.delete("adminMapper.deleteMento", userId);

	}

}
