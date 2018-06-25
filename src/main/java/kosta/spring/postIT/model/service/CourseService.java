package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;

public interface CourseService {

	/**
	 * ���͵� ������������
	 * @param String ���¹�ȣ��� ��
	 * @return CourseDTO ���͵� �󼼳��� �� ����Ұ������� ���� 
	 */
	CourseDTO courseDetail(String couseCode);
	
	/**
	 * ���ϱ�Ȯ��
	 */
	String courseFav(String couseCode, String userId);
	
	/**
	 * ���ϱ��ư�� Ajax�����ϱ�
	 * @param userId
	 * @return �������θ� ������ �̵���
	 */
	String favDelete(String couseCode,String userId);

	/**
	 * ���ϱ��ư�� Ajax �����ϱ�
	 * @param userId
	 * @return �������θ� ������ �̵���
	 */
	String favInsert(String couseCode,String userId);
	
	/**
	 * �����ϱ�Ȯ��
	 */
	String coursePay(String courseCode, String userId);
	
	/**
	 * ���͵� ����Ȯ���ϱ�
	 */
	List<CourseDTO> courseDay(String courseCode);
	
	/**
	 * ���� ����
	 */
	List<MentoReputationDTO> courseReview(String courseCode);
	
	/**
	 * main ������ȸ
	 * */
	List<MentoReputationDTO> selectReputation(); 
	
	/**
	 * main���°˻�
	 * */
	List<CourseDTO> mainCourseSearch(String search);
	
	
	/**
	 * ���͵� ��ü��ȸ
	 */
	List<CourseDTO> courseListSelect();
	
	/**
	 * ���͵� �˻�
	 */
	List<CourseDTO> courseSearch(CourseDTO courseDTO, CourseDateDTO courseDateDTO);
	
	/**
	 * ��õ����
	 * */
	List<CourseDTO> selectCourseRecommend();
	
	
	
}
