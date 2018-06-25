package kosta.spring.postIT.model.dao;

import java.util.List;

import kosta.spring.postIT.model.dto.AdsBannerDTO;

public interface AdsBannerDAO {
	
	int bannerInsert(AdsBannerDTO adsBannerDTO);
	
	List<AdsBannerDTO> bannerSelectList();
	
	int bannerDelete(String adsCode);
	
	AdsBannerDTO selectAds();
	
}
