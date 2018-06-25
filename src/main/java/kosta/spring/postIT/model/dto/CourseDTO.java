package kosta.spring.postIT.model.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CourseDTO {

	private String courseCode;
	private String userId;
	private String courseTitle;
	private String courseTopGroup;
	private String courseSubGroup;
	private String courseDetail;
	private String courseLevel;
	private int courseRecruitMax;
	private int courseRecruitCurrent;
	private String courseRecruitPerid;
	private String courseStartDate;
	private String courseEndDate;
	private String courseFrequency;
	private String courseStartTime;
	private String courseEndTime;
	private String courseLoc;
	private int coursePrice;
	private String courseUrl;
	private String courseBackpic;
	
	private MultipartFile file;
	
	private MentoDTO mentoDTO; //1:1의 관계
	private MenteeDTO menteeDTO; //1:1의 관계
	
	private List<CourseDateDTO> courseDateDTO; //1:다인 경우
	private List<MenteeDTO> menteeListDTO; //1:다인 경우
	
	
	
	
	@Override
	public String toString() {
		return "CourseDTO [courseCode=" + courseCode + ", userId=" + userId + ", courseTitle=" + courseTitle
				+ ", courseTopGroup=" + courseTopGroup + ", courseSubGroup=" + courseSubGroup + ", courseDetail="
				+ courseDetail + ", courseLevel=" + courseLevel + ", courseRecruitMax=" + courseRecruitMax
				+ ", courseRecruitCurrent=" + courseRecruitCurrent + ", courseRecruitPerid=" + courseRecruitPerid
				+ ", courseStartDate=" + courseStartDate + ", courseEndDate=" + courseEndDate + ", courseFrequency="
				+ courseFrequency + ", courseStartTime=" + courseStartTime + ", courseEndTime=" + courseEndTime
				+ ", courseLoc=" + courseLoc + ", coursePrice=" + coursePrice + ", courseUrl=" + courseUrl
				+ ", courseBackpic=" + courseBackpic + ", file=" + file + ", mentoDTO=" + mentoDTO + ", menteeDTO="
				+ menteeDTO + ", courseDateDTO=" + courseDateDTO + ", menteeListDTO=" + menteeListDTO + "]";
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public CourseDTO() {}
	
	public CourseDTO(String courseCode, String userId, String courseTitle, String courseTopGroup, String courseSubGroup,
			String courseDetail, String courseLevel, int courseRecruitMax, int courseRecruitCurrent,
			String courseRecruitPerid, String courseStartDate, String courseEndDate, String courseFrequency,
			String courseStartTime, String courseEndTime, String courseLoc, int coursePrice, String courseUrl,
			String courseBackpic) {
		super();
		this.courseCode = courseCode;
		this.userId = userId;
		this.courseTitle = courseTitle;
		this.courseTopGroup = courseTopGroup;
		this.courseSubGroup = courseSubGroup;
		this.courseDetail = courseDetail;
		this.courseLevel = courseLevel;
		this.courseRecruitMax = courseRecruitMax;
		this.courseRecruitCurrent = courseRecruitCurrent;
		this.courseRecruitPerid = courseRecruitPerid;
		this.courseStartDate = courseStartDate;
		this.courseEndDate = courseEndDate;
		this.courseFrequency = courseFrequency;
		this.courseStartTime = courseStartTime;
		this.courseEndTime = courseEndTime;
		this.courseLoc = courseLoc;
		this.coursePrice = coursePrice;
		this.courseUrl = courseUrl;
		this.courseBackpic = courseBackpic;
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
	public String getCourseTitle() {
		return courseTitle;
	}
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	public String getCourseTopGroup() {
		return courseTopGroup;
	}
	public void setCourseTopGroup(String courseTopGroup) {
		this.courseTopGroup = courseTopGroup;
	}
	public String getCourseSubGroup() {
		return courseSubGroup;
	}
	public void setCourseSubGroup(String courseSubGroup) {
		this.courseSubGroup = courseSubGroup;
	}
	public String getCourseDetail() {
		return courseDetail;
	}
	public void setCourseDetail(String courseDetail) {
		this.courseDetail = courseDetail;
	}
	public String getCourseLevel() {
		return courseLevel;
	}
	public void setCourseLevel(String courseLevel) {
		this.courseLevel = courseLevel;
	}
	public int getCourseRecruitMax() {
		return courseRecruitMax;
	}
	public void setCourseRecruitMax(int courseRecruitMax) {
		this.courseRecruitMax = courseRecruitMax;
	}
	public int getCourseRecruitCurrent() {
		return courseRecruitCurrent;
	}
	public void setCourseRecruitCurrent(int courseRecruitCurrent) {
		this.courseRecruitCurrent = courseRecruitCurrent;
	}
	public String getCourseRecruitPerid() {
		return courseRecruitPerid;
	}
	public void setCourseRecruitPerid(String courseRecruitPerid) {
		this.courseRecruitPerid = courseRecruitPerid;
	}
	public String getCourseStartDate() {
		return courseStartDate;
	}
	public void setCourseStartDate(String courseStartDate) {
		this.courseStartDate = courseStartDate;
	}
	public String getCourseEndDate() {
		return courseEndDate;
	}
	public void setCourseEndDate(String courseEndDate) {
		this.courseEndDate = courseEndDate;
	}
	public String getCourseFrequency() {
		return courseFrequency;
	}
	public void setCourseFrequency(String courseFrequency) {
		this.courseFrequency = courseFrequency;
	}
	public String getCourseStartTime() {
		return courseStartTime;
	}
	public void setCourseStartTime(String courseStartTime) {
		this.courseStartTime = courseStartTime;
	}
	public String getCourseEndTime() {
		return courseEndTime;
	}
	public void setCourseEndTime(String courseEndTime) {
		this.courseEndTime = courseEndTime;
	}
	public String getCourseLoc() {
		return courseLoc;
	}
	public void setCourseLoc(String courseLoc) {
		this.courseLoc = courseLoc;
	}
	public int getCoursePrice() {
		return coursePrice;
	}
	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}
	public String getCourseUrl() {
		return courseUrl;
	}
	public void setCourseUrl(String courseUrl) {
		this.courseUrl = courseUrl;
	}
	public String getCourseBackpic() {
		return courseBackpic;
	}
	public void setCourseBackpic(String courseBackpic) {
		this.courseBackpic = courseBackpic;
	}
	public MentoDTO getMentoDTO() {
		return mentoDTO;
	}
	public void setMentoDTO(MentoDTO mentoDTO) {
		this.mentoDTO = mentoDTO;
	}
	public MenteeDTO getMenteeDTO() {
		return menteeDTO;
	}
	public void setMenteeDTO(MenteeDTO menteeDTO) {
		this.menteeDTO = menteeDTO;
	}
	public List<CourseDateDTO> getCourseDateDTO() {
		return courseDateDTO;
	}
	public void setCourseDateDTO(List<CourseDateDTO> courseDateDTO) {
		this.courseDateDTO = courseDateDTO;
	}
	public List<MenteeDTO> getMenteeListDTO() {
		return menteeListDTO;
	}
	public void setMenteeListDTO(List<MenteeDTO> menteeListDTO) {
		this.menteeListDTO = menteeListDTO;
	}
	
}
