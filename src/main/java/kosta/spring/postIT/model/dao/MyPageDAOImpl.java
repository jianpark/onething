package kosta.spring.postIT.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;
import kosta.spring.postIT.model.dto.CourseFavDTO;
import kosta.spring.postIT.model.dto.CourseRegistDTO;
import kosta.spring.postIT.model.dto.InterestedDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;
import kosta.spring.postIT.model.dto.PaymentDTO;
import kosta.spring.postIT.model.dto.TestProblemSolutionDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	SqlSession session;
	
	
	String courseCode;
	
	@Override
	public List<TestProblemSolutionDTO> selectProblems(String codeNum) {
		
		List<TestProblemSolutionDTO> list = session.selectList("myPageMapper.selectProblems",codeNum);
		
		
		return list;
	}

	@Override
	public int courseInsert(CourseDTO courseDTO) {
		int result =0;
		result += session.insert("myPageMapper.courseInsert", courseDTO);
		courseCode = session.selectOne("myPageMapper.getCourseCode");
		return result;
	}

	@Override
	public MenteeDTO selectMento(String userId) {
		MenteeDTO menteeDTO = session.selectOne("myPageMapper.memberInfoCollect", userId);
		return menteeDTO;
	}

	@Override
	public int courseDayInsert(String day) {
		
		CourseDateDTO courseDayDTO = new CourseDateDTO(courseCode,day);
				
		return session.insert("myPageMapper.courseDayInsert", courseDayDTO);
	}

	@Override
	public int interestUpdate(InterestedDTO interestedDTO) {
		// TODO Auto-generated method stub
		return session.update("myPageMapper.userInterUpdate",interestedDTO);
	}

	@Override
	public int memberUpdate(MenteeDTO menteeDTO) {
		return session.update("myPageMapper.userInfoUpdate", menteeDTO);
	}

	@Override
	public int insertPayment(PaymentDTO paymentDTO) {
		return session.insert("myPageMapper.paymentInsert", paymentDTO);
	}

	@Override
	public String getPayCode() {
		// TODO Auto-generated method stub
		return session.selectOne("myPageMapper.getRecentPayCode");
	}

	@Override
	public int insertCourseRegist(CourseRegistDTO courseRegistDTO) {
		return session.insert("myPageMapper.courseRegistInsert", courseRegistDTO);
	}

	/////////////////////////////////////////////////////////////////////////////////////
		
	@Override
	public List<CourseDTO> selectMentoStudy(String userId) {
		
		System.out.println("dao : "+session.selectList("myPageMapper.selectMento", userId));
		return session.selectList("myPageMapper.selectMento", userId);
		
	}
	
	@Override
	public List<CourseRegistDTO> selectMentee(String userId){
		
		return session.selectList("myPageMapper.selectMentee",userId);
		
	}
	@Override
	public int menteeStudyDelete(Map<String, String> map) {
	
		int re = session.delete("myPageMapper.menteeStudyDelete",map);
		
		return re;
	}
	@Override
	public int menteeStudyCurrentUpdate(String courseCode) {
		
		return session.update("myPageMapper.menteeStudyCurrentUpdate", courseCode);
		
	}
	
	@Override
	public List<CourseFavDTO> favStudySelect(String userId) {
		
		return session.selectList("myPageMapper.favStudySelect", userId);

	}
	
	@Override
	public int favStudyDelete(Map<String, String> map) {
		
		return session.delete("myPageMapper.favStudyDelete", map);
	
	}
	@Override
	public List<CourseDTO> selectMentoEx(String userId) {
		
		return session.selectList("myPageMapper.selectMentoEx", userId);
		
	}
	
	@Override
	public List<CourseRegistDTO> selectMenteeEx(String userId) {
		
		return session.selectList("myPageMapper.selectMenteeEx", userId);
		
	}
	
	@Override
	public CourseRegistDTO selectMenteeExByCourseCode(Map<String, String> map) {
		
		return session.selectOne("myPageMapper.selectMenteeExByCourseCode", map);
	}
	
	@Override
	public int insertReview(MentoReputationDTO mentoReputationDTO) {
		
		return session.insert("myPageMapper.insertReview", mentoReputationDTO);
		
	}
	
	@Override
	public MentoReputationDTO selectReview(MentoReputationDTO mentoReputationDTO) {
		
		return session.selectOne("myPageMapper.selectReview", mentoReputationDTO);

	}

	@Override
	public MentoDTO getMentoMajor(String userId) {
		// TODO Auto-generated method stub
		List<MentoDTO> mentoDTO = session.selectList("myPageMapper.getMajorMento",userId);

		return mentoDTO.get(0);
	}

	@Override
	public int insertApplicant(ApplicantDTO applicantDTO) {
		// TODO Auto-generated method stub
		return session.insert("myPageMapper.insertApplicant", applicantDTO);
	}

	@Override
	public int mentoDescUpdate(MentoDTO mentoDTO) {
		// TODO Auto-generated method stub
		return session.update("myPageMapper.description", mentoDTO);
	}

	@Override
	public String getMentoDesc(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("myPageMapper.getMentoDesc", userId);
	}
	
	
}
