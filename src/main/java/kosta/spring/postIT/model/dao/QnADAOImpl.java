package kosta.spring.postIT.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.QnADTO;

@Repository
public class QnADAOImpl implements QnADAO {
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<QnADTO> selectAll() {
		return session.selectList("qnaMapper.selectAll");
	}

	@Override
	public int insertQnA(QnADTO qnADTO) {
		return session.insert("qnaMapper.insertQnA", qnADTO);
	}

	@Override
	public QnADTO select(String qaCode) {
		return session.selectOne("qnaMapper.select", qaCode);
	}

	@Override
	public int delete(String qaCode) {
		return session.delete("qnaMapper.delete", qaCode);
	}

	@Override
	public int update(QnADTO qnADTO) {
		return session.update("qnaMapper.update", qnADTO);
	}

	@Override
	public int insertRep(QnADTO qnADTO) {
		return session.insert("qnaMapper.insertRep", qnADTO);
	}

	@Override
	public List<QnADTO> selectRepAll() {
		return session.selectList("qnaMapper.selectRepAll");
	}
	
}
