package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.dto.CourseDTO;

public interface DashBoardService {
	
	/**
	 * 스터디 소분류별 매출 뽑아오기
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
	 * 스터디 소분류별 매출 Top 뽑아오기
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
