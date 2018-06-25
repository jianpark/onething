package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CrAsgnDTO;
import kosta.spring.postIT.model.dto.CrFeedbackDTO;
import kosta.spring.postIT.model.dto.CrNoticeDTO;
import kosta.spring.postIT.model.dto.CrNoticeReplyDTO;
import kosta.spring.postIT.model.dto.CrSubAsgnDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;

public interface ClassroomService {
	
	//asgn
	
	int insertAsgn(CrAsgnDTO crAsgnDTO);

	int updateAsgn(CrAsgnDTO crAsgnDTO);

	int deleteAsgn(String crAsgnCode);

	MenteeDTO selectAsgnList(String courseCode);

	MenteeDTO selectAsgn(String courseCode, String crAsgnCode, boolean state);
	
	CrAsgnDTO selectAsgnNoJoin(String crAsgnCode);
	
	int insertSubAsgn(CrSubAsgnDTO crSubAsgnDTO);

	int updateSubAsgn(CrSubAsgnDTO crSubAsgnDTO);

	int deleteSubAsgn(String crAsgnCode, String userId);

	List<CrSubAsgnDTO> selectSubAngnList(String crAsgnCode);

	CrSubAsgnDTO selectSubAsgn(String crAsgnCode, String userId);

	int insertFeedback(CrFeedbackDTO crFeedbackDTO);

	int updateFeedback(CrFeedbackDTO crFeedbackDTO);

	int deleteFeedback(String crFeedCode);

	MenteeDTO selectFeedback(CrSubAsgnDTO crSubAsgnDTO);
	
	
	//notice
	int insertNotice(CrNoticeDTO crNoticeDTO);
	
	int updateNotice(CrNoticeDTO crNoticeDTO);
	
	int deleteNotice(String crNoticeCode);

	MenteeDTO selectNoticeList(String courseCode);
	
	CrNoticeDTO selectNotice(String crNoticeCode);
	
	int insertNoticeReply(CrNoticeReplyDTO crNoticeReplyDTO);
	
	List<CrNoticeReplyDTO> selectNoticeReply();
	
	CourseDTO selectCourseInfo(String courseCode);
	
	List<CrAsgnDTO> selectDeadlineSubject(String courseCode);

}
