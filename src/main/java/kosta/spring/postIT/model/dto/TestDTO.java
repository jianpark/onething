package kosta.spring.postIT.model.dto;

public class TestDTO {

	private String testCode;
	private String testClassification;
	
	public TestDTO() {}
	
	public TestDTO(String testCode, String testClassification) {
		super();
		this.testCode = testCode;
		this.testClassification = testClassification;
	}
	
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}
	public String getTestClassification() {
		return testClassification;
	}
	public void setTestClassification(String testClassification) {
		this.testClassification = testClassification;
	}
	
	
}
