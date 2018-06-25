package kosta.spring.postIT.model.dto;

public class CourseFavDTO {

	private String courseCode;
	private String userId;
	
	private CourseDTO courseDTO;
	
	
	public CourseDTO getCourseDTO() {
		return courseDTO;
	}
	public void setCourseDTO(CourseDTO courseDTO) {
		this.courseDTO = courseDTO;
	}
	
	
	
	public CourseFavDTO() {}	
	public CourseFavDTO(String courseCode, String userId) {
		super();
		this.courseCode = courseCode;
		this.userId = userId;
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
	
}
