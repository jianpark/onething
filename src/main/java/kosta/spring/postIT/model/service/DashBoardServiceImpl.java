package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.DashBoardDAO;
import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.dto.CourseDTO;

@Service
public class DashBoardServiceImpl implements DashBoardService {

	@Autowired
	private DashBoardDAO dashBoardDAO;

	@Override
	public List<CourseDTO> CourseBy(CourseDTO courseDTO) {

		return dashBoardDAO.CourseBy(courseDTO);
	}

	@Override
	public List<CourseDTO> MentoBy(CourseDTO courseDTO) {

		return dashBoardDAO.MentoBy(courseDTO);
	}
	
	@Override
	public List<AdsBannerDTO> Banner(AdsBannerDTO adsBannerDTO) {
		
		return dashBoardDAO.Banner(adsBannerDTO);
	}

	@Override
	public List<CourseDTO> MonthBy(CourseDTO courseDTO) {

		return dashBoardDAO.MonthBy(courseDTO);
	}

	@Override
	public List<AdsBannerDTO> MonthByBanner() {
		
		return dashBoardDAO.MonthByBanner();
	}

	@Override
	public List<CourseDTO> CourseByTop() {

		return dashBoardDAO.CourseByTop();
	}

	@Override
	public List<CourseDTO> MentoByTop() {

		return dashBoardDAO.MentoByTop();
	}

	@Override
	public List<AdsBannerDTO> BannerTop() {

		return dashBoardDAO.BannerTop();
	}
	
	
	
	
}
