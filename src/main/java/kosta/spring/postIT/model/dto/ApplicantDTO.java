package kosta.spring.postIT.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class ApplicantDTO {

	private String userId;
	private String userName;
	private String applicantResume;
	private String applicantMajor;
	private String applicantMajor2;
	private String applicantMajor3;
	private String applicantStatus;
	private MultipartFile file;
	private MenteeDTO menteeDTO;
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public ApplicantDTO() {}
	
	public ApplicantDTO(String userId, String applicantResume, String applicantMajor, String applicantMajor2,
			String applicantMajor3, String applicantStatus) {
		super();
		this.userId = userId;
		this.applicantResume = applicantResume;
		this.applicantMajor = applicantMajor;
		this.applicantMajor2 = applicantMajor2;
		this.applicantMajor3 = applicantMajor3;
		this.applicantStatus = applicantStatus;
	}
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public MenteeDTO getMenteeDTO() {
		return menteeDTO;
	}

	public void setMenteeDTO(MenteeDTO menteeDTO) {
		this.menteeDTO = menteeDTO;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getApplicantResume() {
		return applicantResume;
	}
	public void setApplicantResume(String applicantResume) {
		this.applicantResume = applicantResume;
	}
	public String getApplicantMajor() {
		return applicantMajor;
	}
	public void setApplicantMajor(String applicantMajor) {
		this.applicantMajor = applicantMajor;
	}
	public String getApplicantMajor2() {
		return applicantMajor2;
	}
	public void setApplicantMajor2(String applicantMajor2) {
		this.applicantMajor2 = applicantMajor2;
	}
	public String getApplicantMajor3() {
		return applicantMajor3;
	}
	public void setApplicantMajor3(String applicantMajor3) {
		this.applicantMajor3 = applicantMajor3;
	}
	public String getApplicantStatus() {
		return applicantStatus;
	}
	public void setApplicantStatus(String applicantStatus) {
		this.applicantStatus = applicantStatus;
	}
	
	
	
	
	
}
