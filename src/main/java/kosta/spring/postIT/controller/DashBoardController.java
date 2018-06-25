package kosta.spring.postIT.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.service.DashBoardService;

@Controller
public class DashBoardController {
	
	@Autowired
	private DashBoardService dashBoardService;
	
	@RequestMapping("/admin/dashboard/selectAll")
	public ModelAndView selectAll() {
		ModelAndView mv = new ModelAndView();
		
		//mv.addObject("courseByList", courseByList);
		
		mv.setViewName("admin/dashboard/selectAll"); // WEB-INF/views/admin/dashboard/selectGraph.jsp이동
				
		return mv;
	}

	@RequestMapping("/admin/dashboard/selectCourse")
	public ModelAndView dashboard() {
		
		ModelAndView mv = new ModelAndView();
		
		//mv.addObject("courseByList", courseByList);
		
		mv.setViewName("admin/dashboard/selectCourse"); // WEB-INF/views/admin/dashboard/selectCourse.jsp이동
				
		return mv;
	}
	
	@RequestMapping("/admin/dashboard/selectMento")
	public ModelAndView MenteeByForm() {
		
		ModelAndView mv = new ModelAndView();
		
		//mv.addObject("courseByList", courseByList);
		
		mv.setViewName("admin/dashboard/selectMento"); // WEB-INF/views/admin/dashboard/selectCourse.jsp이동
				
		return mv;
	}
	
	@RequestMapping("/admin/dashboard/selectByMonthYear")
	public ModelAndView selectByMonthYearForm(CourseDTO courseDTO) {
		
		ModelAndView mv = new ModelAndView();
		
		List<CourseDTO> MonthBy = dashBoardService.MonthBy(courseDTO);
		List<AdsBannerDTO> MonthByBanner = dashBoardService.MonthByBanner();
		
		mv.addObject("MonthBy", MonthBy);
		mv.addObject("MonthByBanner", MonthByBanner);
		
		mv.setViewName("admin/dashboard/selectByMonthYear"); // WEB-INF/views/admin/dashboard/selectCourse.jsp이동
				
		return mv;
	}
	
	@RequestMapping("/admin/dashboard/selectBanner")
	public ModelAndView selectBannerForm() {
		
		ModelAndView mv = new ModelAndView();
		
		//mv.addObject("courseByList", courseByList);
		
		mv.setViewName("admin/dashboard/selectBanner"); // WEB-INF/views/admin/dashboard/selectCourse.jsp이동
				
		return mv;
	}
	
	@RequestMapping("/admin/dashboardGraph")
	@ResponseBody
	public List<CourseDTO> courseBy(/*HttpServletRequest request,*/ CourseDTO courseDTO) {

		//String state = request.getParameter("state");
		
		System.out.println("dd: "+courseDTO.getCourseCode());
		
		List<CourseDTO> courseByList = dashBoardService.CourseBy(courseDTO);
		
	/*	System.out.println("dd = " + courseByList.size());
		for(CourseDTO dto : courseByList) {
			System.out.println(dto.getCourseSubGroup()+" | "+dto.getCoursePrice());
		}*/
	
		return courseByList;
	} 

	@RequestMapping("/admin/dashboard/selectMentoDashboardGraph")
	@ResponseBody
	public List<CourseDTO> MenteeBy(CourseDTO courseDTO) {
		//String state = request.getParameter("state");
		List<CourseDTO> MenteeBy = dashBoardService.MentoBy(courseDTO);
		
		/*System.out.println("dd = " + MenteeBy.size());
		for(CourseDTO dto : MenteeBy) {
			System.out.println(dto.getUserId()+" | "+dto.getCoursePrice());
		}*/

		return MenteeBy;
	}
	
	@RequestMapping("/admin/dashboard/selectBannerDashboardGraph")
	@ResponseBody
	public List<AdsBannerDTO> Banner(AdsBannerDTO adsBannerDTO) {
		//String state = request.getParameter("state");
		List<AdsBannerDTO> Banner = dashBoardService.Banner(adsBannerDTO);
		
		/*System.out.println("dd = " + Banner.size());
		for(AdsBannerDTO dto : Banner) {
			System.out.println(dto.getAdsName()+" | "+dto.getAdsPrice());
		}*/

		return Banner;
	}

	@RequestMapping("/admin/dashboard/selectByMonthDashboardGraph")
	@ResponseBody
	public List<CourseDTO> MonthBy(CourseDTO courseDTO) {
		//String state = request.getParameter("state");
		List<CourseDTO> MonthBy = dashBoardService.MonthBy(courseDTO);
		//List<AdsBannerDTO> MonthByBanner = dashBoardService.MonthByBanner();
		
		/*System.out.println("dd = " + MonthBy.size());
		for(CourseDTO dto : MonthBy) {
			System.out.println(dto.getCourseStartDate()+" | "+dto.getCoursePrice());
		}*/

		return MonthBy;
	}
	
	
	@RequestMapping("/admin/dashboardGraphTop")
	@ResponseBody
	public List<CourseDTO> courseByTop() {

		List<CourseDTO> courseByTopList = dashBoardService.CourseByTop();
		
		System.out.println("courseByTop = " + courseByTopList.size());
		for(CourseDTO dto : courseByTopList) {
			System.out.println(dto.getCourseSubGroup()+" | "+dto.getCoursePrice());
		}
	
		return courseByTopList;
	} 
	
	@RequestMapping("/admin/dashboard/selectMentoDashboardGraphTop")
	@ResponseBody
	public List<CourseDTO> MenteeByTop() {
		//String state = request.getParameter("state");
		List<CourseDTO> MenteeByTop = dashBoardService.MentoByTop();
		
		/*System.out.println("dd = " + MenteeBy.size());
		for(CourseDTO dto : MenteeBy) {
			System.out.println(dto.getUserId()+" | "+dto.getCoursePrice());
		}*/

		return MenteeByTop;
	}
	
	@RequestMapping("/admin/dashboard/selectBannerDashboardGraphTop")
	@ResponseBody
	public List<AdsBannerDTO> BannerTop() {
		//String state = request.getParameter("state");
		List<AdsBannerDTO> BannerTop = dashBoardService.BannerTop();
		
		/*System.out.println("dd = " + Banner.size());
		for(AdsBannerDTO dto : Banner) {
			System.out.println(dto.getAdsName()+" | "+dto.getAdsPrice());
		}*/

		return BannerTop;
	}
}
