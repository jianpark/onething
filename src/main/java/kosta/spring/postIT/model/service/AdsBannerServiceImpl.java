package kosta.spring.postIT.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.AdsBannerDAO;
import kosta.spring.postIT.model.dto.AdsBannerDTO;

@Service
public class AdsBannerServiceImpl implements AdsBannerService {
	
	@Autowired
	AdsBannerDAO adsBannerDAO;

	@Override
	public int bannerInsert(AdsBannerDTO adsBannerDTO) {
		return adsBannerDAO.bannerInsert(adsBannerDTO);
	}
	
	@Override
	public List<AdsBannerDTO> bannerSelectList() {
		return adsBannerDAO.bannerSelectList();
	}

	@Override
	public int bannerDelete(String adsCode) {
		return adsBannerDAO.bannerDelete(adsCode);
	}

	@Override
	public AdsBannerDTO selectAds() {
		return adsBannerDAO.selectAds();
	}

}
