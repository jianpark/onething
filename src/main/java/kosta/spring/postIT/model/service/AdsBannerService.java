package kosta.spring.postIT.model.service;

import java.util.List;

import kosta.spring.postIT.model.dto.AdsBannerDTO;

public interface AdsBannerService {
	
	int bannerInsert(AdsBannerDTO adsBannerDTO);
	
	List<AdsBannerDTO> bannerSelectList();
	
	int bannerDelete(String adsCode);
	
	AdsBannerDTO selectAds();

}
