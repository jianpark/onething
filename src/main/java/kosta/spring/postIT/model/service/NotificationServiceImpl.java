package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.NotificationDAO;
import kosta.spring.postIT.model.dto.NotificationDTO;

@Service
public class NotificationServiceImpl implements NotificationService {
	@Autowired
	NotificationDAO notificationDAO;
	
	@Override
	public int insertNotification(NotificationDTO notificationDTO) {
		return notificationDAO.insertNotification(notificationDTO);
	}

	@Override
	public List<NotificationDTO> selectNotification(String userId) {
		return notificationDAO.selectNotification(userId);
	}

	@Override
	public int deleteNotification(String notId) {
		return notificationDAO.deleteNotification(notId);
	}

	@Override
	public int deleteAll(String userId) {
		return notificationDAO.deleteAll(userId);
	}

	@Override
	public int updateReadStatus(String notId) {
		return notificationDAO.updateReadStatus(notId);
	}

	@Override
	public int updateReadStatusAll(String userId) {
		// TODO Auto-generated method stub
		return notificationDAO.updateReadStatusAll(userId);
	}

}
