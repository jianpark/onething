package kosta.spring.postIT.model.dto;

public class CrFeedbackDTO {
	private String crFeedCode;
	private String crAsgnCode;
	private String userId;
	private String mentoId;
	private String crFeedContent;
	private String crFeedDate;

	public String getCrFeedCode() {
		return crFeedCode;
	}

	public void setCrFeedCode(String crFeedCode) {
		this.crFeedCode = crFeedCode;
	}

	public String getCrAsgnCode() {
		return crAsgnCode;
	}

	public void setCrAsgnCode(String crAsgnCode) {
		this.crAsgnCode = crAsgnCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCrFeedContent() {
		return crFeedContent;
	}

	public void setCrFeedContent(String crFeedContent) {
		this.crFeedContent = crFeedContent;
	}

	public String getCrFeedDate() {
		return crFeedDate;
	}

	public void setCrFeedDate(String crFeedDate) {
		this.crFeedDate = crFeedDate;
	}
	
	public String getMentoId() {
		return mentoId;
	}
	
	public void setMentoId(String mentoId) {
		this.mentoId = mentoId;
	}
}