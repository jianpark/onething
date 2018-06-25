package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.InterestedDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;

public interface MemberDAO {
	
	/**
	 * ȸ�����Խ� ����/��Ƽ�� �����ϱ� ��� insertMentee�� ����(������ ������ ����� �±��ϱ⶧����)
	 */
	int insertMentee(MenteeDTO menteeDTO);
	
	/**
	 * ��Ƽ�� ���Խ� ���ɺо� �߰�
	 */	
	int insertMenteeInter(InterestedDTO interestedDTO);
	
	/**
	 * ȸ�����Խ� id �ߺ�üũ
	 */	
	int idcheck(String userId);
	
	/**
	 * ����� ���Խ� �ַºо� �߰�
	 */	
	int insertMento(ApplicantDTO applicantDTO);
	
	/**
	 * ���Ѻο�
	 */	
	int insertAuthority(String userId);
	
	/**
	 * �α��ν� ���
	 */	
	MenteeDTO selectMemberById(String userId);
	
	/**
	 * ���� ��Ƽ �� ��ȸ
	 * */
	int selectCountMentee(MenteeDTO menteeDTO);
	
	/**
	 * ���� ���� �� ��ȸ
	 * */
	int selectCountMento(MentoDTO mentoDTO);
	
	/**
	 * ���� ���͵� �� ��ȸ
	 * */
	int selectCountCourse(CourseDTO courseDTO);
	
	/**
	 * ���� ���� �� ��ȸ
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
	 * main ������ ���� ����
	 * */
	MentoReputationDTO selectReputation(MentoReputationDTO mentoReputationDTO);
	
	/**
	 * ��Ƽ/���� Ȯ��
	 * */
	String isMenteeMentoCheck(String userid);
	
	/**
	 * ��ü ������ ��ȸ
	 * */
	List<ApplicantDTO> selectApplicant();
	
	/**
	 * ������ ���� insert
	 * */
	int applicantStatusUpdate(String userId, String selectBoxStatus);
	
	/**
	 * ������ ���� delete
	 * */
	int applicantStatusDelete(String userId);
	
	/**
	 * authority table update 
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
