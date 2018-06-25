package kosta.spring.postIT.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class AdsBannerDTO {
		private String adsCode;
		private String adsName;
		private String adsStartDate;
		private String adsEndDate;
		private String adsFileName;
		private String adsLink;
		private int adsPrice;
		
		private MultipartFile file;
		
		public AdsBannerDTO() {}

		public AdsBannerDTO(String adsCode, String adsName, String adsStartDate, String adsEndDate, String adsFileName,
				String adsLink, int adsPrice) {
			super();
			this.adsCode = adsCode;
			this.adsName = adsName;
			this.adsStartDate = adsStartDate;
			this.adsEndDate = adsEndDate;
			this.adsFileName = adsFileName;
			this.adsLink = adsLink;
			this.adsPrice = adsPrice;
		}

		public String getAdsCode() {
			return adsCode;
		}

		public void setAdsCode(String adsCode) {
			this.adsCode = adsCode;
		}

		public String getAdsName() {
			return adsName;
		}

		public void setAdsName(String adsName) {
			this.adsName = adsName;
		}

		public String getAdsStartDate() {
			return adsStartDate;
		}

		public void setAdsStartDate(String adsStartDate) {
			this.adsStartDate = adsStartDate;
		}

		public String getAdsEndDate() {
			return adsEndDate;
		}

		public void setAdsEndDate(String adsEndDate) {
			this.adsEndDate = adsEndDate;
		}

		public String getAdsFileName() {
			return adsFileName;
		}

		public void setAdsFileName(String adsFileName) {
			this.adsFileName = adsFileName;
		}

		public String getAdsLink() {
			return adsLink;
		}

		public void setAdsLink(String adsLink) {
			this.adsLink = adsLink;
		}

		public int getAdsPrice() {
			return adsPrice;
		}

		public void setAdsPrice(int adsPrice) {
			this.adsPrice = adsPrice;
		}
		
		public MultipartFile getFile() {
			return file;
		}
		
		public void setFile(MultipartFile file) {
			this.file = file;
		}

}
