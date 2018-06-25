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
	 * �׽�Ʈ���� Ŭ������ ��, �������� �ҷ����ִ� �޼ҵ�
	 * @param codeNum �������� �ش��ϴ� �ڵ带 String������ �޾ƿ´�.
	 * @return DAO���� �̾��� ������ List�� �������� �������ش�.
	 */
	public List<TestProblemSolutionDTO> selectProblem(String codeNum);
	
	/**
	 * �������������� ���°����� Ŭ������ ��, ���¸� �߰����ִ� �޼ҵ�.
	 * @param courseDTO view(courseAddition.jsp���� �޾ƿ� ����), List�� ������ String ������ �迭�� ��� �Ѱ��ش�
	 * @return ����/���� ���θ� int������ �������ش�.
	 */
	public int courseInsert(CourseDTO courseDTO,String[] list);
	
	/**
	 * ����� ȸ�������� �ҷ��� �ִ� �޼ҵ�.
	 * @return ����� ������ �Ѱ��ش�.
	 * @param userId ���� Ȥ�� Spring Security�� ����Ǿ� �ִ� ����ID�� �Ѱ��ش�.
	 * 		  
	 */
	public MenteeDTO selectMember(String userId);
	
	/**
	 * ������ ���� �� ���ɺо߸� �迭�� �޴� �޼ҵ�
	 * @param InterestedDTO interestedDTO ���ɺо߰� �迭�� �Ѿ�´�.
	 * @return ����/���� ���θ� �������� �Ѱ�����.
	 */
	public int updateInterested(InterestedDTO interestedDTO);
	
	/**
	 * ��Ƽ�� �������� ������Ʈ�� ���� �޼ҵ�
	 * @param menteeDTO ������ ������ DTO
	 * @return ����/���п��θ� �Ѱ��ش�.
	 */
	public int updateMenteeUserInfo(MenteeDTO menteeDTO);
	
	/**
	 * ���� API���� �޾ƿ� �������� �����ͺ��̽��� �߰����ִ� �޼ҵ�
	 * @param paymentDTO �Ķ���ͷ� �Ѿ�� ������ DTO�� �־ �Ѱ��ش�.
	 * @return ����/���� ���θ� int������ ��ȯ���ش�.
	 */
	public int insertPayment(PaymentDTO paymentDTO);
	
	/**
	 * ��� �߰��� pay_code�� �ҷ����� �޼ҵ�, �Ŀ� course_regist ���Կ� ���ȴ�.
	 * @return
	 */
	public String getPayCode();
	
	/**
	 * ������ course_regist�� �߰��Ͽ��ش�. 
	 * @param courseRegistDTO course_regist���̺� �� �߰��� �ʿ��� �μ���
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
	 * ���� �󼼼��� ������Ʈ
	 * @param mentoDTO
	 * @return
	 */
	public int mentoDescUpdate(MentoDTO mentoDTO);
	
	/**
	 * ���� �ڱ�Ұ� �������� �޼ҵ�.
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
