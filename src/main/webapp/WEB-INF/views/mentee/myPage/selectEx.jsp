<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script>
$(function(){
		
	$("a[id='리뷰 작성 완료']").bind('click', false);
	
})

</script>
<body>
<%-- 	<%
	String userId = (String)request.getAttribute("userId");
		
	%> --%>
	<%-- <%= userId %> --%>
	<div class="popular-course course-page inner-page"
		style="margin-top: 20px">
		<div class="container">

			<section id="gallery" style="padding-top: 0px; padding-bottom: 0px">
			<div class="course-filter">
				<div class="gallery-nav">
				
					<c:set var="userId"><sec:authentication property="principal.userId"/></c:set>
					
					<ul>
						<li class="filter" data-filter="all"><a style="color: black;" href="${pageContext.request.contextPath}/myPage/study/select?userId=${userId}">내 스터디</a></li>
						<li class="filter" data-filter="all"><a style="color: black;" href="${pageContext.request.contextPath}/myPage/favStudy/select?userId=${userId}">찜한 스터디</a></li>
						<li class="filter" data-filter="all"><a style="color: black;" href= "${pageContext.request.contextPath}/myPage/exStudy/select?userId=${userId}">완료된 스터디</a></li>
						<li class="filter" data-filter="all"><a style="color: black;" href="${pageContext.request.contextPath}/myPage/profile/updateForm">프로필 수정</a></li>
						<sec:authorize access="hasRole('ROLE_MENTO')">
							<li class="filter"><a style="color: black;" href="${pageContext.request.contextPath}/myPage/studyInsert/insertForm">스터디 만들기</a></li>
						</sec:authorize>					</ul>
				</div>
			</div>
			</section>

			<div class="pupular-course-inner clear">			
			<c:choose>
 				<c:when test="${empty mentoExList[0]}">
				
				</c:when>
				<c:otherwise>
					<h1>끝난 스터디(멘토)</h1>
				</c:otherwise>
			</c:choose>
				<div class="row">
					<c:choose>
						<c:when test="${mentoExList[0].courseDTO eq null}">
						</c:when>
						<c:otherwise>						
																		
							<c:forEach items="${mentoExList}" var="mentoEx">							
								<c:set var="start" scope="session" value="${mentoEx.courseStartDate}" />
								<c:set var="end" scope="session" value="${mentoEx.courseEndDate}" />
								
								<%
									String end = ((String) session.getAttribute("end")).substring(0, 10);
									String start = ((String) session.getAttribute("start")).substring(0, 10);

									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

									Date d1 = formatter.parse(end);
									Date d2 = formatter.parse(start);

									long difference = d1.getTime() - d2.getTime();

									long differenceDay = difference / (1000 * 60 * 60 * 24 * 7);

									int result = (int) Math.ceil(differenceDay);
																		
								%>						
								<div class=" col-md-4 col-lg-4">
									<div class="course-content">
										<div class="course-img">
											<c:choose>
												<%-- <img class="img-responsive" style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/save/${mentoEx.courseBackpic}" alt="image" />	 --%>										
												<c:when test="${empty mentoEx.courseBackpic}">
				                               		<img class="img-responsive " style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/course/2.jpg " alt="image" />
				                            	</c:when>
				                            	<c:otherwise>
				                            		<img style="width:100%; height:230px;"
														src="${pageContext.request.contextPath}/resources/images/save/${mentoEx.courseBackpic}"
														class="img-responsive" alt="image">
													<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
				                            	</c:otherwise>
			                            	</c:choose>
										</div>
										<div class="course-detail">
										<div style="text-align:center;">
										<c:set var="courseSubGroup" scope="session" value="${mentoEx.courseSubGroup}" />
							                <%
							                    String courseCode = ((String) session.getAttribute("courseSubGroup"));	
							                
							                	String courseCodeName ="";
							                 	if(courseCode.equals("U001")){
							                 		courseCodeName="Java";
							                 	} if(courseCode.equals("U002")){
							                 		courseCodeName="C";
							                 	} if(courseCode.equals("U003")){
							                 		courseCodeName="자료구조/알고리즘";
							                 	} if(courseCode.equals("U004")){
							                 		courseCodeName="DBMS";
							                 	} if(courseCode.equals("W001")){
							                 		courseCodeName="백엔드 개발자";
							                 	} if(courseCode.equals("W002")){
							                 		courseCodeName="프론트엔드 개발자";
							                 	} if(courseCode.equals("W003")){
							                 		courseCodeName="안드로이드앱 개발자";
							                 	} if(courseCode.equals("W004")){
							                 		courseCodeName="아이폰앱 개발자";
							                 	} if(courseCode.equals("H001")){
							                 		courseCodeName="사이버해킹 보안";
							                 	} if(courseCode.equals("H002")){
							                 		courseCodeName="웹 해킹";
							                 	} if(courseCode.equals("H003")){
							                 		courseCodeName="시스템 해킹";
							                 	} if(courseCode.equals("S001")){
							                 		courseCodeName="리눅스 서버";
							                 	} if(courseCode.equals("S002")){
							                 		courseCodeName="네트워크 엔지니어";
							                 	}
							                %>
							                
											<c:set var="startDate" scope="session" value="${mentoEx.courseStartDate}" />
											<%
											String smonth = ((String) session.getAttribute("startDate")).substring(5, 7);
											String sday = ((String) session.getAttribute("startDate")).substring(8, 10);
											String day = "" ;
							                
											SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
											Date nDate = dateFormat.parse((String) session.getAttribute("startDate")) ;            

											Calendar cal = Calendar.getInstance() ;
											cal.setTime(nDate);
											int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;                                                
											switch(dayNum){
											case 1:
											    day = "일";
											    break ;
											case 2:
											    day = "월";
											    break ;
											case 3:
											    day = "화";
											    break ;
											case 4:
											    day = "수";
											    break ;
											case 5:
											    day = "목";
											    break ;
											case 6:
											    day = "금";
											    break ;
											case 7:
											    day = "토";
											    break ;                         
					              			}	%>

																	
											<c:set var="startTime" scope="session" value="${mentoEx.courseStartTime}" />
								                <%
								               	    String startHour = ((String) session.getAttribute("startTime")).substring(0, 2);
								               	    String startMinute = ((String) session.getAttribute("startTime")).substring(2, 4);
								                %>
							                <c:set var="endTime" scope="session" value="${mentoEx.courseEndTime}" />
								                <%
								                	String endHour = ((String) session.getAttribute("endTime")).substring(0, 2);
								                 	String endMinute = ((String) session.getAttribute("endTime")).substring(2, 4);
								                %>
								                
											<div class="course-date" >    
		                                  	   <span style="font-size:13pt"><strong>[${mentoEx.courseTopGroup}] <%=courseCodeName%></strong></span><br>
											   <span style="color:skyblue"><%=smonth %>월 <%=sday%>일(<%=day%>)</span>                              			                                      
		                                       <span> <%=startHour %>:<%=startMinute %>~<%=endHour %>:<%=endMinute %> 첫시작</span>
		                                       <p style="color:#92B3B7; font-style:normal ">${mentoEx.courseLoc} | ${mentoEx.courseLevel}</p>                           
		                                   </div>
		                                   
											<h3>
												<a href="${pageContext.request.contextPath}/course/detail?courseCode=${mentoEx.courseCode}" title="Details">${mentoEx.courseTitle}</a>
											</h3>
											</div>
											<div class="course-icon">
												<c:choose>
													<%-- <img
														src="${pageContext.request.contextPath}/resources/images/save/${mentoEx.menteeDTO.userPhoto}"
														class="img-responsive" alt="image"> --%>
													<c:when test="${empty mentoEx.menteeDTO.userPhoto}">
					                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/user/2.jpg " alt="image" />
					                            	</c:when>
					                            	<c:otherwise>
					                            		<img 
															src="${pageContext.request.contextPath}/resources/images/save/${mentoEx.menteeDTO.userPhoto}"
															class="img-responsive" alt="image">
														<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
					                            	</c:otherwise>
				                            	</c:choose>
											</div>

												<div class="course-bottom">
												<span><%=result%>주</span> 
										    <span class="pull-right">
		                                    	<fmt:formatNumber value="${mentoEx.coursePrice}" pattern="#,###,###.##"/>원
		                                    </span>
											</div>
											
										</div>
										
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
				
				<c:choose>
				<c:when test="${menteeExList[0] eq null}">
				</c:when>
				<c:otherwise>
					
					<h1>끝난 스터디(멘티)</h1>
				</c:otherwise>
				</c:choose>
				<div class="row">			
					<c:choose>
						<c:when test="${menteeExList[0] eq null}">						
						</c:when>
						<c:otherwise>
					
							<c:forEach items="${menteeExList}" var="menteeEx">
								<c:set var="start" scope="session" value="${menteeEx.courseDTO.courseStartDate}" />
								<c:set var="end" scope="session" value="${menteeEx.courseDTO.courseEndDate}" />
									
								<%
									String end = ((String) session.getAttribute("end")).substring(0, 10);
									String start = ((String) session.getAttribute("start")).substring(0, 10);

									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

									Date d1 = formatter.parse(end);
									Date d2 = formatter.parse(start);

									long difference = d1.getTime() - d2.getTime();

									long differenceDay = difference / (1000 * 60 * 60 * 24 * 7);

									int result = (int) Math.ceil(differenceDay);
										
								%>						
								<div class=" col-md-4 col-lg-4">
									<div class="course-content">
										<div class="course-img">
											<c:choose>
												<%-- <img class="img-responsive" style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/save/${mentoEx.courseBackpic}" alt="image" />	 --%>										
												<c:when test="${empty menteeEx.courseDTO.courseBackpic}">
				                               		<img class="img-responsive " style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/course/2.jpg " alt="image" />
				                            	</c:when>
				                            	<c:otherwise>
				                            		<img style="width:100%; height:230px;"
														src="${pageContext.request.contextPath}/resources/images/save/${menteeEx.courseDTO.courseBackpic}"
														class="img-responsive" alt="image">
													<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
				                            	</c:otherwise>
			                            	</c:choose>
										</div>
										<div class="course-detail">
										<div style="text-align:center;">
										<c:set var="courseSubGroup" scope="session" value="${menteeEx.courseDTO.courseSubGroup}" />
							                <%
							                    String courseCode = ((String) session.getAttribute("courseSubGroup"));	
							                
							                	String courseCodeName ="";
							                 	if(courseCode.equals("U001")){
							                 		courseCodeName="Java";
							                 	} if(courseCode.equals("U002")){
							                 		courseCodeName="C";
							                 	} if(courseCode.equals("U003")){
							                 		courseCodeName="자료구조/알고리즘";
							                 	} if(courseCode.equals("U004")){
							                 		courseCodeName="DBMS";
							                 	} if(courseCode.equals("W001")){
							                 		courseCodeName="백엔드 개발자";
							                 	} if(courseCode.equals("W002")){
							                 		courseCodeName="프론트엔드 개발자";
							                 	} if(courseCode.equals("W003")){
							                 		courseCodeName="안드로이드앱 개발자";
							                 	} if(courseCode.equals("W004")){
							                 		courseCodeName="아이폰앱 개발자";
							                 	} if(courseCode.equals("H001")){
							                 		courseCodeName="사이버해킹 보안";
							                 	} if(courseCode.equals("H002")){
							                 		courseCodeName="웹 해킹";
							                 	} if(courseCode.equals("H003")){
							                 		courseCodeName="시스템 해킹";
							                 	} if(courseCode.equals("S001")){
							                 		courseCodeName="리눅스 서버";
							                 	} if(courseCode.equals("S002")){
							                 		courseCodeName="네트워크 엔지니어";
							                 	}
							                %>
							                
											<c:set var="startDate" scope="session" value="${menteeEx.courseDTO.courseStartDate}" />
											<%
											String smonth = ((String) session.getAttribute("startDate")).substring(5, 7);
											String sday = ((String) session.getAttribute("startDate")).substring(8, 10);
											String day = "" ;
							                
											SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
											Date nDate = dateFormat.parse((String) session.getAttribute("startDate")) ;            

											Calendar cal = Calendar.getInstance() ;
											cal.setTime(nDate);
											int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;                                                
											switch(dayNum){
											case 1:
											    day = "일";
											    break ;
											case 2:
											    day = "월";
											    break ;
											case 3:
											    day = "화";
											    break ;
											case 4:
											    day = "수";
											    break ;
											case 5:
											    day = "목";
											    break ;
											case 6:
											    day = "금";
											    break ;
											case 7:
											    day = "토";
											    break ;                         
					              			}	
					              			%>

																	
											<c:set var="startTime" scope="session" value="${menteeEx.courseDTO.courseStartTime}" />
								                <%
								               	    String startHour = ((String) session.getAttribute("startTime")).substring(0, 2);
								               	    String startMinute = ((String) session.getAttribute("startTime")).substring(2, 4);
								                %>
							                <c:set var="endTime" scope="session" value="${menteeEx.courseDTO.courseEndTime}" />
								                <%
								                	String endHour = ((String) session.getAttribute("endTime")).substring(0, 2);
								                 	String endMinute = ((String) session.getAttribute("endTime")).substring(2, 4);
								                %>
								                
											<div class="course-date" >    
		                                  	   <span style="font-size:13pt"><strong>[${menteeEx.courseDTO.courseTopGroup}] <%=courseCodeName%></strong></span><br>
											   <span style="color:skyblue"><%=smonth %>월 <%=sday%>일(<%=day%>)</span>                              			                                      
		                                       <span> <%=startHour %>:<%=startMinute %>~<%=endHour %>:<%=endMinute %> 첫시작</span>
		                                       <p style="color:#92B3B7; font-style:normal ">${menteeEx.courseDTO.courseLoc} | ${menteeEx.courseDTO.courseLevel}</p>                           
		                                   </div>
		                                   
											<h3>
												<a href="${pageContext.request.contextPath}/course/detail?courseCode=${menteeEx.courseDTO.courseCode}" title="Details">${menteeEx.courseDTO.courseTitle}</a>
											</h3>
											</div>
											<div class="course-icon">
												<%-- <img
													src="${pageContext.request.contextPath}/resources/images/users/1.jpg"
													class="img-responsive" alt="image"> --%>
													<c:choose>
													<%-- <img
														src="${pageContext.request.contextPath}/resources/images/save/${mentoEx.menteeDTO.userPhoto}"
														class="img-responsive" alt="image"> --%>
													<c:when test="${empty menteeEx.courseDTO.menteeDTO.userPhoto}">
					                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/user/2.jpg " alt="image" />
					                            	</c:when>
					                            	<c:otherwise>
					                            		<img 
															src="${pageContext.request.contextPath}/resources/images/save/${menteeEx.courseDTO.menteeDTO.userPhoto}"
															class="img-responsive" alt="image">
														<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
					                            	</c:otherwise>
				                            	</c:choose>
											</div>

								
											<div class="course-bottom">
												<span><%=result%>주</span> 
										    <span class="pull-right">
		                                    	<fmt:formatNumber value="${menteeEx.courseDTO.coursePrice}" pattern="#,###,###.##"/>원
		                                    </span>
											</div>
										</div>
																		
											<a id="${menteeEx.state}" style="width: 100%;" class="btn btn-primary" href="${pageContext.request.contextPath}/myPage/exStudy/reviewInsertForm?userId=${menteeEx.userId}&courseCode=${menteeEx.courseCode}">${menteeEx.state}</a>																	
										
										</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>
</body>

</html>