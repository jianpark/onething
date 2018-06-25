package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.dto.CourseDTO;

public interface DashBoardService {
	
	/**
	 * ���͵� �Һз��� ���� �̾ƿ���
	 */
	List<CourseDTO> CourseBy (CourseDTO courseDTO);
	
	/**
	 * ���亰 ���� ǥ��
	 */
	List<CourseDTO> MentoBy(CourseDTO courseDTO);
	
	/**
	 * ���� ����ǥ��
	 */
	List<AdsBannerDTO> Banner(AdsBannerDTO adsBannerDTO);
	
	/**
	 * �޺� ���� ǥ��
	 */
	List<CourseDTO> MonthBy(CourseDTO courseDTO);
	
	/**
	 * �޺� ���� ���� ǥ��
	 */
	List<AdsBannerDTO> MonthByBanner();
	
	/**
	 * ���͵� �Һз��� ���� Top �̾ƿ���
	 */
	List<CourseDTO> CourseByTop ();
	
	/**
	 * ���亰 ���� ǥ��
	 */
	List<CourseDTO> MentoByTop();
	
	/**
	 * ���� ����ǥ��
	 */
	List<AdsBannerDTO> BannerTop();

}
