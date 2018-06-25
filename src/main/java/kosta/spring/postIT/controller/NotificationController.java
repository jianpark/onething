package kosta.spring.postIT.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.spring.postIT.model.dto.NotificationDTO;
import kosta.spring.postIT.model.service.NotificationService;

@Controller
public class NotificationController {
	@Autowired
	private NotificationService notificationService;
	
		@RequestMapping(value = "/notification/select")
		@ResponseBody
		public List<NotificationDTO> selectNotificationList(HttpServletRequest request){
			String userId = request.getParameter("userId");
			List<NotificationDTO> list = null;
			if(userId!=null) 
				list = notificationService.selectNotification(userId);
			
			return list;
		}
		
		@RequestMapping("/notification/delete")
		@ResponseBody
		public int deleteNotification(HttpServletRequest request) {
			String notId = request.getParameter("notId");
			int re = notificationService.deleteNotification(notId);
			return re;
		}
		
		@RequestMapping("/notification/updateReadStatus")
		@ResponseBody
		public int updateReadStatus(HttpServletRequest request) {
			String notIdReadStatus = request.getParameter("notIdReadStatus");
			int re = notificationService.updateReadStatus(notIdReadStatus);
			return re;
		}
		
		@RequestMapping("/notification/deleteAll")
		@ResponseBody
		public int deleteAllNotification(HttpServletRequest request) {
			String notId = request.getParameter("allDelUserId");
			int re = notificationService.deleteAll(notId);
			return re;
		}
		
		@RequestMapping("/notification/readAll")
		@ResponseBody
		public int readAllNotification(HttpServletRequest request) {
			String notId= request.getParameter("allReadUserId");
			int re = notificationService.updateReadStatusAll(notId);
			return re;
		}
		
}
