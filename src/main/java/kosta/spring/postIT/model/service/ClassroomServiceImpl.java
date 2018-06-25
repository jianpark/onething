package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.ClassroomDAO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CrAsgnDTO;
import kosta.spring.postIT.model.dto.CrFeedbackDTO;
import kosta.spring.postIT.model.dto.CrNoticeDTO;
import kosta.spring.postIT.model.dto.CrNoticeReplyDTO;
import kosta.spring.postIT.model.dto.CrSubAsgnDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;

@Service
public class ClassroomServiceImpl implements ClassroomService {
	
	@Autowired
	ClassroomDAO classroomDAO;
	
	@Override
	public int insertAsgn(CrAsgnDTO crAsgnDTO) {
		return classroomDAO.insertAsgn(crAsgnDTO);
	}

	@Override
	public int updateAsgn(CrAsgnDTO crAsgnDTO) {
		return classroomDAO.updateAsgn(crAsgnDTO);
	}

	@Override
	public int deleteAsgn(String crAsgnCode) {
		return classroomDAO.deleteAsgn(crAsgnCode);
	}

	@Override
	public MenteeDTO selectAsgnList(String courseCode) {
		return classroomDAO.selectAsgnList(courseCode);
	}

	@Override
	public MenteeDTO selectAsgn(String courseCode, String crAsgnCode, boolean state) {
		if (state) {
			int re = classroomDAO.asgnReadnumUpdate(crAsgnCode);
			if (re == 0) {
				//throw new RuntimeException("조회수 증가 오류입니다.");
			}
		}
		return classroomDAO.selectAsgn(courseCode);
	}

	@Override
	public CrAsgnDTO selectAsgnNoJoin(String crAsgnCode) {
		return classroomDAO.selectAsgnNoJoin(crAsgnCode);
	}
	
	@Override
	public int insertSubAsgn(CrSubAsgnDTO crSubAsgnDTO) {
		return classroomDAO.insertSubAsgn(crSubAsgnDTO);
	}

	@Override
	public int updateSubAsgn(CrSubAsgnDTO crSubAsgnDTO) {
		return classroomDAO.updateSubAsgn(crSubAsgnDTO);
	}

	@Override
	public int deleteSubAsgn(String crAsgnCode, String userId) {
		return classroomDAO.deleteSubAsgn(crAsgnCode,userId);
	}

	@Override
	public List<CrSubAsgnDTO> selectSubAngnList(String crAsgnCode) {
		return classroomDAO.selectSubAngnList(crAsgnCode);
	}

	@Override
	public CrSubAsgnDTO selectSubAsgn(String crAsgnCode, String userId) {
		return classroomDAO.selectSubAsgn(crAsgnCode,userId);
	}
	
	@Override
	public int insertFeedback(CrFeedbackDTO crFeedbackDTO) {
		return classroomDAO.insertFeedback(crFeedbackDTO);
	}

	@Override
	public int updateFeedback(CrFeedbackDTO crFeedbackDTO) {
		return classroomDAO.updateFeedback(crFeedbackDTO);
	}

	@Override
	public int deleteFeedback(String crFeedCode) {
		return classroomDAO.deleteFeedback(crFeedCode);
	}

	@Override
	public MenteeDTO selectFeedback(CrSubAsgnDTO crSubAsgnDTO){
		return classroomDAO.selectFeedback(crSubAsgnDTO);
	}

	@Override
	public int insertNotice(CrNoticeDTO crNoticeDTO) {
		return classroomDAO.insertNotice(crNoticeDTO);
	}

	@Override
	public MenteeDTO selectNoticeList(String courseCode) {
		return classroomDAO.selectNoticeList(courseCode);
	}

	@Override
	public int deleteNotice(String crNoticeCode) {
		return classroomDAO.deleteNotice(crNoticeCode);
	}

	@Override
	public int updateNotice(CrNoticeDTO crNoticeDTO) {
		return classroomDAO.updateNotice(crNoticeDTO);
	}

	@Override
	public CrNoticeDTO selectNotice(String crNoticeCode) {
		return classroomDAO.selectNotice(crNoticeCode);
	}

	@Override
	public int insertNoticeReply(CrNoticeReplyDTO crNoticeReplyDTO) {
		return classroomDAO.insertNoticeReply(crNoticeReplyDTO);
	}

	@Override
	public List<CrNoticeReplyDTO> selectNoticeReply() {
		return classroomDAO.selectNoticeReply();
	}

	@Override
	public CourseDTO selectCourseInfo(String courseCode) {
		return classroomDAO.selectCourseInfo(courseCode);
	}

	@Override
	public List<CrAsgnDTO> selectDeadlineSubject(String courseCode) {
		return classroomDAO.selectDeadlineSubject(courseCode);
	}
	
}
