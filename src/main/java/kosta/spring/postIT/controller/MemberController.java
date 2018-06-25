package kosta.spring.postIT.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kosta.spring.postIT.model.dto.ApplicantDTO;
import kosta.spring.postIT.model.dto.InterestedDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;
import kosta.spring.postIT.model.service.MemberService;
import kosta.spring.postIT.model.service.SendEmail;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	/**
	 * ��Ƽ�����ϱ�
	 * @param ��Ƽ�� ���� ������ menteeDTO,interestedDTO �������� ����
	 * @return ȸ�������� �Ǹ� ������������ �̵�
	 */
	@RequestMapping(value="/join/Mentee",produces="text/html;charset=UTF-8")
	public String insertMentee(MenteeDTO menteeDTO,InterestedDTO interestedDTO) {
		
		//System.out.println("getUserId : "+menteeDTO.getUserId());
		
		memberService.insertMentee(menteeDTO,interestedDTO);
		
		return"redirect:/";
	}
	
	/**
	 * ���䰡���ϱ�
	 * @param ���信 ���� ������ menteeDTO,applicantDTO,file �������� ����(file�� �̷¼������� ���)
	 * @return ȸ�������� �Ǹ� ������������ �̵�
	 */
	@RequestMapping("/join/Mento")
	public String insertMento(MenteeDTO menteeDTO, ApplicantDTO applicantDTO, MultipartFile file, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/resources/images/save/");
		
		String fileName = file.getOriginalFilename();
		//System.out.println("fileName  : "+fileName);
		try {
			file.transferTo(new File(path+"/"+fileName)); //���Ͼ��ε� �Ϸ�
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		applicantDTO = new ApplicantDTO(applicantDTO.getUserId(),fileName,applicantDTO.getApplicantMajor()
				,applicantDTO.getApplicantMajor2(),applicantDTO.getApplicantMajor3(),"0" );
		
		memberService.insertMento(menteeDTO,applicantDTO);
		
		return"redirect:/";
	}
	
	/**
	 * ȸ�����Խ� id �ߺ�üũ
	 * @param AJAX�� ����Ͽ� id Ȯ��
	 * @return �񱳰� ������ AJAX�� ���ư�
	 */
	@RequestMapping("/idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		//System.out.println("idcheckAjax");
		return memberService.idcheck(request.getParameter("id"));
	}
	
	/**
	 * ��й�ȣ ã��
	 */
	@Autowired
	SendEmail sendEmail;
	
	@RequestMapping("/member/loginFind")
	@ResponseBody
	@Transactional
	public String loginFind(MenteeDTO menteeDTO) {
		
		String userName = menteeDTO.getUserName();
		String userEmail = menteeDTO.getUserEmail();
		
		String userId = memberService.selectSeachMember(userName,userEmail);
		
		if(userId!=null) {
			
			//�ӽú�й�ȣ ������
			int userPwd = sendEmail.SendEmailMethod(userId, userEmail);	
			
			//��ȣȭ�� ��й�ȣ�� �����ϱ�
			memberService.updateUserPwd(userId,Integer.toString(userPwd));
			
			return "ok";
		}
		return "fail";
		
	}
	
}
