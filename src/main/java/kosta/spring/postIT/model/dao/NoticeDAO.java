package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.NoticeDTO;

public interface NoticeDAO {
	List<NoticeDTO> selectAll();
	
	int insertNotice(NoticeDTO noticeDTO);
	
	NoticeDTO select(String noticeCode);
	
	int deleteNotice(String noticeCode);
	
	int updateNotice(NoticeDTO noticeDTO);
}
