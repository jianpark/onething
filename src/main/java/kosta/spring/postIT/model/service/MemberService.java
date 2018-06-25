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
	 * 회원가입시 멘토/멘티로 가입하기 모두 insertMentee로 진입(관리자 승인후 멘토로 승급하기때문에)
	 * @param 멘티에 대한 내용을 menteeDTO,interestedDTO 형식으로 받음
	 * @return 성공여부를 가지고 controller로 이동
	 */
	int insertMentee(MenteeDTO menteeDTO,InterestedDTO interestedDTO);
	
	/**
	 * 멘토로 가입시 주력분야 추가
	 * @param 멘토에 대한 내용을 menteeDTO,applicantDTO형식으로 받음
	 * @return 회원가입이 되면 메인페이지로 이동
	 */	
	int insertMento(MenteeDTO menteeDTO,ApplicantDTO applicantDTO);
	
	/**
	 * 회원가입시 id 중복체크
	 */	
	String idcheck(String userId);
	
	/**
	 * main화면 누적 멘티수
	 * */
	int selectCountMentee(MenteeDTO menteeDTO);
	
	/**
	 * main화면 누적 멘토수
	 * */
	int selectCountMento(MentoDTO mentoDTO);
	
	/**
	 * 누적 스터디수
	 * */
	int selectCountCourse(CourseDTO courseDTO);
	
	/**
	 * 누적 리뷰수 조회
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
	 * main 리뷰
	 * */
	MentoReputationDTO selectReputation(MentoReputationDTO mentoReputationDTO);
	
	/**
	 * 멘티멘토확인
	 * */
	String isMenteeMentoCheck(String userid);
	
	/**
	 * 지원자조회
	 * */
	List<ApplicantDTO> selectApplicant();
	
	/**
	 * 지원자 상태 update 
	 * */
	int applicantStatusUpdate(String userId, String selectBoxStatus);
	
	/**
	 * 지원자 상태 delete
	 * */
	int applicantStatusDelete(String userId);
	
	/**
	 * 지원자 상태 insert
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