package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;

public interface CourseDAO {
	
	/**
	 * 스터디 상세페이지보기
	 */
	CourseDTO courseDetail(String courseCode);
	
	/**
	 * 찜하기 확인용
	 * @param userId를 가져가서 찜하기버튼 클릭시 DB에 해당내용 저장
	 * @return course_code를 가지고 나온다.
	 */
	String courseFav(String courseCode,String userId);
	
	/**
	 * 찜하기버튼용 Ajax 삭제하기
	 * @param userId
	 * @return 성공여부를 가지고 이동함
	 */
	int favDelete(String courseCode,String userId);
	
	/**
	 * 찜하기버튼용 Ajax 삽입하기
	 * @param userId
	 * @return 성공여부를 가지고 이동함
	 */
	int favInsert(String courseCode,String userId);
	
	/**
	 * 결재하기 확인용
	 */
	String coursePay(String courseCode,String userId);

	/**
	 * 스터디 요일 받아오기
	 */
	List<CourseDTO> courseDay(String courseCode);
	
	/**
	 * 강사리뷰
	 */
	List<MentoReputationDTO> courseReview(String courseCode);
	
	/**
	 * main강사리뷰
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
	 * 추천 스터디 조회
	 * */
	List<CourseDTO> selectCourseRecommend();
}
