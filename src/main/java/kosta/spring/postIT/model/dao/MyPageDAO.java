package kosta.spring.postIT.model.dao;

import java.util.List;
import java.util.Map;

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

public interface MyPageDAO {
	
	/**
	 * Database와 연동하여 값들을 불러와주는 메소드
	 * @param codeNum 고유의 코드를 String으로 받아와준다.
	 * @return List로 목록을 반환해준다.
	 */
	public List<TestProblemSolutionDTO> selectProblems(String codeNum);
	
	/**
	 * course를 추가할 때, Mapper와 연결해주는 메소드
	 * @param courseDTO Controller에서부터 받아온 값들이 Service를 거쳐서 여기에 도착했다.
	 * @return 성공/실패여부를 int로 반환해준다.
	 */
	public int courseInsert(CourseDTO courseDTO);
	
	/**
	 * 데이터 베이스에서 유저ID에 해당하는 값을 가져와서 넘겨준다.
	 * @param userId 현재 로그인 되어 있는 ID값이다.
	 * @return 해당 회원의 정보를 넘겨준다
	 */
	public MenteeDTO selectMento(String userId);
	
	/**
	 * 코스에 해당하는 요일들을 넣어주는 메소드이다.
	 * @param day 해당하는 요일이다.
	 * @return 성공/실패여부를 리턴해준다.
	 */
	public int courseDayInsert(String day);
	
	/**
	 * 
	 * @param interests
	 * @return
	 */
	public int interestUpdate(InterestedDTO interestedDTO);
	
	/**
	 * 
	 * @param menteeDTO
	 * @return
	 */
	public int memberUpdate(MenteeDTO menteeDTO);
	
	/**
	 * 
	 * @param paymentDTO
	 * @return
	 */
	public int insertPayment(PaymentDTO paymentDTO);
	
	/**
	 * 
	 * @return
	 */
	public String getPayCode();
	
	/**
	 * 
	 * @param courseRegistDTO
	 * @return
	 */
	public int insertCourseRegist(CourseRegistDTO courseRegistDTO);
	
	/**
	 * 멘토테이블에서 major를 가지고 오는 메소드.
	 * @param userId
	 * @return
	 */
	public MentoDTO getMentoMajor(String userId);
	
	/**
	 * insert values of applicant's from service into database table 
	 * @param applicantDTO
	 * @return
	 */
	public int insertApplicant(ApplicantDTO applicantDTO);
	
	/**
	 * 
	 * @param mentoDTO
	 * @return
	 */
	public int mentoDescUpdate(MentoDTO mentoDTO);
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public String getMentoDesc(String userId);
	//////////////////////////////////////////////////////////////////////////////////
	
	
	List<CourseDTO> selectMentoStudy(String userId);
	
	List<CourseRegistDTO> selectMentee(String userId);
	
	int menteeStudyDelete(Map<String,String> map);
	
	int menteeStudyCurrentUpdate(String courseCode);
	
	List<CourseFavDTO> favStudySelect(String userId);
	
	int favStudyDelete(Map<String,String> map);
	
	List<CourseDTO> selectMentoEx(String userId);
	
	List<CourseRegistDTO> selectMenteeEx(String userId);
	
	CourseRegistDTO selectMenteeExByCourseCode(Map<String,String> map);
	
	int insertReview(MentoReputationDTO mentoReputationDTO ); 
	
	MentoReputationDTO selectReview(MentoReputationDTO mentoReputationDTO);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
