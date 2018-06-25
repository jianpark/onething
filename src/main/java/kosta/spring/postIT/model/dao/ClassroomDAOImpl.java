package kosta.spring.postIT.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CrAsgnDTO;
import kosta.spring.postIT.model.dto.CrFeedbackDTO;
import kosta.spring.postIT.model.dto.CrNoticeDTO;
import kosta.spring.postIT.model.dto.CrNoticeReplyDTO;
import kosta.spring.postIT.model.dto.CrSubAsgnDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;

@Repository
public class ClassroomDAOImpl implements ClassroomDAO {

	@Autowired
	SqlSession session;

	@Override
	public int insertAsgn(CrAsgnDTO crAsgnDTO) {
		return session.insert("classroomMapper.insertAsgn", crAsgnDTO);
	}

	@Override
	public int updateAsgn(CrAsgnDTO crAsgnDTO) {
		return session.update("classroomMapper.updateAsgn", crAsgnDTO);
	}

	@Override
	public int deleteAsgn(String crAsgnCode) {
		return session.delete("classroomMapper.deleteAsgn", crAsgnCode);
	}

	@Override
	public int asgnReadnumUpdate(String crAsgnCode) {
		return session.update("classroomMapper.asgnReadnumUpdate", crAsgnCode);
	}

	@Override
	public MenteeDTO selectAsgnList(String courseCode) {
		System.out.println("courseCode : " + courseCode);
		MenteeDTO MenteeDTO = session.selectOne("classroomMapper.selectAsgnList", courseCode);
		//System.out.println(MenteeDTO.getUserName());
		return MenteeDTO;
	}

	@Override
	public MenteeDTO selectAsgn(String courseCode) {
		return session.selectOne("classroomMapper.selectAsgn", courseCode);
	}

	@Override
	public CrAsgnDTO selectAsgnNoJoin(String crAsgnCode) {
		return session.selectOne("classroomMapper.selectAsgnNoJoin", crAsgnCode);
	}

	@Override
	public int insertSubAsgn(CrSubAsgnDTO crSubAsgnDTO) {
		return session.insert("classroomMapper.insertSubAsgn", crSubAsgnDTO);
	}

	@Override
	public int updateSubAsgn(CrSubAsgnDTO crSubAsgnDTO) {
		return session.update("classroomMapper.updateSubAsgn", crSubAsgnDTO);
	}

	@Override
	public int deleteSubAsgn(String crAsgnCode, String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("crAsgnCode", crAsgnCode);
		map.put("userId", userId);
		return session.delete("classroomMapper.deleteSubAsgn", map);
	}

	@Override
	public List<CrSubAsgnDTO> selectSubAngnList(String crAsgnCode) {
		return session.selectList("classroomMapper.selectSubAngnList", crAsgnCode);
	}

	@Override
	public CrSubAsgnDTO selectSubAsgn(String crAsgnCode, String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("crAsgnCode", crAsgnCode);
		map.put("userId", userId);
		return session.selectOne("classroomMapper.selectSubAngn", map);
	}

	@Override
	public int insertFeedback(CrFeedbackDTO crFeedbackDTO) {
		return session.insert("classroomMapper.insertFeedback", crFeedbackDTO);

	}

	@Override
	public int updateFeedback(CrFeedbackDTO crFeedbackDTO) {
		return session.update("classroomMapper.updateFeedback", crFeedbackDTO);

	}

	@Override
	public int deleteFeedback(String crFeedCode) {
		return session.delete("classroomMapper.deleteFeedback", crFeedCode);

	}

	@Override
	public MenteeDTO selectFeedback(CrSubAsgnDTO crSubAsgnDTO) {
		return session.selectOne("classroomMapper.selectFeedback", crSubAsgnDTO);
	}

	@Override
	public int insertNotice(CrNoticeDTO crNoticeDTO) {
		return session.insert("classroomMapper.insertNotice", crNoticeDTO);
	}

	@Override
	public MenteeDTO selectNoticeList(String courseCode) {
		MenteeDTO menteeDTO = session.selectOne("classroomMapper.selectNoticeList", courseCode);
		return menteeDTO;
	}

	@Override
	public int deleteNotice(String crNoticeCode) {
		return session.delete("classroomMapper.deleteNotice", crNoticeCode);
	}

	@Override
	public int updateNotice(CrNoticeDTO crNoticeDTO) {
		return session.update("classroomMapper.updateNotice", crNoticeDTO);
	}

	@Override
	public CrNoticeDTO selectNotice(String crNoticeCode) {
		return session.selectOne("classroomMapper.selectNotice", crNoticeCode);
	}

	@Override
	public int insertNoticeReply(CrNoticeReplyDTO crNoticeReplyDTO) {
		return session.insert("classroomMapper.insertNoticeReply", crNoticeReplyDTO);
	}

	@Override
	public List<CrNoticeReplyDTO> selectNoticeReply() {
		return session.selectList("classroomMapper.selectNoticeReply");
	}

	@Override
	public CourseDTO selectCourseInfo(String courseCode) {
		return session.selectOne("classroomMapper.selectCourseInfo", courseCode);
	}

	@Override
	public List<CrAsgnDTO> selectDeadlineSubject(String courseCode) {
		return session.selectList("classroomMapper.selectDeadlineSubject", courseCode);
	}

}
