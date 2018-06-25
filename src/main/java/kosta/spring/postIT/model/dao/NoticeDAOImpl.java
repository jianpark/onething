package kosta.spring.postIT.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<NoticeDTO> selectAll() {
		return session.selectList("noticeMapper.selectAll");
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) {
		return session.insert("noticeMapper.insert", noticeDTO);
	}

	@Override
	public NoticeDTO select(String noticeCode) {
		return session.selectOne("noticeMapper.select", noticeCode);
	}

	@Override
	public int deleteNotice(String noticeCode) {
		return session.delete("noticeMapper.delete", noticeCode);
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO) {
		return session.update("noticeMapper.updateNotice", noticeDTO);
	}

}
