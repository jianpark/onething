package kosta.spring.postIT.model.dto;

public class CrNoticeReplyDTO {
	private String crReplyCode;
	private String crNoticeCode;
	private String userId;
	private String crReplyContent;
	private String crReplyDate;
	
	public CrNoticeReplyDTO() {}
	
	public CrNoticeReplyDTO(String crReplyCode, String crNoticeCode, String userId, String crReplyContent,
			String crReplyDate) {
		super();
		this.crReplyCode = crReplyCode;
		this.crNoticeCode = crNoticeCode;
		this.userId = userId;
		this.crReplyContent = crReplyContent;
		this.crReplyDate = crReplyDate;
	}
	
	public String getCrReplyCode() {
		return crReplyCode;
	}
	public void setCrReplyCode(String crReplyCode) {
		this.crReplyCode = crReplyCode;
	}
	public String getCrNoticeCode() {
		return crNoticeCode;
	}
	public void setCrNoticeCode(String crNoticeCode) {
		this.crNoticeCode = crNoticeCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCrReplyContent() {
		return crReplyContent;
	}
	public void setCrReplyContent(String crReplyContent) {
		this.crReplyContent = crReplyContent;
	}
	public String getCrReplyDate() {
		return crReplyDate;
	}
	public void setCrReplyDate(String crReplyDate) {
		this.crReplyDate = crReplyDate;
	}
	
	
}
