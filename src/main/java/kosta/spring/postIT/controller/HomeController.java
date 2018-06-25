package kosta.spring.postIT.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CrAsgnDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;
import kosta.spring.postIT.model.service.CourseService;
import kosta.spring.postIT.model.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private CourseService courseService;
	
	
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		
		return "main/mainpage/index";
		
//		session.setAttribute("courseCode", "a1");
//		return "redirect:/cr/notice/selectList";
	}*/
	
	
	/**
	 * main
	 * */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView home(MenteeDTO menteeDTO, MentoDTO mentoDTO, CourseDTO courseDTO, MentoReputationDTO mentoReputationDTO, String userid) {
		ModelAndView mv = new ModelAndView();
		
		
		
		
		/**
		 * 누적 확인
		 * */
		
		int MenteeCount = memberService.selectCountMentee(menteeDTO);
		int MentoCount = memberService.selectCountMento(mentoDTO);
		int CourseCount = memberService.selectCountCourse(courseDTO);
		int RepCount = memberService.selectCountReputation(mentoReputationDTO);
		List<MentoReputationDTO> mentoRepList = courseService.selectReputation();
		List<CourseDTO> courseRecommedList=courseService.selectCourseRecommend();
		String isMenteeMentoCheck=memberService.isMenteeMentoCheck(userid);
		mv.addObject("MenteeCount", MenteeCount);
		mv.addObject("MentoCount", MentoCount);
		mv.addObject("CourseCount", CourseCount);
		mv.addObject("RepCount",RepCount);
		mv.addObject("mentoRepList", mentoRepList);
		mv.addObject("courseRecommedList", courseRecommedList);
		mv.addObject("isMenteeMentoCheck",isMenteeMentoCheck);
		mv.setViewName("main/mainpage/index");
		return mv;
	}
	
	@RequestMapping("/index")
	public String gohome() {
		return "main/mainpage/index";
	}
	
	@RequestMapping("/loginForm")
	public String login() {
		return "common/member/loginForm";
	}
	
	@RequestMapping("/loginFind")
	public String loginFind() {
		return "common/member/loginFind";
	}
	
	//jian
	
	@RequestMapping("/join")
	public String join() {

		return "common/member/join";
	}
	
	@RequestMapping("/joinMentee")
	public String joinMentee() {

		return "common/member/joinMentee";
	}
	
	@RequestMapping("/joinMento")
	public String joinMento() {

		return "common/member/joinMento";
	}

	
	@RequestMapping(value = "/classroom/{courseCode}")
	public String goClassroom(HttpSession session ,@PathVariable String courseCode) {
		session.setAttribute("courseCode", courseCode);
		return "redirect:/cr/notice/selectList";
	}
	
	/////////////////////////////////////////////////
	
	@RequestMapping("/admin")
	public String memberSelect() {
		
		return "admin/selectCourse";
	}
	
   @RequestMapping("/search")
   public ModelAndView search(String search) {
      List<CourseDTO> courseListSelect = courseService.mainCourseSearch(search);
      
      ModelAndView mv=new ModelAndView();
      
      mv.addObject("courseListSelect", courseListSelect);
      mv.setViewName("common/courese/course");
      return mv;
      
   }

	
}
