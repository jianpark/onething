package kosta.spring.postIT.model.dto;

public class CrAsgnDTO {
	
	private String crAsgnCode;
	private String courseCode;
	private String userId;
	private String crAsgnTitle;
	private String crAsgnDeadline;
	private String crAsgnDate;
	private String crAsgnContent;
	private int crAsgnReadnum;
	
	public String getCrAsgnCode() {
		return crAsgnCode;
	}
	public void setCrAsgnCode(String crAsgnCode) {
		this.crAsgnCode = crAsgnCode;
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
	public String getCrAsgnTitle() {
		return crAsgnTitle;
	}
	public void setCrAsgnTitle(String crAsgnTitle) {
		this.crAsgnTitle = crAsgnTitle;
	}
	public String getCrAsgnDeadline() {
		return crAsgnDeadline;
	}
	public void setCrAsgnDeadline(String crAsgnDeadline) {
		String arr[] = crAsgnDeadline.split(" ");
		this.crAsgnDeadline = arr[0];
	}
	public String getCrAsgnDate() {
		return crAsgnDate;
	}
	public void setCrAsgnDate(String crAsgnDate) {
		this.crAsgnDate = crAsgnDate;
	}
	public String getCrAsgnContent() {
		return crAsgnContent;
	}
	public void setCrAsgnContent(String crAsgnContent) {
		this.crAsgnContent = crAsgnContent;
	}
	public int getCrAsgnReadnum() {
		return crAsgnReadnum;
	}
	public void setCrAsgnReadnum(int crAsgnReadnum) {
		this.crAsgnReadnum = crAsgnReadnum;
	}
	
	
}
