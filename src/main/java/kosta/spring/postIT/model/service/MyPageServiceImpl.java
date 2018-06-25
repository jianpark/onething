package kosta.spring.postIT.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.MyPageDAO;
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

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageDAO myPageDAO;
	

	
	@Override
	public List<TestProblemSolutionDTO> selectProblem(String codeNum) {
		List<TestProblemSolutionDTO> list = myPageDAO.selectProblems(codeNum);
		
		return list;
	}

	@Override
	public int courseInsert(CourseDTO courseDTO,String[] list) {
		
		int result = 0;
		result += myPageDAO.courseInsert(courseDTO);
		
		for(String day:list) {
			result += myPageDAO.courseDayInsert(day);
		}
		
		return result;
	}

	@Override
	public MenteeDTO selectMember(String userId) {
		return myPageDAO.selectMento(userId);
	}

	@Override
	public int updateInterested(InterestedDTO interestedDTO) {
		
			myPageDAO.interestUpdate(interestedDTO);
		
		return 0;
	}

	@Override
	public int updateMenteeUserInfo(MenteeDTO menteeDTO) {
		
		return myPageDAO.memberUpdate(menteeDTO);
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public List<CourseDTO> selectMentoStudy(String userId) {
		MenteeDTO pvo=(MenteeDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
		if(!pvo.getUserId().equals(userId)) {//첫번째 인수는 평문, 두번째인수 암호화

			throw new RuntimeException("인증된 사용자를 다시 확인해주세요.");
		}
		
		return myPageDAO.selectMentoStudy(userId);

	}
	
	@Override
	public List<CourseRegistDTO> selectMentee(String userId) {
		
		return myPageDAO.selectMentee(userId);
		
	}

	@Override
	public int menteeStudyDelete(String userId, String courseCode) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("courseCode", courseCode);
		
		int re = myPageDAO.menteeStudyDelete(map);
		
		return re;
		
	}

	@Override
	public int menteeStudyCurrentUpdate(String courseCode) {
		
		return myPageDAO.menteeStudyCurrentUpdate(courseCode);
		
	}

	@Override
	public List<CourseFavDTO> favStudySelect(String userId) {
	
		return myPageDAO.favStudySelect(userId);

	}

	@Override
	public int favStudyDelete(String userId, String courseCode) {
		
		Map<String,String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("courseCode", courseCode);
		
		return myPageDAO.favStudyDelete(map);

	}

	@Override
	public List<CourseDTO> selectMentoEx(String userId) {
		
		return myPageDAO.selectMentoEx(userId);

	}

	@Override
	public List<CourseRegistDTO> selectMenteeEx(String userId) {
		
		return myPageDAO.selectMenteeEx(userId);

	}

	@Override
	public CourseRegistDTO selectMenteeExByCourseCode(String userId, String courseCode) {

		Map<String,String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("courseCode", courseCode);
		
		return myPageDAO.selectMenteeExByCourseCode(map);

	}

	@Override
	public int insertReview(MentoReputationDTO mentoReputationDTO) {
		
		return myPageDAO.insertReview(mentoReputationDTO);
		
	}

	@Override
	public MentoReputationDTO selectReview(MentoReputationDTO mentoReputationDTO) {
		
		return myPageDAO.selectReview(mentoReputationDTO);

	}


	@Override
	public int insertPayment(PaymentDTO paymentDTO) {
		
		return myPageDAO.insertPayment(paymentDTO);
	}

	@Override
	public String getPayCode() {
		// TODO Auto-generated method stub
		return myPageDAO.getPayCode();
	}

	@Override
	public int insertCourseRegist(CourseRegistDTO courseRegistDTO) {
		
		return myPageDAO.insertCourseRegist(courseRegistDTO);
	}

	@Override
	public MentoDTO getMentoMajor(String userId) {
		
		return myPageDAO.getMentoMajor(userId);
	}

	@Override
	public int insertApplicant(ApplicantDTO applicantDTO) {
		myPageDAO.insertApplicant(applicantDTO);
		return 0;
	}

	@Override
	public int mentoDescUpdate(MentoDTO mentoDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getMentoDesc(String userId) {
		// TODO Auto-generated method stub
		return myPageDAO.getMentoDesc(userId);
	}

}
