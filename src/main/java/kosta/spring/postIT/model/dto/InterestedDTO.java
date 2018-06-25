package kosta.spring.postIT.model.dto;

public class InterestedDTO {

	private String interCode;
	private String userId;
	private String interField1;
	private String interField2;
	private String interField3;
	
	@Override
	public String toString() {
		return "InterestedDTO [interCode=" + interCode + ", userId=" + userId + ", interField1=" + interField1
				+ ", interField2=" + interField2 + ", interField3=" + interField3 + "]";
	}

	public InterestedDTO() {}
	
	public InterestedDTO(String interCode, String userId, String interField, String interField2, String interField3, String interField1) {
		super();
		this.interCode = interCode;
		this.userId = userId;
		this.interField1 = interField1;
		this.interField2 = interField2;
		this.interField3 = interField3;
	}
	public InterestedDTO(String userId, String interField1) {
		super();
		
		this.userId = userId;
		this.interField1 = interField1;
	}
	public InterestedDTO(String userId, String interField1, String interField2) {
		super();
		
		this.userId = userId;
		this.interField1 = interField1;
		this.interField2 = interField2;
	}
	
	public InterestedDTO(String userId, String interField2, String interField3, String interField1) {
		super();
		
		this.userId = userId;
		this.interField1 = interField1;
		this.interField2 = interField2;
		this.interField3 = interField3;
	}

	public String getInterCode() {
		return interCode;
	}

	public void setInterCode(String interCode) {
		this.interCode = interCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getInterField1() {
		return interField1;
	}

	public void setInterField1(String interField1) {
		this.interField1 = interField1;
	}

	public String getInterField2() {
		return interField2;
	}

	public void setInterField2(String interField2) {
		this.interField2 = interField2;
	}

	public String getInterField3() {
		return interField3;
	}

	public void setInterField3(String interField3) {
		this.interField3 = interField3;
	}
	
	
	
	
}
