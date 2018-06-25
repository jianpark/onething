package kosta.spring.postIT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.spring.postIT.model.dto.QnADTO;
import kosta.spring.postIT.model.service.QnAService;

@Controller
public class QnAController {
	
	@Autowired
	QnAService qnAService;
	
	@RequestMapping("/qna")
	public String moveQna(Model model) {
		List<QnADTO> list = qnAService.selectAll();
		List<QnADTO> repList = qnAService.selectRepAll();
		
		model.addAttribute("qnAList", list);
		model.addAttribute("repList", repList);
		return "common/qna/qnaMain";
	}
	
	@RequestMapping("/qna/insertQnAForm")
	public String moveQnAInsertForm() {
		return "common/qna/qnAInsertForm";
	}
	
	@RequestMapping("/qna/insertQnA")
	public String insertQnA(QnADTO qnADTO) {
		qnAService.insertQnA(qnADTO);
		return "redirect:/qna";
	}
	
	@RequestMapping("/qna/select/{qaCode}")
	public String select(Model model, @PathVariable String qaCode) {
		QnADTO qnADTO = qnAService.select(qaCode);
		model.addAttribute("qnADTO",qnADTO);
		return "common/qna/qnASelectForm";
	}
	
	@RequestMapping("/qna/delete/{qaCode}")
	public String delete(@PathVariable String qaCode) {
		qnAService.delete(qaCode);
		return "redirect:/qna";
	}
	
	@RequestMapping("/qna/updateQnAForm/{qaCode}")
	public String moveQnAUpdateForm(Model model, @PathVariable String qaCode) {
		QnADTO qnADTO = qnAService.select(qaCode);
		model.addAttribute("qnADTO",qnADTO);
		return "common/qna/qnAUpdateForm";
	}
	
	@RequestMapping("/qna/update")
	public String update(QnADTO qnADTO) {
		qnAService.update(qnADTO);
		return "redirect:/qna/select/"+qnADTO.getQaCode();
	}
	
	@RequestMapping("/qna/reqInsertForm/{qaCode}")
	public String moveRepForm(Model model, @PathVariable String qaCode) {
		model.addAttribute("qaCode", qaCode);
		return "common/qna/qnARepInsertForm";
	}
	
	@RequestMapping("/qna/reqInsert")
	public String insertReq(QnADTO qnADTO) {
		qnAService.insertRep(qnADTO);
		return "redirect:/qna";
	}
	
}
