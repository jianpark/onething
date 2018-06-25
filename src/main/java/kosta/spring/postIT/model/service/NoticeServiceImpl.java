package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.NoticeDAO;
import kosta.spring.postIT.model.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeDTO> selectAll() {
		return noticeDAO.selectAll();
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) {
		return noticeDAO.insertNotice(noticeDTO);
	}

	@Override
	public NoticeDTO select(String noticeCode) {
		return noticeDAO.select(noticeCode);
	}

	@Override
	public int deleteNotice(String noticeCode) {
		return noticeDAO.deleteNotice(noticeCode);
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO) {
		return noticeDAO.updateNotice(noticeDTO);
	}

}
