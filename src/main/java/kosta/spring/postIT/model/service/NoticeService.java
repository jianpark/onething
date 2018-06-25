package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.NoticeDTO;

public interface NoticeService {
	List<NoticeDTO> selectAll();

	int insertNotice(NoticeDTO noticeDTO);
	
	NoticeDTO select(String noticeCode);
	
	int deleteNotice(String noticeCode);
	
	int updateNotice(NoticeDTO noticeDTO);

}
