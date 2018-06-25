package kosta.spring.postIT.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.AdsBannerDTO;
import kosta.spring.postIT.model.dto.CourseDTO;

@Repository
public class DashBoardDAOImpl implements DashBoardDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CourseDTO> CourseBy(CourseDTO courseDTO) {
		
		String courseEndDate = courseDTO.getCourseEndDate();
		String courseStartDate = courseDTO.getCourseStartDate();
		
		Map<String, String> map = new HashMap<>();
		if(courseEndDate!=null) map.put("courseEndDate", courseEndDate);
		if(courseStartDate!=null) map.put("courseStartDate", courseStartDate);
		
		//selectCourse사용 날짜 선택
		if(courseDTO.getCourseEndDate()!=null) {			
			System.out.println(courseDTO.getCourseEndDate()+" |dd "+courseDTO.getCourseStartDate());
			return session.selectList("dashboardMapper.SearchCourseBy",map);
		}
		
		//selectAll사용 course 월별
		return session.selectList("dashboardMapper.CourseBy");
	}

	@Override
	public List<CourseDTO> MentoBy(CourseDTO courseDTO) {
		
		String courseEndDate = courseDTO.getCourseEndDate();
		String courseStartDate = courseDTO.getCourseStartDate();
		
		Map<String, String> map = new HashMap<>();
		if(courseEndDate!=null) map.put("courseEndDate", courseEndDate);
		if(courseStartDate!=null) map.put("courseStartDate", courseStartDate);
		
		//selectMento사용 날짜 선택
		if(courseDTO.getCourseEndDate()!=null) {			
			System.out.println(courseDTO.getCourseEndDate()+" |dd "+courseDTO.getCourseStartDate());
			return session.selectList("dashboardMapper.SearchMentoBy",map);
		}
		
		//selectAll사용 mentee 월별
		return session.selectList("dashboardMapper.MentoBy");
	}
	
	@Override
	public List<AdsBannerDTO> Banner(AdsBannerDTO adsBannerDTO) {
		String adsStartDate = adsBannerDTO.getAdsStartDate();
		String adsEndDate = adsBannerDTO.getAdsEndDate();
		
		Map<String, String> map = new HashMap<>();
		if(adsStartDate!=null) map.put("adsStartDate", adsStartDate);
		if(adsEndDate!=null) map.put("adsEndDate", adsEndDate);
		
		//selectBanner사용 날짜 선택
		if(adsBannerDTO.getAdsStartDate()!=null) {			
			System.out.println(adsBannerDTO.getAdsStartDate()+" |dd "+adsBannerDTO.getAdsEndDate());
			return session.selectList("dashboardMapper.SearchBanner",map);
		}
		
		//selectAll사용 banner 월별
		return session.selectList("dashboardMapper.Banner");
	}

	@Override
	public List<CourseDTO> MonthBy(CourseDTO courseDTO) {

		//selectAll사용 해당년 월별
		return session.selectList("dashboardMapper.MonthBy");
	}

	@Override
	public List<AdsBannerDTO> MonthByBanner() {
		
		return session.selectList("dashboardMapper.MonthBanner");
	}

	@Override
	public List<CourseDTO> CourseByTop() {

		return session.selectList("dashboardMapper.CourseByTop");
	}

	@Override
	public List<CourseDTO> MentoByTop() {

		return session.selectList("dashboardMapper.MentoByTop");
	}

	@Override
	public List<AdsBannerDTO> BannerTop() {

		return session.selectList("dashboardMapper.BannerTop");
	}

	
	
	
	
	

}
