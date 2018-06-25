package kosta.spring.postIT.model.dto;

public class MentoDTO {

	private String userId;
	private String mentoResume;
	private String mentoDesc;
	private String mentoMajor;
	private String mentoMajor2;
	private String mentoMajor3;
	
	private MenteeDTO menteeDTO; //1:1ÀÇ °ü°è
	
	public MentoDTO() {}
	
	public MentoDTO(String userId, String mentoResume, String mentoDesc, String mentoMajor, String mentoMajor2,
			String mentoMajor3) {
		super();
		this.userId = userId;
		this.mentoResume = mentoResume;
		this.mentoDesc = mentoDesc;
		this.mentoMajor = mentoMajor;
		this.mentoMajor2 = mentoMajor2;
		this.mentoMajor3 = mentoMajor3;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMentoResume() {
		return mentoResume;
	}
	public void setMentoResume(String mentoResume) {
		this.mentoResume = mentoResume;
	}
	public String getMentoDesc() {
		return mentoDesc;
	}
	public void setMentoDesc(String mentoDesc) {
		this.mentoDesc = mentoDesc;
	}
	public String getMentoMajor() {
		return mentoMajor;
	}
	public void setMentoMajor(String mentoMajor) {
		this.mentoMajor = mentoMajor;
	}
	public String getMentoMajor2() {
		return mentoMajor2;
	}
	public void setMentoMajor2(String mentoMajor2) {
		this.mentoMajor2 = mentoMajor2;
	}
	public String getMentoMajor3() {
		return mentoMajor3;
	}
	public void setMentoMajor3(String mentoMajor3) {
		this.mentoMajor3 = mentoMajor3;
	}
	
	
	
	public MenteeDTO getMenteeDTO() {
		return menteeDTO;
	}
	public void setMenteeDTO(MenteeDTO menteeDTO) {
		this.menteeDTO = menteeDTO;
	}
	

}
