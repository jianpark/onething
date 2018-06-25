package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.spring.postIT.model.dao.AuthoritiesDAO;
import kosta.spring.postIT.model.dao.MemberDAO;
import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.AuthorityDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.InterestedDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;
import kosta.spring.postIT.model.util.RoleConstants;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
    private PasswordEncoder passworEncoder;
	
	@Autowired
	private AuthoritiesDAO authDAO;
	

	@Override
	@Transactional
	public int insertMentee(MenteeDTO menteeDTO,InterestedDTO interestedDTO) {
		
		//비밀번호를 암호화..
		menteeDTO.setUserPwd(passworEncoder.encode(menteeDTO.getUserPwd()));
		
		//member테이블에 insert
		memberDAO.insertMentee(menteeDTO);
		
		//권한 등록
		authDAO.insertAuthority(new AuthorityDTO(menteeDTO.getUserId(), RoleConstants.ROLE_MENTEE));
		
		//관심분야 등록
		memberDAO.insertMenteeInter(interestedDTO);

		//에러이동 추가 예정
		return 0;
	
	}


	@Override
	public String idcheck(String userId) {
		int count=memberDAO.idcheck(userId);
		return (count==0) ? "ok":"fail"; 
	}


	@Override
	@Transactional
	public int insertMento(MenteeDTO menteeDTO, ApplicantDTO applicantDTO) {
		
		//비밀번호를 암호화..
		menteeDTO.setUserPwd(passworEncoder.encode(menteeDTO.getUserPwd()));
		
		//member테이블에 insert
		memberDAO.insertMentee(menteeDTO);
		
		//권한 등록
		authDAO.insertAuthority(new AuthorityDTO(menteeDTO.getUserId(), RoleConstants.ROLE_MENTEE));

		//관심분야 등록
		memberDAO.insertMento(applicantDTO);
		
		//에러이동 추가 예정
		return 0;
	}


	@Override
	public int selectCountMentee(MenteeDTO menteeDTO) {
		return memberDAO.selectCountMentee(menteeDTO);
	}


	@Override
	public int selectCountMento(MentoDTO mentoDTO) {
		return memberDAO.selectCountMento(mentoDTO);
	}
	
	@Override
	public int selectCountCourse(CourseDTO courseDTO) {
		return memberDAO.selectCountCourse(courseDTO);
	}
	
	@Override
	public int selectCountReputation(MentoReputationDTO mentoReputationDTO) {
		return memberDAO.selectCountReputation(mentoReputationDTO);
	}

	@Override
	public String selectSeachMember(String userName, String userEmail) {		
		return memberDAO.selectSeachMember(userName,userEmail);
	}

	@Override
	public int updateUserPwd(String userId, String userPwd) {
		
		//비밀번호를 암호화..
		userPwd = passworEncoder.encode(userPwd);
		
		return memberDAO.updateUserPwd(userId,userPwd);
	}

	@Override
	public MentoReputationDTO selectReputation(MentoReputationDTO mentoReputationDTO) {
		return memberDAO.selectReputation(mentoReputationDTO);
	}


	@Override
	public String isMenteeMentoCheck(String userid) {
		
		return memberDAO.isMenteeMentoCheck(userid);
	}


	@Override
	public List<ApplicantDTO> selectApplicant() {
		
		return memberDAO.selectApplicant();
	}


	@Override
	public int applicantStatusUpdate(String userId, String selectBoxStatus) {
		
		return memberDAO.applicantStatusUpdate(userId,selectBoxStatus);
	}


	@Override
	public int applicantStatusDelete(String userId) {
	
		return memberDAO.applicantStatusDelete(userId);
	}


	@Override
	public int menteeRoleUpdate(String userId) {
		
		return memberDAO.menteeRoleUpdate(userId);
	}

	@Override
	public int notificationInsert(String userId) {
		
		return memberDAO.notificationInsert(userId);
		
	}


	@Override
	public int notificationInsertDeny(String userId) {
		
		return memberDAO.notificationInsertDeny(userId);
	}

	@Override
	public ApplicantDTO beforeApplicantSelect(String userId) {
		
		return memberDAO.beforeApplicantSelect(userId);
	}


	@Override
	public int afterApplicantInsert(MentoDTO mentoDTO) {
		
		return memberDAO.afterApplicantInsert(mentoDTO);
	}

   @Override
   public int notificationInsert2(String userId) {
      return memberDAO.notificationInsert2(userId);
   }
	
	


	
	

}
