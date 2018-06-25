<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
   .gallery-nav {
       text-align: center;
       margin: 30px 0 40px;
       width: 100%;
   }
   
   .gallery-nav ul li {
       display: inline-block;
       margin-right: 15px;
       position: relative;
       padding: 8px 15px;
       font-size: 14px;
       -webkit-transition: all 0.3s ease;
       -moz-transition: all 0.3s ease;
       transition: all 0.3s ease;
       cursor: pointer;
       text-transform: capitalize;
       text-transform: uppercase;
       font-weight: 600;
       border: 1px solid #ccc;
   }
   
   .custom-select{
      margin:5px;
      font-size:15px;
   }
   
   .recruiting-status-end{
	    background: rgba(220,0,0,.6);
	    position: absolute;
	    bottom: 0;
	    width: 100%;
	    height: 3pc;
	    line-height: 50px;
	    text-align: center;
	    color: #fff;
	    font-size: 14px;
	    font-weight: 700;
	}
	
	.recruiting-status-start {
	    background: rgba(73,166,211,.85);
	    position: absolute;
	    bottom: 0;
	    width: 100%;
	    height: 3pc;
	    line-height: 50px;
	    text-align: center;
	    color: #fff;
	    font-size: 14px;
	    font-weight: 700;
	}

</style>

<body>
	<%-- <%
	String userId = (String)request.getAttribute("userId");
		
	%>
	<%= userId %> --%>
	

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
						<li class="filter"><a style="color: black;" href="${pageContext.request.contextPath}/myPage/studyInsert/insertForm">스터디 만들기</a></li>
					</ul>					
				
				</div>
			</div>
			</section>

			<div class="pupular-course-inner clear">
			<c:choose>
				<c:when test="${mentoList[0] eq null}">
				</c:when>
				<c:otherwise>
					<h1>내가 멘토인 스터디</h1>
				</c:otherwise>
			</c:choose>
				<div class="row">
					<c:choose>
						<c:when test="${mentoList[0] eq null}">
						</c:when>
						<c:otherwise>
																								
							<c:forEach items="${mentoList}" var="mento">
								<c:set var="start" scope="session" value="${mento.courseStartDate}" />
								<c:set var="end" scope="session" value="${mento.courseEndDate}" />
								
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
												<c:when test="${empty mento.courseBackpic}">
				                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/course/2.jpg " alt="image" />
				                            	</c:when>
				                            	<c:otherwise>
				                            		<img class="img-responsive" style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/save/${mento.courseBackpic}" alt="image" />
				                            	</c:otherwise>
			                            	</c:choose>
										</div>
										<div class="course-detail">
										<div style="text-align:center;">
										<c:set var="courseSubGroup" scope="session" value="${mento.courseSubGroup}" />
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
							                
											<c:set var="startDate" scope="session"
												value="${mento.courseStartDate}" />
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

																	
											<c:set var="startTime" scope="session" value="${mento.courseStartTime}" />
								                <%
								               	    String startHour = ((String) session.getAttribute("startTime")).substring(0, 2);
								               	    String startMinute = ((String) session.getAttribute("startTime")).substring(2, 4);
								                %>
							                <c:set var="endTime" scope="session" value="${mento.courseEndTime}" />
								                <%
								                	String endHour = ((String) session.getAttribute("endTime")).substring(0, 2);
								                 	String endMinute = ((String) session.getAttribute("endTime")).substring(2, 4);
								                %>
								                
											<div class="course-date" >    
		                                  	   <span style="font-size:13pt"><strong>[${mento.courseTopGroup}] <%=courseCodeName%></strong></span><br>
											   <span style="color:skyblue"><%=smonth %>월 <%=sday%>일(<%=day%>)</span>                              			                                      
		                                       <span> <%=startHour %>:<%=startMinute %>~<%=endHour %>:<%=endMinute %> 첫시작</span>
		                                       <p style="color:#92B3B7; font-style:normal ">${mento.courseLoc} | ${mento.courseLevel}</p>                           
		                                   </div>
		                                   
											<h3>
												<a href="${pageContext.request.contextPath}/course/detail?courseCode=${mento.courseCode}" title="Details">${mento.courseTitle}</a>
											</h3>
											</div>
											<div class="course-icon">
												<c:choose>
													<%-- <img
														src="${pageContext.request.contextPath}/resources/images/save/${mento.menteeDTO.userPhoto}"
														class="img-responsive" alt="image"> --%>
													<c:when test="${empty mento.menteeDTO.userPhoto}">
					                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/user/2.jpg " alt="image" />
					                            	</c:when>
					                            	<c:otherwise>
					                            		<img 
															src="${pageContext.request.contextPath}/resources/images/save/${mento.menteeDTO.userPhoto}"
															class="img-responsive" alt="image">
														<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
					                            	</c:otherwise>
				                            	</c:choose>
											</div>

												<div class="course-bottom">
												<span><%=result%>주</span> 
										    <span class="pull-right">
		                                    	<fmt:formatNumber value="${mento.coursePrice}" pattern="#,###,###.##"/>원
		                                    </span>
											</div>
											
										</div>
										<a style="width: 100%;" class="btn btn-primary" href="${pageContext.request.contextPath}/classroom/${mento.courseCode}" target="_blank">클래스룸으로 이동</a>
										
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
				
				<c:choose>
				<c:when test="${menteeList[0] eq null}">
				</c:when>
				<c:otherwise>
					
					<h1>내가 멘티인 스터디</h1>
				</c:otherwise>
				</c:choose>
				<div class="row">			
					<c:choose>
						<c:when test="${menteeList[0] eq null}">						
						</c:when>
						<c:otherwise>
					
							<c:forEach items="${menteeList}" var="mentee">
								
								<c:set var="start" scope="session" value="${mentee.courseDTO.courseStartDate}" />
								<c:set var="end" scope="session" value="${mentee.courseDTO.courseEndDate}" />
									
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
												<c:when test="${empty mentee.courseDTO.courseBackpic}">
				                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/course/2.jpg " alt="image" />
				                            	</c:when>
				                            	<c:otherwise>
				                            		<img class="img-responsive" style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/save/${mentee.courseDTO.courseBackpic}" alt="image" />
				                            	</c:otherwise>
				                            </c:choose>
										</div>
										<div class="course-detail">
										<div style="text-align:center;">
										<c:set var="courseSubGroup" scope="session" value="${mentee.courseDTO.courseSubGroup}" />
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
							                
											<c:set var="startDate" scope="session" value="${mentee.courseDTO.courseStartDate}" />
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

																	
											<c:set var="startTime" scope="session" value="${mentee.courseDTO.courseStartTime}" />
								                <%
								               	    String startHour = ((String) session.getAttribute("startTime")).substring(0, 2);
								               	    String startMinute = ((String) session.getAttribute("startTime")).substring(2, 4);
								                %>
							                <c:set var="endTime" scope="session" value="${mentee.courseDTO.courseEndTime}" />
								                <%
								                	String endHour = ((String) session.getAttribute("endTime")).substring(0, 2);
								                 	String endMinute = ((String) session.getAttribute("endTime")).substring(2, 4);
								                %>
								                
											<div class="course-date" >    
		                                  	   <span style="font-size:13pt"><strong>[${mentee.courseDTO.courseTopGroup}] <%=courseCodeName%></strong></span><br>
											   <span style="color:skyblue"><%=smonth %>월 <%=sday%>일(<%=day%>)</span>                              			                                      
		                                       <span> <%=startHour %>:<%=startMinute %>~<%=endHour %>:<%=endMinute %> 첫시작</span>
		                                       <p style="color:#92B3B7; font-style:normal ">${mentee.courseDTO.courseLoc} | ${mentee.courseDTO.courseLevel}</p>                           
		                                   </div>
		                                   
											<h3>
												<a href="${pageContext.request.contextPath}/course/detail?courseCode=${mentee.courseDTO.courseCode}" title="Details">${mentee.courseDTO.courseTitle}</a>
											</h3>
											</div>
											
											<div class="course-icon">	
												<c:choose>							
													<c:when test="${empty mentee.courseDTO.menteeDTO.userPhoto}">
					                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/user/2.jpg " alt="image" />
					                            	</c:when>
					                            	<c:otherwise>
					                            		<img 
															src="${pageContext.request.contextPath}/resources/images/save/${mentee.courseDTO.menteeDTO.userPhoto}"
															class="img-responsive" alt="image">
														<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
					                            	</c:otherwise>
				                            	</c:choose>
											</div>
								
											<div class="course-bottom">
												<span><%=result%>주</span> 
										    <span class="pull-right">
		                                    	<fmt:formatNumber value="${mentee.courseDTO.coursePrice}" pattern="#,###,###.##"/>원
		                                    </span>
											</div>
											
										</div>
										<%
											String current = formatter.format(new Date());
														//System.out.println("--------현재1"+current);

														Date currentResult = formatter.parse(current);

														//System.out.println("현재2"+currentResult);

														difference = d2.getTime() - currentResult.getTime();

														//System.out.println("현재3"+d2);

														differenceDay = difference / (1000 * 60 * 60 * 24);
														//System.out.println(difference);
														System.out.println(differenceDay);
														if (differenceDay >= 14) {
										%>
									
										<a style="width: 100%;" class="btn btn-primary" href="${pageContext.request.contextPath}/myPage/study/delete?userId=${mentee.userId}&courseCode=${mentee.courseDTO.courseCode}">스터디 취소하기</a>
										
										<%
											} else {
										%>
										
										<a style="width: 100%;" class="btn btn-primary" href="${pageContext.request.contextPath}/classroom/${mentee.courseDTO.courseCode}" target="_blank">클래스룸으로 이동</a>
										<%
											}
										%>
										
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