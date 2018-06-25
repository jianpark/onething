package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.dto.CourseDTO;

public interface DashBoardDAO {
	
	/**
	 * 스터디 소분류별 수익 표시
	 */
	List<CourseDTO> CourseBy (CourseDTO courseDTO);
	
	/**
	 * 멘토별 수익 표시
	 */
	List<CourseDTO> MentoBy(CourseDTO courseDTO);
	
	/**
	 * 광고별 수익표시
	 */
	List<AdsBannerDTO> Banner(AdsBannerDTO adsBannerDTO);
		
	/**
	 * 달별 수익 표시
	 */
	List<CourseDTO> MonthBy(CourseDTO courseDTO);
	
	/**
	 * 달별 광고 수익 표시
	 */
	List<AdsBannerDTO> MonthByBanner();
	
	/**
	 * 스터디 소분류별 Top수익표시
	 */
	List<CourseDTO> CourseByTop ();
	
	/**
	 * 멘토별 수익 표시
	 */
	List<CourseDTO> MentoByTop();
	
	/**
	 * 광고별 수익표시
	 */
	List<AdsBannerDTO> BannerTop();
	

}
