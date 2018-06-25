package kosta.spring.postIT.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.spring.postIT.model.dto.AdsBannerDTO;

@Repository
public class AdsBannerDAOImpl implements AdsBannerDAO {
	
	@Autowired
	SqlSession session;
	
	@Override
	public int bannerInsert(AdsBannerDTO adsBannerDTO) {
		return session.insert("adsBannerMapper.bannerInsert", adsBannerDTO);
	}
	
	@Override
	public List<AdsBannerDTO> bannerSelectList() {
		return session.selectList("adsBannerMapper.bannerSelectList");
	}

	@Override
	public int bannerDelete(String adsCode) {
		return session.delete("adsBannerMapper.bannerDelete", adsCode);
	}

	@Override
	public AdsBannerDTO selectAds() {
		return session.selectOne("adsBannerMapper.selectAdsOne");
	}
}
