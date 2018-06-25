package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.InterestedDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;


public interface MemberService {

	/**
	 * ȸ�����Խ� ����/��Ƽ�� �����ϱ� ��� insertMentee�� ����(������ ������ ����� �±��ϱ⶧����)
	 * @param ��Ƽ�� ���� ������ menteeDTO,interestedDTO �������� ����
	 * @return �������θ� ������ controller�� �̵�
	 */
	int insertMentee(MenteeDTO menteeDTO,InterestedDTO interestedDTO);
	
	/**
	 * ����� ���Խ� �ַºо� �߰�
	 * @param ���信 ���� ������ menteeDTO,applicantDTO�������� ����
	 * @return ȸ�������� �Ǹ� ������������ �̵�
	 */	
	int insertMento(MenteeDTO menteeDTO,ApplicantDTO applicantDTO);
	
	/**
	 * ȸ�����Խ� id �ߺ�üũ
	 */	
	String idcheck(String userId);
	
	/**
	 * mainȭ�� ���� ��Ƽ��
	 * */
	int selectCountMentee(MenteeDTO menteeDTO);
	
	/**
	 * mainȭ�� ���� �����
	 * */
	int selectCountMento(MentoDTO mentoDTO);
	
	/**
	 * ���� ���͵��
	 * */
	int selectCountCourse(CourseDTO courseDTO);
	
	/**
	 * ���� ����� ��ȸ
	 * */
	int selectCountReputation(MentoReputationDTO mentoReputationDTO);
	
	/**
	 * ȸ�����Ե� ������� Ȯ��
	 */
	String selectSeachMember(String userName, String userEmail);

	/**
	 * ��ȣȭ�� ��й�ȣ ����
	 */
	int updateUserPwd(String userId, String userPwd);
	
	/**
	 * main ����
	 * */
	MentoReputationDTO selectReputation(MentoReputationDTO mentoReputationDTO);
	
	/**
	 * ��Ƽ����Ȯ��
	 * */
	String isMenteeMentoCheck(String userid);
	
	/**
	 * ��������ȸ
	 * */
	List<ApplicantDTO> selectApplicant();
	
	/**
	 * ������ ���� update 
	 * */
	int applicantStatusUpdate(String userId, String selectBoxStatus);
	
	/**
	 * ������ ���� delete
	 * */
	int applicantStatusDelete(String userId);
	
	/**
	 * ������ ���� insert
	 * */
	int menteeRoleUpdate(String userId);
	
	/**
	 * notification ���� insert
	 * */
	int notificationInsert(String userId);
	
	/**
	 * notification ���� insert
	 * */
	int notificationInsertDeny(String userId);
	
	/**
	 * mento ���� �� applicant ���� select
	 * */
	ApplicantDTO beforeApplicantSelect(String userId);
	
	/**
	 * mento ���� �� mento ���� insert
	 * */
	int afterApplicantInsert(MentoDTO mentoDTO);
	
	int notificationInsert2(String userId);
	
}