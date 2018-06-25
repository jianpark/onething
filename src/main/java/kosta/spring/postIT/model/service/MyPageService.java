package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseFavDTO;
import kosta.spring.postIT.model.dto.CourseRegistDTO;
import kosta.spring.postIT.model.dto.InterestedDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;
import kosta.spring.postIT.model.dto.PaymentDTO;
import kosta.spring.postIT.model.dto.TestProblemSolutionDTO;

public interface MyPageService {

	/**
	 * 테스트보기 클릭했을 때, 문제들을 불러와주는 메소드
	 * @param codeNum 소주제에 해당하는 코드를 String값으로 받아온다.
	 * @return DAO에서 뽑아진 값들을 List의 형식으로 리턴해준다.
	 */
	public List<TestProblemSolutionDTO> selectProblem(String codeNum);
	
	/**
	 * 마이페이지에서 강좌개설을 클릭했을 때, 강좌를 추가해주는 메소드.
	 * @param courseDTO view(courseAddition.jsp에서 받아온 값들), List는 요일을 String 값으로 배열에 담아 넘겨준다
	 * @return 성공/실패 여부를 int값으로 리턴해준다.
	 */
	public int courseInsert(CourseDTO courseDTO,String[] list);
	
	/**
	 * 저장된 회원정보를 불러와 주는 메소드.
	 * @return 저장된 정보를 넘겨준다.
	 * @param userId 세션 혹은 Spring Security에 저장되어 있는 유저ID를 넘겨준다.
	 * 		  
	 */
	public MenteeDTO selectMember(String userId);
	
	/**
	 * 멘토의 정보 중 관심분야를 배열로 받는 메소드
	 * @param InterestedDTO interestedDTO 관심분야가 배열로 넘어온다.
	 * @return 성공/실패 여부를 리턴으로 넘겨진다.
	 */
	public int updateInterested(InterestedDTO interestedDTO);
	
	/**
	 * 멘티의 개인정보 업데이트를 위한 메소드
	 * @param menteeDTO 정보를 저장한 DTO
	 * @return 성공/실패여부를 넘겨준다.
	 */
	public int updateMenteeUserInfo(MenteeDTO menteeDTO);
	
	/**
	 * 결제 API에서 받아온 정보들을 데이터베이스에 추가해주는 메소드
	 * @param paymentDTO 파라미터로 넘어온 값들을 DTO에 넣어서 넘겨준다.
	 * @return 성공/실패 여부를 int값으로 반환해준다.
	 */
	public int insertPayment(PaymentDTO paymentDTO);
	
	/**
	 * 방금 추가된 pay_code를 불러오는 메소드, 후에 course_regist 삽입에 사용된다.
	 * @return
	 */
	public String getPayCode();
	
	/**
	 * 값들을 course_regist에 추가하여준다. 
	 * @param courseRegistDTO course_regist테이블에 값 추가시 필요한 인수들
	 * @return
	 */
	public int insertCourseRegist(CourseRegistDTO courseRegistDTO);
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public MentoDTO getMentoMajor(String userId);
	
	/**
	 * to insert mento to applicant table
	 * @param applicantDTO get applicant's informations as applicantDTO
	 * @return success or fail to return
	 */
	public int insertApplicant(ApplicantDTO applicantDTO);
	
	/**
	 * 멘토 상세설명 업데이트
	 * @param mentoDTO
	 * @return
	 */
	public int mentoDescUpdate(MentoDTO mentoDTO);
	
	/**
	 * 멘토 자기소개 가져오는 메소드.
	 * @param userId
	 * @return
	 */
	public String getMentoDesc(String userId);
	//////////////////////////////////////////////////////////////////////////////////////
	
	List<CourseDTO> selectMentoStudy(String userId);
	
	List<CourseRegistDTO> selectMentee(String userid);
	
	int menteeStudyDelete(String userId, String courseCode);
	
	int menteeStudyCurrentUpdate(String courseCode);
	
	List<CourseFavDTO> favStudySelect(String userId);
	
	int favStudyDelete(String userId, String courseCode);
	
	List<CourseDTO> selectMentoEx(String userId);
	
	List<CourseRegistDTO> selectMenteeEx(String userId);
	
	CourseRegistDTO selectMenteeExByCourseCode(String userId, String courseCode);
	
	int insertReview(MentoReputationDTO mentoReputationDTO);
	
	MentoReputationDTO selectReview(MentoReputationDTO mentoReputationDTO);
}
