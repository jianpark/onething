package kosta.spring.postIT.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class CrSubAsgnDTO {
	private String crAsgnCode;
	private String userId;
	private String crSubasgnTitle;
	private String crSubasgnContent;
	private String crSubasgnDate;
	
	private String crSubasgnFile;
	private MultipartFile file;
	
	public String getCrAsgnCode() {
		return crAsgnCode;
	}

	public void setCrAsgnCode(String crAsgnCode) {
		this.crAsgnCode = crAsgnCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCrSubasgnTitle() {
		return crSubasgnTitle;
	}

	public void setCrSubasgnTitle(String crSubasgnTitle) {
		this.crSubasgnTitle = crSubasgnTitle;
	}

	public String getCrSubasgnContent() {
		return crSubasgnContent;
	}

	public void setCrSubasgnContent(String crSubasgnContent) {
		this.crSubasgnContent = crSubasgnContent;
	}

	public String getCrSubasgnDate() {
		return crSubasgnDate;
	}

	public void setCrSubasgnDate(String crSubasgnDate) {
		this.crSubasgnDate = crSubasgnDate;
	}

	public String getCrSubasgnFile() {
		return crSubasgnFile;
	}

	public void setCrSubasgnFile(String crSubasgnFile) {
		this.crSubasgnFile = crSubasgnFile;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}