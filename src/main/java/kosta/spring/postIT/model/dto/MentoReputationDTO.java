package kosta.spring.postIT.model.dto;

import java.util.List;

public class MentoReputationDTO {

	private String repCode;
	private String userId;
	private String repWriter;
	private String repContent;
	private String repDate;
	private String courseCode;
	
	private List<CourseDTO> courseDTO; //1:다인 경우
	
	public MentoReputationDTO(){}
	public MentoReputationDTO(String repCode, String userId, String repWriter, String repContent, String repDate,
			String courseCode) {
		
		this.repCode = repCode;
		this.userId = userId;
		this.repWriter = repWriter;
		this.repContent = repContent;
		this.repDate = repDate;
		this.courseCode = courseCode;
	}
	public String getRepCode() {
		return repCode;
	}
	public void setRepCode(String repCode) {
		this.repCode = repCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRepWriter() {
		return repWriter;
	}
	public void setRepWriter(String repWriter) {
		this.repWriter = repWriter;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public String getRepDate() {
		return repDate;
	}
	public void setRepDate(String repDate) {
		this.repDate = repDate;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public List<CourseDTO> getCourseDTO() {
		return courseDTO;
	}
	public void setCourseDTO(List<CourseDTO> courseDTO) {
		this.courseDTO = courseDTO;
	}	

}
