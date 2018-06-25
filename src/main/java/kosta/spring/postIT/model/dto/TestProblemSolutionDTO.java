package kosta.spring.postIT.model.dto;

public class TestProblemSolutionDTO {

	private String tpsCode;
	private String testCode;
	private String tpsContent;
	private String tpsExam1;
	private String tpsExam2;
	private String tpsExam3;
	private String tpsExam4;
	private int tpsSolution;
	
	public TestProblemSolutionDTO() {}
	
	public TestProblemSolutionDTO(String tpsCode, String testCode, String tpsContent, String tpsExam1, String tpsExam2,
			String tpsExam3, String tpsExam4, int tpsSolution) {
		super();
		this.tpsCode = tpsCode;
		this.testCode = testCode;
		this.tpsContent = tpsContent;
		this.tpsExam1 = tpsExam1;
		this.tpsExam2 = tpsExam2;
		this.tpsExam3 = tpsExam3;
		this.tpsExam4 = tpsExam4;
		this.tpsSolution = tpsSolution;
	}
	
	public String getTpsCode() {
		return tpsCode;
	}
	public void setTpsCode(String tpsCode) {
		this.tpsCode = tpsCode;
	}
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}
	public String getTpsContent() {
		return tpsContent;
	}
	public void setTpsContent(String tpsContent) {
		this.tpsContent = tpsContent;
	}
	public String getTpsExam1() {
		return tpsExam1;
	}
	public void setTpsExam1(String tpsExam1) {
		this.tpsExam1 = tpsExam1;
	}
	public String getTpsExam2() {
		return tpsExam2;
	}
	public void setTpsExam2(String tpsExam2) {
		this.tpsExam2 = tpsExam2;
	}
	public String getTpsExam3() {
		return tpsExam3;
	}
	public void setTpsExam3(String tpsExam3) {
		this.tpsExam3 = tpsExam3;
	}
	public String getTpsExam4() {
		return tpsExam4;
	}
	public void setTpsExam4(String tpsExam4) {
		this.tpsExam4 = tpsExam4;
	}
	public int getTpsSolution() {
		return tpsSolution;
	}
	public void setTpsSolution(int tpsSolution) {
		this.tpsSolution = tpsSolution;
	}
	
	
	
	
}
