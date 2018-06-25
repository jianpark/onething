package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;

public interface CourseDAO {
	
	/**
	 * ���͵� ������������
	 */
	CourseDTO courseDetail(String courseCode);
	
	/**
	 * ���ϱ� Ȯ�ο�
	 * @param userId�� �������� ���ϱ��ư Ŭ���� DB�� �ش系�� ����
	 * @return course_code�� ������ ���´�.
	 */
	String courseFav(String courseCode,String userId);
	
	/**
	 * ���ϱ��ư�� Ajax �����ϱ�
	 * @param userId
	 * @return �������θ� ������ �̵���
	 */
	int favDelete(String courseCode,String userId);
	
	/**
	 * ���ϱ��ư�� Ajax �����ϱ�
	 * @param userId
	 * @return �������θ� ������ �̵���
	 */
	int favInsert(String courseCode,String userId);
	
	/**
	 * �����ϱ� Ȯ�ο�
	 */
	String coursePay(String courseCode,String userId);

	/**
	 * ���͵� ���� �޾ƿ���
	 */
	List<CourseDTO> courseDay(String courseCode);
	
	/**
	 * ���縮��
	 */
	List<MentoReputationDTO> courseReview(String courseCode);
	
	/**
	 * main���縮��
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
	 * ��õ ���͵� ��ȸ
	 * */
	List<CourseDTO> selectCourseRecommend();
}
