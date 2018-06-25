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
	 * 회원가입시 멘토/멘티로 가입하기 모두 insertMentee로 진입(관리자 승인후 멘토로 승급하기때문에)
	 */
	int insertMentee(MenteeDTO menteeDTO);
	
	/**
	 * 멘티로 가입시 관심분야 추가
	 */	
	int insertMenteeInter(InterestedDTO interestedDTO);
	
	/**
	 * 회원가입시 id 중복체크
	 */	
	int idcheck(String userId);
	
	/**
	 * 멘토로 가입시 주력분야 추가
	 */	
	int insertMento(ApplicantDTO applicantDTO);
	
	/**
	 * 권한부여
	 */	
	int insertAuthority(String userId);
	
	/**
	 * 로그인시 사용
	 */	
	MenteeDTO selectMemberById(String userId);
	
	/**
	 * 누적 멘티 수 조회
	 * */
	int selectCountMentee(MenteeDTO menteeDTO);
	
	/**
	 * 누적 멘토 수 조회
	 * */
	int selectCountMento(MentoDTO mentoDTO);
	
	/**
	 * 누적 스터디 수 조회
	 * */
	int selectCountCourse(CourseDTO courseDTO);
	
	/**
	 * 누적 리뷰 수 조회
	 * */
	int selectCountReputation(MentoReputationDTO mentoReputationDTO);
	
		/**
	 * 회원가입된 멤버인지 확인
	 */
	String selectSeachMember(String userName, String userEmail);
	
	/**
	 * 암호화된 비밀번호 수정
	 */
	int updateUserPwd(String userId, String userPwd);
	
	
	/**
	 * main 수강생 강사 리뷰
	 * */
	MentoReputationDTO selectReputation(MentoReputationDTO mentoReputationDTO);
	
	/**
	 * 멘티/멘토 확인
	 * */
	String isMenteeMentoCheck(String userid);
	
	/**
	 * 전체 지원자 조회
	 * */
	List<ApplicantDTO> selectApplicant();
	
	/**
	 * 지원자 상태 insert
	 * */
	int applicantStatusUpdate(String userId, String selectBoxStatus);
	
	/**
	 * 지원자 상태 delete
	 * */
	int applicantStatusDelete(String userId);
	
	/**
	 * authority table update 
	 * */
	int menteeRoleUpdate(String userId);
	
	/**
	 * notification 승인 insert
	 * */
	int notificationInsert(String userId);
	
	/**
	 * notification 거절 insert
	 * */
	int notificationInsertDeny(String userId);
	
	/**
	 * mento 승인 전 applicant 정보 select
	 * */
	ApplicantDTO beforeApplicantSelect(String userId);
	
	/**
	 * mento 승인 후 mento 정보 insert
	 * */
	int afterApplicantInsert(MentoDTO mentoDTO);
	
	int notificationInsert2(String userId);

}
