package kosta.spring.postIT.model.dto;

public class CourseDateDTO {
	
	private String courseDateCode;
	private String courseCode;
	private String day;
	
	public CourseDateDTO() {}
	
	public CourseDateDTO(String courseCode, String day) {
		super();
		this.courseCode = courseCode;
		this.day = day;
	}
	public String getCourseDateCode() {
		return courseDateCode;
	}
	public void setCourseDateCode(String courseDateCode) {
		this.courseDateCode = courseDateCode;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	

}
