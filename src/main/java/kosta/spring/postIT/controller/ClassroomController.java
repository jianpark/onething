package kosta.spring.postIT.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CrAsgnDTO;
import kosta.spring.postIT.model.dto.CrFeedbackDTO;
import kosta.spring.postIT.model.dto.CrNoticeDTO;
import kosta.spring.postIT.model.dto.CrNoticeReplyDTO;
import kosta.spring.postIT.model.dto.CrSubAsgnDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.service.ClassroomService;

@Controller
public class ClassroomController {

	@Autowired
	ClassroomService classroomService;

	@RequestMapping("cr/asgn/{url}")
	public String crMenteeAsgnUrl(@PathVariable String url) {
		return "mentee/classroom/crAsgn/" + url;
	}

	@RequestMapping("cr/mentoAsgn/{url}")
	public String crMentoAsgnUrl(@PathVariable String url) {
		return "mento/classroom/crAsgn/" + url;
	}

	@RequestMapping("cr/asgnUpdateForm/{url}/{crAsgnCode}")
	public String crMentoAsgnUpdateForm(@PathVariable String url, @PathVariable String crAsgnCode, Model model) {
		CrAsgnDTO crAsgnDTO = classroomService.selectAsgnNoJoin(crAsgnCode);
		model.addAttribute("crAsgnDTO", crAsgnDTO);
		return "mento/classroom/crAsgn/" + url;
	}

	@RequestMapping("cr/notice/{url}")
	public String crMenteeNoticeUrl(@PathVariable String url) {
		return "mentee/classroom/crNotice/" + url;
	}

	@RequestMapping("cr/mentoNotice/{url}")
	public String crMentoNoticeUrl(@PathVariable String url) {
		return "mento/classroom/crNotice/" + url;
	}

	@RequestMapping("cr/mentee/subAsgnForm/{crAsgnCode}/{crAsgnTitle}")
	public String crMenteeSubAsgnForm(Model model, @PathVariable String crAsgnCode, @PathVariable String crAsgnTitle) {
		model.addAttribute("crAsgnCode", crAsgnCode);
		model.addAttribute("crAsgnTitle", crAsgnTitle);
		return "mentee/classroom/crAsgn/subAsgnInsertForm";
	}

	@RequestMapping("cr/asgn/insert")
	public String insertAsgn(CrAsgnDTO crAsgnDTO) {
		classroomService.insertAsgn(crAsgnDTO);
		return "redirect:/cr/asgn/selectList";
	}

	@RequestMapping("cr/asgn/update")
	public String updateAsgn(CrAsgnDTO crAsgnDTO) {
		classroomService.updateAsgn(crAsgnDTO);
		return "redirect:/cr/asgn/selectList";
	}

	@RequestMapping("cr/asgn/delete/{crAsgnCode}")
	public String deleteAsgn(@PathVariable String crAsgnCode) {
		classroomService.deleteAsgn(crAsgnCode);
		return "redirect:/cr/asgn/selectList";
	}

	@RequestMapping("cr/asgn/selectList")
	public String asgnSelectList(HttpSession session, Model model) {
		MenteeDTO mento = classroomService.selectAsgnList((String) session.getAttribute("courseCode"));
		model.addAttribute("mento", mento);

		return "mentee/classroom/crAsgn/asgnSelectList";
	}

	@RequestMapping("cr/asgn/select/{crAsgnCode}/{userId}")
	public String selectAsgn(HttpSession session, Model model, @PathVariable String crAsgnCode
			, @PathVariable String userId) {
		MenteeDTO mento = classroomService.selectAsgn((String) session.getAttribute("courseCode"), crAsgnCode, true);
		model.addAttribute("crAsgnCode", crAsgnCode);
		model.addAttribute("mento", mento);

		model.addAttribute("crSubAsgnDTO", classroomService.selectSubAsgn(crAsgnCode, userId));

		// 해당 과제의 전체 과제제출리스트 출력
		model.addAttribute("crSubAsgnList", classroomService.selectSubAngnList(crAsgnCode));

		return "mentee/classroom/crAsgn/asgnDetail";

	}
	@RequestMapping("cr/asgn/select/{crAsgnCode}")
	public String selectAsgn(HttpSession session, Model model, @PathVariable String crAsgnCode)
	{
		MenteeDTO mento = classroomService.selectAsgn((String) session.getAttribute("courseCode"), crAsgnCode, true);
		model.addAttribute("crAsgnCode", crAsgnCode);
		model.addAttribute("mento", mento);

		// 해당 과제의 전체 과제제출리스트 출력
		model.addAttribute("crSubAsgnList", classroomService.selectSubAngnList(crAsgnCode));

		return "mentee/classroom/crAsgn/asgnDetail";

	}

	@RequestMapping("cr/subAsgn/insert")
	public String insertSubAsgn(CrSubAsgnDTO crSubAsgnDTO, HttpSession session) throws IllegalStateException, IOException {
		MultipartFile file = crSubAsgnDTO.getFile();
		String path = session.getServletContext().getRealPath("/resources/images/save/");

		if (file.getSize() > 0) {
			crSubAsgnDTO.setCrSubasgnFile(file.getOriginalFilename());
			file.transferTo(new File(path + "/" + file.getOriginalFilename()));
		}

		classroomService.insertSubAsgn(crSubAsgnDTO);
		return "redirect:/cr/asgn/select/" + crSubAsgnDTO.getCrAsgnCode()+"/"+crSubAsgnDTO.getUserId();
	}

	@RequestMapping("cr/subAsgn/update")
	public String updateSubAsgn(CrSubAsgnDTO crSubAsgnDTO, HttpSession session) throws IllegalStateException, IOException {
		MultipartFile file = crSubAsgnDTO.getFile();
		String path = session.getServletContext().getRealPath("/resources/images/save/");

		if (file.getSize() > 0) {
			crSubAsgnDTO.setCrSubasgnFile(file.getOriginalFilename());
			file.transferTo(new File(path + "/" + file.getOriginalFilename()));
		}

		classroomService.updateSubAsgn(crSubAsgnDTO);
		return "redirect:/cr/asgn/select/" + crSubAsgnDTO.getCrAsgnCode()+"/"+crSubAsgnDTO.getUserId();
	}

	@RequestMapping("cr/subAsgn/updateform/{crAsgnCode}/{userId}")
	public String moveUpdateForm(Model model, @PathVariable String crAsgnCode, @PathVariable String userId) {
		model.addAttribute("crSubAsgnDTO", classroomService.selectSubAsgn(crAsgnCode, userId));
		return "mentee/classroom/crAsgn/subAsgnUpdateForm";
	}

	@RequestMapping("cr/subAsgn/delete/{crAsgnCode}/{userId}")
	public String deleteSubAsgn(@PathVariable String crAsgnCode, @PathVariable String userId) {
		classroomService.deleteSubAsgn(crAsgnCode, userId);
		return "redirect:/cr/asgn/select/" + crAsgnCode+"/"+userId;
	}

	@RequestMapping("cr/asgn/subAsgnSelectForm/{crAsgnCode}/{userId}")
	public String moveSelectForm(Model model, @PathVariable String crAsgnCode, @PathVariable String userId) {
		model.addAttribute("crSubAsgnDTO", classroomService.selectSubAsgn(crAsgnCode, userId));
		
		MenteeDTO menteeDTO= classroomService.selectFeedback(classroomService.selectSubAsgn(crAsgnCode, userId));
		if(menteeDTO !=null) {
			CrFeedbackDTO crFeedbackDTO = menteeDTO.getFeedback();
			model.addAttribute("menteeDTO", menteeDTO);
			model.addAttribute("crFeedbackDTO", crFeedbackDTO);
		}
		
		
		
		return "mentee/classroom/crAsgn/subAsgnSelectForm";
	}

	@RequestMapping("cr/asgn/subAsgn/downLoad")
	public ModelAndView downLoad(HttpSession session, String fname) {
		String path = session.getServletContext().getRealPath("/resources/images/save/");
		return new ModelAndView("downLoadView", "fname", new File(path + "/" + fname));
	}

	@RequestMapping("cr/notice/insert")
	public String insertNotice(CrNoticeDTO crNoticeDTO) {
		classroomService.insertNotice(crNoticeDTO);
		return "redirect:/cr/notice/selectList";
	}

	@RequestMapping("cr/notice/updateForm/{crNoticeCode}")
	public String moveUpdateForm(Model model, @PathVariable String crNoticeCode) {
		model.addAttribute("crNoticeDTO", classroomService.selectNotice(crNoticeCode));
		return "mento/classroom/crNotice/noticeUpdateForm";
	}

	@RequestMapping("cr/notice/update")
	public String updateNotice(CrNoticeDTO crNoticeDTO) {
		classroomService.updateNotice(crNoticeDTO);
		return "redirect:/cr/notice/selectList";
	}

	@RequestMapping("cr/notice/delete/{crNoticeCode}")
	public String deleteNotice(@PathVariable String crNoticeCode) {
		System.out.println("-------------------" + crNoticeCode);
		classroomService.deleteNotice(crNoticeCode);
		return "redirect:/cr/notice/selectList";
	}

	@RequestMapping("cr/notice/selectList")
	public String selectNoticeList(HttpSession session, Model model) {
		MenteeDTO mento = classroomService.selectNoticeList((String) session.getAttribute("courseCode"));
		List<CrNoticeReplyDTO> crNoticeReplyList = classroomService.selectNoticeReply();
		model.addAttribute("mento", mento);
		model.addAttribute("noticeReplyList", crNoticeReplyList);
		
		saveCourseInfo(session);
		showDeadlineSubject(session);
		return "mentee/classroom/crNotice/noticeSelectList";
	}

	@RequestMapping("cr/noticeReply/insert")
	public String insertNoticeReply(CrNoticeReplyDTO crNoticeReplyDTO) {
		classroomService.insertNoticeReply(crNoticeReplyDTO);
		return "redirect:/cr/notice/selectList";
	}
	
	@RequestMapping("cr/feedback/insert")
	public String insertFeedback(CrFeedbackDTO crFeedbackDTO) {
		classroomService.insertFeedback(crFeedbackDTO);
		return "redirect:/cr/asgn/subAsgnSelectForm/"+crFeedbackDTO.getCrAsgnCode()+"/"+crFeedbackDTO.getUserId();
	}
	
	public void saveCourseInfo(HttpSession session) {
		String courseCode = (String)session.getAttribute("courseCode");
		CourseDTO courseDTO = classroomService.selectCourseInfo(courseCode);
		session.setAttribute("courseName", courseDTO.getCourseTitle());
		String startDate = courseDTO.getCourseStartDate().substring(0, 10);
		String endDate = courseDTO.getCourseEndDate().substring(0, 10);
		session.setAttribute("courseStartDate", startDate);
		session.setAttribute("courseEndDate", endDate);
		session.setAttribute("classroomMento", courseDTO.getUserId());
	}
	
	public void showDeadlineSubject(HttpSession session) {
		String courseCode = (String)session.getAttribute("courseCode");
		List<CrAsgnDTO> list = classroomService.selectDeadlineSubject(courseCode);
		session.setAttribute("deadlineList", list);
	}
	
}
