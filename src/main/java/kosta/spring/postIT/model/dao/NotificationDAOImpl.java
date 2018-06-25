package kosta.spring.postIT.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.NotificationDTO;

@Repository
public class NotificationDAOImpl implements NotificationDAO {
	
	@Autowired
	SqlSession session;
	
	@Override
	public int insertNotification(NotificationDTO notificationDTO) {
		return session.insert("notificationMapper.insertNotification", notificationDTO);
	}

	@Override
	public List<NotificationDTO> selectNotification(String userId) {
		return session.selectList("notificationMapper.selectNotification", userId);
	}

	@Override
	public int deleteNotification(String notId) {
		return session.delete("notificationMapper.deleteNotification", notId);
	}

	@Override
	public int deleteAll(String userId) {
		return session.delete("notificationMapper.deleteAll", userId);
	}

	@Override
	public int updateReadStatus(String notId) {
		return session.update("notificationMapper.updateReadStatus", notId);
	}

	@Override
	public int updateReadStatusAll(String userId) {
		return session.update("updateReadStatusAll", userId);
	}

}
