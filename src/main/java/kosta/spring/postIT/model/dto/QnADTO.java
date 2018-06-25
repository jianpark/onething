package kosta.spring.postIT.model.dto;

public class QnADTO {
	private String qaCode;
	private String userId;
	private String qaReplyCode;
	private String qaTitle;
	private String qaContent;
	private String qaDate;
	
	public String getQaCode() {
		return qaCode;
	}
	public void setQaCode(String qaCode) {
		this.qaCode = qaCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQaReplyCode() {
		return qaReplyCode;
	}
	public void setQaReplyCode(String qaReplyCode) {
		this.qaReplyCode = qaReplyCode;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public String getQaDate() {
		return qaDate;
	}
	public void setQaDate(String qaDate) {
		this.qaDate = qaDate;
	}
}
