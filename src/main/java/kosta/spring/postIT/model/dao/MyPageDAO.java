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
	 * Database�� �����Ͽ� ������ �ҷ����ִ� �޼ҵ�
	 * @param codeNum ������ �ڵ带 String���� �޾ƿ��ش�.
	 * @return List�� ����� ��ȯ���ش�.
	 */
	public List<TestProblemSolutionDTO> selectProblems(String codeNum);
	
	/**
	 * course�� �߰��� ��, Mapper�� �������ִ� �޼ҵ�
	 * @param courseDTO Controller�������� �޾ƿ� ������ Service�� ���ļ� ���⿡ �����ߴ�.
	 * @return ����/���п��θ� int�� ��ȯ���ش�.
	 */
	public int courseInsert(CourseDTO courseDTO);
	
	/**
	 * ������ ���̽����� ����ID�� �ش��ϴ� ���� �����ͼ� �Ѱ��ش�.
	 * @param userId ���� �α��� �Ǿ� �ִ� ID���̴�.
	 * @return �ش� ȸ���� ������ �Ѱ��ش�
	 */
	public MenteeDTO selectMento(String userId);
	
	/**
	 * �ڽ��� �ش��ϴ� ���ϵ��� �־��ִ� �޼ҵ��̴�.
	 * @param day �ش��ϴ� �����̴�.
	 * @return ����/���п��θ� �������ش�.
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
	 * �������̺��� major�� ������ ���� �޼ҵ�.
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
