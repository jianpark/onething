<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
 

    <section class="contact-page inner-page">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="title inner-page-title">
                        <h1>스터디 정보</h1>
                    </div>
                    <div class="contact-info">
                    <div style="padding-right: 30px">
                    <div class="event-sidebar">
                        <p>스터디 이름 : ${courseRegistDTO.courseDTO.courseTitle}</p>
                        <p>멘토 이름 : ${courseRegistDTO.courseDTO.menteeDTO.userName}</p>
                        <c:set var="startDate" scope="session" value="${courseRegistDTO.courseDTO.courseStartDate}" />
						<c:set var="EndDate" scope="session" value="${courseRegistDTO.courseDTO.courseEndDate}" />
												
                        <%
							String startDate = (String) session.getAttribute("startDate");
                        	String endDate = (String) session.getAttribute("EndDate");
                        	
							String updateStartDate = startDate.substring(0, 10);
							String updateEndDate = endDate.substring(0, 10);
						
						%>
						
                        <p>기간 : <%=updateStartDate%>~<%=updateEndDate%></p>
                        
                        <p>장소 : ${courseRegistDTO.courseDTO.courseLoc}
                      </div>  
                      </div> 
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="title inner-page-title">
                        <h1>리뷰 작성</h1>
                    </div>
                    <form name="f" action="${pageContext.request.contextPath}/myPage/exStudy/reviewInsert" method="get">
                        <div class="row">                      
                            <div class="col-md-12">
                                <div class="form-group">                                                                     
                                   
                                    <label>스터디가 어떠셨나요? 자유롭게 작성해주세요!</label>
                                    <div style="height: 50px"><textarea name="repContent" rows="6" name="message" class="form-control"></textarea></div>
                          	                             
                                </div>
                                <div class="form-group">
                                    <div style="float: right"><input type="submit" value="작성 완료" class="btn btn-primary"/></div>
                                </div>
                            </div>
                            
                        <input type="hidden" name="userId" value="${courseRegistDTO.courseDTO.userId}">
                        <input type="hidden" name="repWriter" value="${courseRegistDTO.userId}">
        				<input type="hidden" name="courseCode" value="${courseRegistDTO.courseDTO.courseCode}">
                        
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </section>

</body>
</html>