package kosta.spring.postIT.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.service.AdsBannerService;
import kosta.spring.postIT.util.SavePath;

@Controller
public class AdsBannerController {

	@Autowired
	AdsBannerService adsBannerService;

	@RequestMapping("banner/selectList")
	public String moveSelectList(Model model) {
		List<AdsBannerDTO> adsList = adsBannerService.bannerSelectList();
		model.addAttribute("adsList", adsList);
		return "admin/banner/bannerSelectList";
	}

	@RequestMapping("admin/banner/bannerInsertForm")
	public String moveInsertForm() {
		return "admin/banner/bannerInsertForm";
	}

	@RequestMapping("admin/banner/register")
	public String bannerInsert(AdsBannerDTO adsBannerDTO, HttpSession session) throws IllegalStateException, IOException {
		String path = session.getServletContext().getRealPath("/resources/images/save/");
		System.out.println("controller È£Ãâ");
		MultipartFile file = adsBannerDTO.getFile();
		if (file.getSize() > 0) {
			adsBannerDTO.setAdsFileName(file.getOriginalFilename());
			file.transferTo(new File(path+file.getOriginalFilename()));
		}

		adsBannerService.bannerInsert(adsBannerDTO);
		return "redirect:/admin/banner/selectList";
	}


	@RequestMapping("admin/banner/selectList")
	public String bannerSelectList(Model model) {
		List<AdsBannerDTO> adsList = adsBannerService.bannerSelectList();
		model.addAttribute("adsList", adsList);
		return "admin/banner/bannerSelectList";
	}

	@RequestMapping("admin/banner/delete")
	public String bannerDelete(String adsCode) {
		adsBannerService.bannerDelete(adsCode);
		return "redirect:/admin/banner/selectList";
	}

}
