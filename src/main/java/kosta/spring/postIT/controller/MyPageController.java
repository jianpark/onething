package kosta.spring.postIT.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
import kosta.spring.postIT.model.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	MyPageService myPageService;

	List<TestProblemSolutionDTO> testProblemList;

	@RequestMapping("/myPage/studyInsert/insertForm")
	public String studyInsertForm(Model model) throws Exception {

		/**
		 * 여기서 아이디 값을 받아서 다오 가서 아이디 값 받아서 넘어온다. 아이디에 해당하는 정보들도 DTO에 넣어서 뷰로 뿌려준다. 정보는
		 * join으로 가져온다.
		 */
		String userId = null;

		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (obj instanceof MenteeDTO) {
			MenteeDTO pvo = (MenteeDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			userId = pvo.getUserId();
		}

		MenteeDTO menteeDTO = myPageService.selectMember(userId);
		MentoDTO mentoDTO = myPageService.getMentoMajor(userId);
		
		List<String> list = new ArrayList<String>();
		if(mentoDTO.getMentoMajor()!=null) {
			list.add(mentoDTO.getMentoMajor());
			if(mentoDTO.getMentoMajor2()!=null) {
				list.add(mentoDTO.getMentoMajor2());
				if(mentoDTO.getMentoMajor3()!=null) {
					list.add(mentoDTO.getMentoMajor3());
				}
			}
		}
		
		
		model.addAttribute("majorList", list);
		model.addAttribute("memberInfo", menteeDTO);

		return "mento/myPage/courseAdditionForm";
	}

	@RequestMapping("course/select/pay")
	public String paymentForm() {
		return "mentee/course/paymentForm";
	}

	@RequestMapping("myPage/profile/updateForm")
	public String infoUpdateForm(Model model,HttpServletRequest request) {
		String userId = null;


		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (obj instanceof MenteeDTO) {
			MenteeDTO pvo = (MenteeDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			userId = pvo.getUserId();
		}
		MenteeDTO menteeDTO = myPageService.selectMember(userId);
	
		String validation = request.getParameter("validation");

		
		if(validation !=null && validation.equals("Mento")) {
			String mentoDesc = myPageService.getMentoDesc(userId);
			MentoDTO mentoDTO = new MentoDTO();
			mentoDTO.setMentoDesc(mentoDesc);
			model.addAttribute("mentoDTO",mentoDTO);
		}
		
		model.addAttribute("memberInfo", menteeDTO);

		return "mentee/myPage/infoModification";
	}

	@RequestMapping("course/levelTest/choice")
	public String levelTestChoice() {
		return "mentee/levelTest/levelTestChoice";
	}

	@RequestMapping("course/levelTest/content")
	public String levelTest(HttpServletRequest request, Model model) {

		String codeName = request.getParameter("classification");
		testProblemList = myPageService.selectProblem(codeName);
		model.addAttribute("testProblemList", testProblemList);

		return "mentee/levelTest/levelTestContent";
	}

	@RequestMapping("course/levelTest/result")
	public String levelTestResult(HttpServletRequest request, Model model) {
		int count = 0;
		for (int j = 0; j < testProblemList.size(); j++) {
			if (testProblemList.get(j).getTpsSolution() == Integer
					.parseInt(request.getParameter(testProblemList.get(j).getTpsCode()))) {
				count++;
			}
		}
		model.addAttribute("result", count);

		return "mentee/levelTest/result";
	}

	@RequestMapping("myPage")
	public String mypPageMain(Model model) {

		return "mentee/myPage/myPageMain";
	}

	@RequestMapping("myPage/courseInsertConfirm")
	public String courseInsertConfirm(HttpServletRequest request, Model model, CourseDTO courseDTO, HttpSession session) throws Exception {
		String path = session.getServletContext().getRealPath("/resources/images/save/");
		MultipartFile file = courseDTO.getFile();
		if (courseDTO.getFile().getSize() > 0) {
			courseDTO.setCourseBackpic(file.getOriginalFilename());

			file.transferTo(new File(path + "/" + file.getOriginalFilename()));

		}
		String userId = null;
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (obj instanceof MenteeDTO) {
			MenteeDTO pvo = (MenteeDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			userId = pvo.getUserId();
		}
		String[] values = request.getParameterValues("classDay");
		courseDTO.setCourseFrequency(String.valueOf(values.length));
		courseDTO.setUserId(userId);
		/*
		 * CourseApplyDTO(String userId, String courseTitle, String courseSubGroup,
		 * String courseDetail, String courseLevel, int courseRecruitMax, String
		 * courseRecruitPerid, String courseStartDate, String courseEndDate, String
		 * courseFrequency, String courseStartTime, String courseEndTime, String
		 * courseLoc, int coursePrice, String courseUrl, String courseBackpic)
		 */

		int result = myPageService.courseInsert(courseDTO, values);
		model.addAttribute("result", result);

		return "redirect:/";
	}

	@RequestMapping("myPage/userUpdateResult")
	public String userUpdateResult(HttpServletRequest request, Model model, MenteeDTO menteeDTO, HttpSession session) throws Exception {
		String path = session.getServletContext().getRealPath("/resources/images/save/");
		MultipartFile file = menteeDTO.getFile();

		/*
		 * String userId = request.getParameter("userId"); String userName =
		 * request.getParameter("userName"); String userPhone =
		 * request.getParameter("contact"); String email =
		 * request.getParameter("email");
		 */

		InterestedDTO interestedDTO = new InterestedDTO();
		System.out.println(menteeDTO.toString());

		if (menteeDTO.getFile().getSize() > 0) {
			menteeDTO.setUserPhoto(file.getOriginalFilename());

			file.transferTo(new File(path + "/" + file.getOriginalFilename()));

		}

		interestedDTO.setUserId(menteeDTO.getUserId());
		
		String[] classes = request.getParameterValues("classification");
		if (classes.length >= 1) {
			interestedDTO.setInterField1(classes[0]);
			if (classes.length >= 2) {
				interestedDTO.setInterField2(classes[1]);
				if (classes.length >= 3) {
					interestedDTO.setInterField3(classes[2]);
				}
			}
		}

		if (request.getParameter("description") != null) {
			String userId = menteeDTO.getUserId();
			String mentoDesc = request.getParameter("description");

			MentoDTO mentoDTO = new MentoDTO();
			mentoDTO.setMentoDesc(mentoDesc);
			mentoDTO.setUserId(userId);
			
			myPageService.mentoDescUpdate(mentoDTO);
			
		}
		myPageService.updateMenteeUserInfo(menteeDTO);

		myPageService.updateInterested(interestedDTO);

		model.addAttribute("MenteeDTO", menteeDTO);

		return "redirect:/";
	}

	@RequestMapping("course/payConfirm")
	public String payConfirm(HttpServletRequest request, Model model) {

		String userId = request.getParameter("id");
		String courseCode = request.getParameter("courseCode");
		String paidAmount = request.getParameter("paidAmount");
		String paidMethod = request.getParameter("paidMethod");

		/**
		 * payment테이블에 데이터 추가.
		 */
		PaymentDTO paymentDTO = new PaymentDTO(paidMethod, paidAmount);
		int result = myPageService.insertPayment(paymentDTO);

		/**
		 * course_regist에 데이터 추가.
		 * 
		 */
		String payCode = myPageService.getPayCode();
		CourseRegistDTO courseRegistDTO = new CourseRegistDTO(courseCode, payCode, userId);
		myPageService.insertCourseRegist(courseRegistDTO);
		return "main/mainpage/index";
	}

	////////////////////////////////////////////////////////////////////////////
	///////// studySelect

	@RequestMapping("/myPage/study/select")
	public ModelAndView studySelect(String userId) {

		ModelAndView mv = new ModelAndView();

		List<CourseDTO> mentoList = myPageService.selectMentoStudy(userId);

		List<CourseRegistDTO> menteeList = myPageService.selectMentee(userId);

		// System.out.println(menteeList.get(0));

		mv.addObject("userId", userId);
		mv.addObject("mentoList", mentoList);
		mv.addObject("menteeList", menteeList);

		mv.setViewName("mentee/myPage/select");

		return mv;
	}

	@RequestMapping("/myPage/study/delete")
	public String menteeStudyDelete(String userId, String courseCode) {

		int re = myPageService.menteeStudyDelete(userId, courseCode);

		int re2 = myPageService.menteeStudyCurrentUpdate(courseCode);

		return "forward:/myPage/study/select";

	}

	@RequestMapping("/myPage/favStudy/select")
	public ModelAndView favStudySelect(String userId) {

		ModelAndView mv = new ModelAndView();

		List<CourseFavDTO> favList = myPageService.favStudySelect(userId);
		MenteeDTO menteeDTO = myPageService.selectMember(userId);
		
		mv.addObject("menteeDTO",menteeDTO);
		mv.addObject("favList", favList);
		mv.addObject("userId", userId);
		mv.setViewName("mentee/myPage/selectFav");

		return mv;
	}

	@RequestMapping("/myPage/favStudy/delete")
	public String favStudyDelete(String userId, String courseCode) {

		int re = myPageService.favStudyDelete(userId, courseCode);

		return "forward:/myPage/favStudy/select";

	}

	@RequestMapping("/myPage/exStudy/select")
	public ModelAndView exStudySelect(String userId) {

		ModelAndView mv = new ModelAndView();

		List<CourseDTO> mentoExList = myPageService.selectMentoEx(userId);

		List<CourseRegistDTO> menteeExList = myPageService.selectMenteeEx(userId);

		// System.out.println(menteeList.get(0));

		mv.addObject("userId", userId);
		mv.addObject("mentoExList", mentoExList);
		mv.addObject("menteeExList", menteeExList);

		mv.setViewName("mentee/myPage/selectEx");

		return mv;
	}

	@RequestMapping("/myPage/exStudy/reviewInsertForm")
	public ModelAndView exStudyReviewInsertForm(String userId, String courseCode) {

		ModelAndView mv = new ModelAndView();

		CourseRegistDTO courseRegistDTO = myPageService.selectMenteeExByCourseCode(userId, courseCode);

		mv.addObject("courseRegistDTO", courseRegistDTO);
		mv.setViewName("mentee/myPage/reviewInsertForm");

		return mv;
	}

	@RequestMapping("/myPage/exStudy/reviewInsert")
	public ModelAndView exStudyReviewInsert(MentoReputationDTO mentoReputationDTO)// userId
	{
		ModelAndView mv = new ModelAndView();

		int re = myPageService.insertReview(mentoReputationDTO);

		// MentoReputationDTO mentoReputationDTODB =
		// service.selectReview(mentoReputationDTO);

		List<CourseDTO> mentoExList = myPageService.selectMentoEx(mentoReputationDTO.getRepWriter());

		List<CourseRegistDTO> menteeExList = myPageService.selectMenteeEx(mentoReputationDTO.getRepWriter());

		mv.addObject("userId", mentoReputationDTO.getRepWriter());
		mv.addObject("mentoExList", mentoExList);
		mv.addObject("menteeExList", menteeExList);

		mv.setViewName("mentee/myPage/selectEx");

		return mv;

	}

	@RequestMapping("myPage/insertApplicantForm")
	public String insertApplicantForm(Model model) {

		String userId = null;

		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (obj instanceof MenteeDTO) {
			MenteeDTO pvo = (MenteeDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			userId = pvo.getUserId();
		}
		MenteeDTO menteeDTO = myPageService.selectMember(userId);
		model.addAttribute("menteeDTO", menteeDTO);

		return "mentee/myPage/applicantForm";
	}

	@RequestMapping("myPage/insertApplicant")
	public String insertApplicant(ApplicantDTO applicantDTO, HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String path = session.getServletContext().getRealPath("/resources/images/save/");

		MultipartFile file = applicantDTO.getFile();

		if (applicantDTO.getFile().getSize() > 0) {
			applicantDTO.setApplicantResume(file.getOriginalFilename());

			file.transferTo(new File(path + "/" + file.getOriginalFilename()));

		}

		String[] classes = request.getParameterValues("classification");
		System.out.println(classes.length);
		if (classes.length>=1) {
			System.out.println(classes[0]);
			applicantDTO.setApplicantMajor(classes[0]);
			if (classes.length>=2) {
				System.out.println(classes[1]);
				applicantDTO.setApplicantMajor2(classes[1]);
				if (classes.length>=3) {
					System.out.println(classes[2]);
					applicantDTO.setApplicantMajor3(classes[2]);
				}
			}
		}

		myPageService.insertApplicant(applicantDTO);

		model.addAttribute("applicant", applicantDTO);

		//return "mentee/myPage/applicantRequested";
		return "redirect:/";
	}

}
