package kosta.spring.postIT.model.dto;

public class NotificationDTO {
	private String notId;
	private String userId;
	private String senderName;
	private String notMessage;
	private String notDatetime;
	private int notIsRead;
	
	public String getNotId() {
		return notId;
	}
	public void setNotId(String notId) {
		this.notId = notId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getNotMessage() {
		return notMessage;
	}
	public void setNotMessage(String notMessage) {
		this.notMessage = notMessage;
	}
	public String getNotDatetime() {
		return notDatetime;
	}
	public void setNotDatetime(String notDatetime) {
		String arr[] = notDatetime.split(" ");
		this.notDatetime = arr[0];
	}
	public int getNotIsRead() {
		return notIsRead;
	}
	public void setNotIsRead(int notIsRead) {
		this.notIsRead = notIsRead;
	}
	
}
