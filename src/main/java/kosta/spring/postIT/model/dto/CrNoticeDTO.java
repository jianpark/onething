package kosta.spring.postIT.model.dto;

public class CrNoticeDTO {
	private String crNoticeCode;
	private String courseCode;
	private String userId;
	private String crNoticeTitle;
	private String crNoticeContent;
	private String crNoticeDate;
	
	public CrNoticeDTO() {}
	
	public CrNoticeDTO(String crNoticeCode, String courseCode, String userId, String crNoticeTitle,
			String crNoticeContent, String crNoticeDate) {
		super();
		this.crNoticeCode = crNoticeCode;
		this.courseCode = courseCode;
		this.userId = userId;
		this.crNoticeTitle = crNoticeTitle;
		this.crNoticeContent = crNoticeContent;
		this.crNoticeDate = crNoticeDate;
	}
	public String getCrNoticeCode() {
		return crNoticeCode;
	}
	public void setCrNoticeCode(String crNoticeCode) {
		this.crNoticeCode = crNoticeCode;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCrNoticeTitle() {
		return crNoticeTitle;
	}
	public void setCrNoticeTitle(String crNoticeTitle) {
		this.crNoticeTitle = crNoticeTitle;
	}
	public String getCrNoticeContent() {
		return crNoticeContent;
	}
	public void setCrNoticeContent(String crNoticeContent) {
		this.crNoticeContent = crNoticeContent;
	}
	public String getCrNoticeDate() {
		return crNoticeDate;
	}
	public void setCrNoticeDate(String crNoticeDate) {
		this.crNoticeDate = crNoticeDate;
	}
	
	
}
