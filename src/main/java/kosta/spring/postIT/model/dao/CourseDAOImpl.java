package kosta.spring.postIT.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.CourseDTO;
import kosta.spring.postIT.model.dto.CourseDateDTO;
import kosta.spring.postIT.model.dto.MentoReputationDTO;

@Repository
public class CourseDAOImpl implements CourseDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public CourseDTO courseDetail(String couseCode) {

		return session.selectOne("courseMapper.courseDetailAssociation", couseCode);
	}

	@Override
	public String courseFav(String couseCode,String userId) {
		Map<String, String> map = new HashMap<>();
		if(couseCode!=null) map.put("couseCode", couseCode);
		if(userId!=null) map.put("userId", userId);
		//if문 없어도 되는데, 필요없을때 map에 key설정해줄 필요는 없으니까 씀 
		//List<ProductDTO> list = session.selectList("productMapper.productSelect", map);

		 return session.selectOne("courseMapper.courseFav", map);
	}

	@Override
	public int favDelete(String couseCode,String userId) {
		Map<String, String> map = new HashMap<>();
		if(couseCode!=null) map.put("couseCode", couseCode);
		if(userId!=null) map.put("userId", userId);
		
		return session.delete("courseMapper.favDelete", map);
	}

	@Override
	public int favInsert(String couseCode,String userId) {
		//System.out.println("ser : "+couseCode);
		//System.out.println("seruserId : "+userId);
		Map<String, String> map = new HashMap<>();
		if(couseCode!=null) map.put("couseCode", couseCode);
		if(userId!=null) map.put("userId", userId);		
		//System.out.println("favInsert"+session.insert("courseMapper.favInsert", map));
		
		//int re = session.insert("courseMapper.favInsert", map);
		
		return session.insert("courseMapper.favInsert", map);
		//return re;
	}

	@Override
	public String coursePay(String courseCode, String userId) {
		
		Map<String, String> map = new HashMap<>();
		if(courseCode!=null) map.put("courseCode", courseCode);
		if(userId!=null) map.put("userId", userId);	
		
		return session.selectOne("courseMapper.coursePay", map);
	}

	@Override
	public List<CourseDTO> courseDay(String courseCode) {
		
		return session.selectList("courseMapper.courseDay", courseCode);
	}

	@Override
	public List<MentoReputationDTO> courseReview(String courseCode) {
		//System.out.println("CourseDAOImpl : "+courseCode);
		
		return session.selectList("courseMapper.courseReview", courseCode);
	}

	@Override
	public List<MentoReputationDTO> selectReputation() {
		
		return session.selectList("memberMapper.selectReputation");
	}

	@Override
	public List<CourseDTO> mainCourseSearch(String search) {
				
		return session.selectList("courseMapper.mainCourseSearch", search);
	}
	
	@Override
	public List<CourseDTO> courseListSelect() {
		
		//List<CourseDTO> courseListSelect =session.selectList("courseMapper.courseListSelect");
		
		return session.selectList("courseMapper.courseListSelect");
	}

	@Override
	public List<CourseDTO> courseSearch(CourseDTO courseDTO, CourseDateDTO courseDateDTO) {
		
		String courseLevel = courseDTO.getCourseLevel();
		String courseLoc = courseDTO.getCourseLoc();
		String courseSubGroup = courseDTO.getCourseSubGroup();
		String day = courseDateDTO.getDay();
		
		//System.out.println(courseLevel+"|"+courseLoc+"|"+courseSubGroup+"|"+day);
		
		Map<String, String> map = new HashMap<>();
		if(courseLevel!=null) map.put("courseLevel", courseLevel);
		if(courseLoc!=null) map.put("courseLoc", courseLoc);	
		if(courseSubGroup!=null) map.put("courseSubGroup", courseSubGroup);	
		if(day!=null) map.put("day", day);	
		
		return session.selectList("courseMapper.courseSeach",map);
	}

	@Override
	public List<CourseDTO> selectCourseRecommend() {
		
		return session.selectList("courseMapper.selectCourseRecommend");
	}

	
	
	
	

}
