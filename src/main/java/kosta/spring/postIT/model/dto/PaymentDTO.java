package kosta.spring.postIT.model.dto;

public class PaymentDTO {

	private String paidMethod;
	private String paidAmount;
	
	
	public PaymentDTO() {}
	public PaymentDTO(String paidMethod, String paidAmount) {
		super();
		this.paidMethod = paidMethod;
		this.paidAmount = paidAmount;
	}
	public String getPaidMethod() {
		return paidMethod;
	}
	public void setPaidMethod(String paidMethod) {
		this.paidMethod = paidMethod;
	}
	public String getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(String paidAmount) {
		this.paidAmount = paidAmount;
	}
	
	
}
