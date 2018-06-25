package kosta.spring.postIT.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.MentoDTO;
import kosta.spring.postIT.model.service.CourseService;
import kosta.spring.postIT.model.service.MemberService;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private CourseService courseService;
	@Autowired 
	private AdminService service;
	
	/**
	 * ������ list
	 * */
	@RequestMapping("/applicationSelect")
	public ModelAndView adminApplicant() {
		System.out.println("dd");
		ModelAndView mv = new ModelAndView();
		List<ApplicantDTO> selectApplicantList = memberService.selectApplicant();

		mv.addObject("selectApplicantList", selectApplicantList);	
		mv.setViewName("admin/adminpage/applicantSelectList");
		return mv;
	}
	/**
	 * ������ ���� update
	 * */
	@RequestMapping("/changeStatus")
	   public String changeApplicantStatus(String userId,String selectBox) {
	      
	      if(selectBox.equals("������οϷ�")) {
	         
	         System.out.println("userId: "+userId);
	         //notification �˸� ���� ȣ��
	         memberService.notificationInsert(userId);
	         
	         //authority ���� �����߰�
	         memberService.menteeRoleUpdate(userId);
	         
	         //mento �ش� applicant���� �Է� ���� ȣ��
	         ApplicantDTO applicantDTO = memberService.beforeApplicantSelect(userId);
	      
	         MentoDTO mentoDTO = new MentoDTO(userId, applicantDTO.getApplicantResume(), "������ �Ұ����ּ���.", 
	                                  applicantDTO.getApplicantMajor(), applicantDTO.getApplicantMajor2(), applicantDTO.getApplicantMajor3());
	         memberService.afterApplicantInsert(mentoDTO);
	         
	         //applicant �ش� ���ڵ� ���� ���� ȣ��
	         memberService.applicantStatusDelete(userId);
	                  
	      }else if(selectBox.equals("�����ɻ���")){
	         //notification �˸� ���� ȣ��
	         memberService.notificationInsert2(userId);
	      }else if(selectBox.equals("����")) {
	         
	         //notification �˸� ���� ȣ��
	         memberService.notificationInsertDeny(userId);
	         
	         //applicant �ش� ���ڵ� ���� ���� ȣ��
	         memberService.applicantStatusDelete(userId);
	                  
	      }
	      
	      memberService.applicantStatusUpdate(userId, selectBox);
	      return "redirect:/admin/applicationSelect";

	   }
	
	@RequestMapping("/menteeSelect") 
	public ModelAndView menteeSelect() {
		
		ModelAndView mv = new ModelAndView();
		
		List<MenteeDTO> list = service.menteeSelect();
		
		mv.addObject("list",list);	
		mv.setViewName("admin/memberMgr/menteeSelectList");
		
		return mv;
		
	}
	
	@RequestMapping("/menteeDelete") 
	public String menteeDelete(String userId) {

		int re = service.menteeDelete(userId);
		
		return "redirect:/admin/menteeSelect";
		
	}
	
	@RequestMapping("/mentoSelect")
	public ModelAndView mentoSelect() {
		
		ModelAndView mv = new ModelAndView();
		
		List<MentoDTO> list = service.mentoSelect();
		
		mv.addObject("list",list);
		mv.setViewName("admin/memberMgr/mentoSelectList");
		
		return mv;
	}
	
    @RequestMapping("/mentoDelete") 
	public String mentoDelete(String userId) {

		int re = service.mentoDelete(userId);
		
		return "redirect:/admin/mentoSelect";
		
	}
    
	@RequestMapping("/resumeDownLoad")
	public ModelAndView downLoad(HttpSession session, String fileName) {
		String path = session.getServletContext().getRealPath("/resources/images/save/");
		return new ModelAndView("downLoadView", "fname", new File(path + "/" + fileName));
	}
}
