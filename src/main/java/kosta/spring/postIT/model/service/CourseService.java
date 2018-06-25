package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;

public interface CourseService {

	/**
	 * 스터디 상세페이지보기
	 * @param String 강좌번호들고 들어감
	 * @return CourseDTO 스터디 상세내용 및 강사소개가지고 나옴 
	 */
	CourseDTO courseDetail(String couseCode);
	
	/**
	 * 찜하기확인
	 */
	String courseFav(String couseCode, String userId);
	
	/**
	 * 찜하기버튼용 Ajax삭제하기
	 * @param userId
	 * @return 성공여부를 가지고 이동함
	 */
	String favDelete(String couseCode,String userId);

	/**
	 * 찜하기버튼용 Ajax 삽입하기
	 * @param userId
	 * @return 성공여부를 가지고 이동함
	 */
	String favInsert(String couseCode,String userId);
	
	/**
	 * 결재하기확인
	 */
	String coursePay(String courseCode, String userId);
	
	/**
	 * 스터디 요일확인하기
	 */
	List<CourseDTO> courseDay(String courseCode);
	
	/**
	 * 강사 리뷰
	 */
	List<MentoReputationDTO> courseReview(String courseCode);
	
	/**
	 * main 리뷰조회
	 * */
	List<MentoReputationDTO> selectReputation(); 
	
	/**
	 * main강좌검색
	 * */
	List<CourseDTO> mainCourseSearch(String search);
	
	
	/**
	 * 스터디 전체조회
	 */
	List<CourseDTO> courseListSelect();
	
	/**
	 * 스터디 검색
	 */
	List<CourseDTO> courseSearch(CourseDTO courseDTO, CourseDateDTO courseDateDTO);
	
	/**
	 * 추천강좌
	 * */
	List<CourseDTO> selectCourseRecommend();
	
	
	
}
