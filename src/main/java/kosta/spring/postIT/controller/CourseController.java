package kosta.spring.postIT.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;
import kosta.spring.postIT.model.service.AdsBannerService;
import kosta.spring.postIT.model.service.CourseService;

@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	AdsBannerService adsBannerService;

	@RequestMapping("/course/detail")
	public ModelAndView courseDetail(String courseCode) {
		
		ModelAndView mv = new ModelAndView();

		String userId =null;
		String userEmail = null;
		//회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		Object obj =SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(obj instanceof MenteeDTO) {	
			MenteeDTO pvo=(MenteeDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			userId = pvo.getUserId();
			mv.addObject("menteeDTO", pvo);
			//System.out.println("2. Spring Security 세션 수정 전 회원정보:" + pvo.getUserId());
		}
		
		
		//스터디기본정보
		CourseDTO courseDTO = courseService.courseDetail(courseCode);				
		mv.addObject("courseDTO", courseDTO);
		
		//찜하기확인
		if(userId!=null) {
			String courseFav = courseService.courseFav(courseCode,userId);
			mv.addObject("courseFav", courseFav);
		}
		
		//결재하기확인
		if(userId!=null) {
			String coursePay = courseService.coursePay(courseCode,userId);
			mv.addObject("coursePay", coursePay);
		}		
		
		//스터디 요일 확인
		List<CourseDTO> courseDayList = courseService.courseDay(courseCode);
		

		mv.addObject("courseDayList", courseDayList);

		//강사리뷰
		List<MentoReputationDTO> courseReviewList = courseService.courseReview(courseCode);

		mv.addObject("courseReviewList", courseReviewList);
		
		//광고사진 등록
		
		AdsBannerDTO adsBannerDTO = adsBannerService.selectAds();
		System.out.println("파일이름 :"+adsBannerDTO.getAdsFileName());
		if(adsBannerDTO!=null) {
			mv.addObject("adsImg", adsBannerDTO.getAdsFileName());
			mv.addObject("adsUrl", adsBannerDTO.getAdsLink());
		}
		
		mv.setViewName("common/courese/courseDetail"); // WEB-INF/views/common/course/courseDetail.jsp이동
		return mv;
		
	}
	
	//찜하기버튼용 Ajax삭제하기
	@RequestMapping("/course/favDelete")
	@ResponseBody
	public String favDelete(HttpServletRequest request) {

		return courseService.favDelete(request.getParameter("courseCode"),request.getParameter("id"));

	}
	
	//찜하기버튼용 Ajax삽입하기
	@RequestMapping("/course/favInsert")
	@ResponseBody
	public String favInsert(HttpServletRequest request) {
		
		return courseService.favInsert(request.getParameter("courseCode"),request.getParameter("id"));

	}
	
	//스터디 검색하기
	@RequestMapping("/course/search")
	public ModelAndView courseSearch(CourseDTO courseDTO, CourseDateDTO courseDateDTO) {
		/*System.out.println(courseDTO.getCourseLevel()+" | "+courseDTO.getCourseLoc()+" | "+courseDTO.getCourseSubGroup()
				+" | "+courseDateDTO.getDay());*/
		
		ModelAndView mv = new ModelAndView();	
		
		List<CourseDTO> courseListSelect = courseService.courseSearch(courseDTO,courseDateDTO);
		
		System.out.println("dd = " + courseListSelect.size());
		for(CourseDTO dto : courseListSelect) {
			System.out.println(dto.getCourseLevel()+" | "+ dto.getMenteeDTO().getUserPhoto()
					+" | "+dto.getCourseStartDate()+" | "+" | "+dto.getCourseSubGroup()+" | "+dto.getCourseLoc());
		}
		
		mv.addObject("courseListSelect", courseListSelect);
		
		mv.setViewName("common/courese/course"); // WEB-INF/views/common/course/courseDetail.jsp이동
		
		return mv;
	}
	
	//스터디 리스트 확인
	@RequestMapping("/course")
	public ModelAndView courseListSelect() {
		
		ModelAndView mv = new ModelAndView();	
		
		List<CourseDTO> courseListSelect = courseService.courseListSelect();
		
		/*System.out.println("dd = " + courseListSelect.size());
		for(CourseDTO dto : courseListSelect) {
			System.out.println(dto.getCourseLevel()+" | "+ dto.getMenteeDTO().getUserPhoto()
					+" | "+dto.getCourseStartDate()+" | "+" | "+dto.getCourseSubGroup()+" | "+dto.getCourseLoc());
		}*/
		
		mv.addObject("courseListSelect", courseListSelect);
		
		mv.setViewName("common/courese/course"); // WEB-INF/views/common/course/courseDetail.jsp이동
		
		return mv;
		
	}

	
}
