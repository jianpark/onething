package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.CourseDAO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDAO courseDAO;
	
	@Override
	public CourseDTO courseDetail(String couseCode) {
				
		return courseDAO.courseDetail(couseCode);
	}

	@Override
	public String courseFav(String couseCode, String userId) {

		return courseDAO.courseFav(couseCode,userId);

	}

	@Override
	public String favDelete(String couseCode,String userId) {
		int result=courseDAO.favDelete(couseCode, userId);
		return (result>0) ? "ok":"fail"; 
	}

	@Override
	public String favInsert(String couseCode, String userId) {
		int result=courseDAO.favInsert(couseCode, userId);

		return (result>0) ? "ok":"fail"; 
	}

	@Override
	public String coursePay(String courseCode, String userId) {

		return courseDAO.coursePay(courseCode,userId);
	}

	@Override
	public List<CourseDTO> courseDay(String courseCode) {
		
		return courseDAO.courseDay(courseCode);
	}

	@Override
	public List<MentoReputationDTO> courseReview(String courseCode) {

		return courseDAO.courseReview(courseCode);
	}

	@Override
	public List<MentoReputationDTO> selectReputation() {
		
		return courseDAO.selectReputation();
	}

	@Override
	public List<CourseDTO> mainCourseSearch(String search) {
		return courseDAO.mainCourseSearch(search);
	}
	
	@Override
	public List<CourseDTO> courseListSelect() {
		
		return courseDAO.courseListSelect();
	}

	@Override
	public List<CourseDTO> courseSearch(CourseDTO courseDTO, CourseDateDTO courseDateDTO) {
	
		return courseDAO.courseSearch(courseDTO,courseDateDTO);
	}

	@Override
	public List<CourseDTO> selectCourseRecommend() {
		
		return courseDAO.selectCourseRecommend();
	}

	
	
	

}
