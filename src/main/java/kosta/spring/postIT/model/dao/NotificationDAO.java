package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.NotificationDTO;

public interface NotificationDAO {
	public int insertNotification(NotificationDTO notificationDTO);
	
	public List<NotificationDTO> selectNotification(String userId);
	
	public int deleteNotification(String notId);
	
	public int deleteAll(String userId);
	
	public int updateReadStatus(String notId);
	
	public int updateReadStatusAll(String userId);
}
