package kosta.spring.postIT.model.dto;

public class MentoMajorDTO {

	private String majorCode;
	private String userId;
	private String majorField;
	
	public MentoMajorDTO() {}
	
	public MentoMajorDTO(String majorCode, String userId, String majorField) {
		super();
		this.majorCode = majorCode;
		this.userId = userId;
		this.majorField = majorField;
	}
	
	public String getMajorCode() {
		return majorCode;
	}
	public void setMajorCode(String majorCode) {
		this.majorCode = majorCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMajorField() {
		return majorField;
	}
	public void setMajorField(String majorField) {
		this.majorField = majorField;
	}
	
	
}
