
package kosta.spring.postIT.model.dto;

public class CourseRegistDTO {

	private String registCode;
	private String courseCode;
	private String payCode;
	private String userId;
	
	private String state;
		
	private CourseDTO courseDTO;
	
	public CourseDTO getCourseDTO() {
		return courseDTO;
	}
	public void setCourseDTO(CourseDTO courseDTO) {
		this.courseDTO = courseDTO;
	}
	
	
		
	public CourseRegistDTO() {}
	public CourseRegistDTO(String courseCode, String payCode, String userId) {
		super();
		this.courseCode = courseCode;
		this.payCode = payCode;
		this.userId = userId;
	}

	public String getRegistCode() {
		return registCode;
	}
	public void setRegistCode(String registCode) {
		this.registCode = registCode;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
