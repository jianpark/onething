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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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

<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init("imp99503400");
	$(function() {
		$("#purchase-action-button")
				.on("click",function() {
							var courseCode = $("#courseCode").val();
							var courseAmount = $('#coursePrice').val();
							var userMail = $('#userMail').val();
							var userPhone = $('#userPhone').val();
							var userName = $('#userId').val();
							IMP.request_pay(
											{
												pg : 'nice', // version 1.1.0부터 지원.
												pay_method : 'card',
												merchant_uid : 'merchant_'+ new Date().getTime(),
												name : '주문명:postIT 수강결제',
												amount : courseAmount,
												buyer_email : userMail,
												buyer_name : userName,
												buyer_tel : userPhone,
												buyer_addr : '경기도 성남시 분당구 대왕판교로',
												buyer_postcode : '123-456',
												m_redirect_url : 'localhost:8000/postIT/main/mainpage/index'
											},
											function(rsp) {
												if (rsp.success) {
													var msg = '결제가 완료되었습니다.';
													msg += '고유ID : '
															+ rsp.imp_uid;
													msg += '상점 거래ID : '
															+ rsp.merchant_uid;
													msg += '결제 금액 : '
															+ rsp.paid_amount;
													msg += '카드 승인번호 : '
															+ rsp.apply_num;

													$
															.ajax({
																type : "POST",
																url : "${pageContext.request.contextPath}/course/payConfirm",
																data : "${_csrf.parameterName}=${_csrf.token}&&id="
																		+ userVal
																		+ "&&courseCode="
																		+ courseCode
																		+ "&&paidAmount="
																		+ rsp.paid_amount
																		+ "&&paidMethod="
																		+ rsp.pay_method,
																success : function(
																		data) {
																	msg += '+등록이 성공되었습니다.'
																}//callback         
															});

													course / payConfirm

												} else {
													var msg = '결제에 실패하였습니다.';
													msg += '에러내용 : '
															+ rsp.error_msg;
												}
												alert(msg);
											});
							return false;
						});
	})
</script>
<body>

	<div class="popular-course course-page inner-page"
		style="margin-top: 20px">
		<div class="container">

			<section id="gallery" style="padding-top: 0px; padding-bottom: 0px">
			<div class="course-filter">
				<div class="gallery-nav">
					<sec:authorize access="hasRole('ROLE_MENTO')">
						<input type="hidden" name="isMento" value="mento" />
					</sec:authorize>
					<c:set var="userId">
						<sec:authentication property="principal.userId" />
					</c:set>
					<input type="hidden" value="${userId}" id="userId" /> <input
						type="hidden" value="${menteeDTO.userEmail}" id="userMail" /> <input
						type="hidden" value="${menteeDTO.userPhone}" id="userPhone" />
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
				<div class="row">
					<c:choose>
						<c:when test="${favList[0] eq null}">					
						<div style="text-align: center; margin: 0 auto; margin-bottom: 200px">찜한 스터디가 없습니다.</div>					
						</c:when>
						<c:otherwise>																							
							<c:forEach items="${favList}" var="favStudy">							
														
								<c:set var="start" scope="session" value="${favStudy.courseDTO.courseStartDate}" />
								<c:set var="end" scope="session" value="${favStudy.courseDTO.courseEndDate}" />
									
								<%
									String end = ((String) session.getAttribute("end")).substring(0, 10);
									String start = ((String) session.getAttribute("start")).substring(0, 10);

									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

									Date d1 = formatter.parse(end);
									Date d2 = formatter.parse(start);

									long difference = d1.getTime() - d2.getTime();

									long differenceDay = difference / (1000 * 60 * 60 * 24 * 7);

									int result = (int) Math.ceil(differenceDay);
									
									//여기서부터 마감임박 뽑는것
									Date currentTime = new Date ();
									String mTime = formatter.format(currentTime);								
									Date c1 = formatter.parse(mTime);
									
									long difference1 = d1.getTime() - c1.getTime();
									long differenceDay1 = difference1 / (1000 * 60 * 60 * 24 * 7 );		
									int result1 = (int) Math.ceil(differenceDay1);
									
									String cut="";	
									String reClass="";
									if(result1<=2){
										cut = "마감임박";
										reClass = "recruiting-status-end";
									}else{
										cut = "신규모집";
										reClass = "recruiting-status-start";
									}
												
								%>						
								<div class=" col-md-4 col-lg-4">
									<div class="course-content">
										<div class="course-img">
											<c:choose>
												<%-- <img class="img-responsive" style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/save/${favStudy.courseDTO.courseBackpic} " alt="image" /> --%>
												<c:when test="${empty favStudy.courseDTO.courseBackpic}">
				                               		<img class="img-responsive " style="width:100%; height:230px;" src="${pageContext.request.contextPath}/resources/images/course/2.jpg " alt="image" />
				                            	</c:when>
				                            	<c:otherwise>
				                            		<img style="width:100%; height:230px;"
														src="${pageContext.request.contextPath}/resources/images/save/${favStudy.courseDTO.courseBackpic}"
														class="img-responsive" alt="image">
													<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
				                            	</c:otherwise>	
											</c:choose>
											<div class="<%=reClass%>">
		                        				<%=cut %>                       	
		                        			</div>
										</div>
										<div class="course-detail">
										<div style="text-align:center;">
										<c:set var="courseSubGroup" scope="session" value="${favStudy.courseDTO.courseSubGroup}" />
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
							                
											<c:set var="startDate" scope="session" value="${favStudy.courseDTO.courseStartDate}" />
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

																	
											<c:set var="startTime" scope="session" value="${favStudy.courseDTO.courseStartTime}" />
								                <%
								               	    String startHour = ((String) session.getAttribute("startTime")).substring(0, 2);
								               	    String startMinute = ((String) session.getAttribute("startTime")).substring(2, 4);
								                %>
							                <c:set var="endTime" scope="session" value="${favStudy.courseDTO.courseEndTime}" />
								                <%
								                	String endHour = ((String) session.getAttribute("endTime")).substring(0, 2);
								                 	String endMinute = ((String) session.getAttribute("endTime")).substring(2, 4);
								                %>
								                
											<div class="course-date" >    
		                                  	   <span style="font-size:13pt"><strong>[${favStudy.courseDTO.courseTopGroup}] <%=courseCodeName%></strong></span><br>
											   <span style="color:skyblue"><%=smonth %>월 <%=sday%>일(<%=day%>)</span>                              			                                      
		                                       <span> <%=startHour %>:<%=startMinute %>~<%=endHour %>:<%=endMinute %> 첫시작</span>
		                                       <p style="color:#92B3B7; font-style:normal ">${favStudy.courseDTO.courseLoc} | ${favStudy.courseDTO.courseLevel}</p>                           
		                                   </div>
		                                   
											<h3>
												<a href="${pageContext.request.contextPath}/course/detail?courseCode=${favStudy.courseDTO.courseCode}" title="Details">${favStudy.courseDTO.courseTitle}</a>
											</h3>
											</div>
											<div class="course-icon">
												<c:choose>
													<%-- <img
														src="${pageContext.request.contextPath}/resources/images/save/${favStudy.courseDTO.menteeDTO.userPhoto}"
														class="img-responsive" alt="image"> --%>
														
													<c:when test="${empty favStudy.courseDTO.menteeDTO.userPhoto}">
					                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/user/2.jpg " alt="image" />
					                            	</c:when>
					                            	<c:otherwise>
					                            		<img 
															src="${pageContext.request.contextPath}/resources/images/save/${favStudy.courseDTO.menteeDTO.userPhoto}"
															class="img-responsive" alt="image">
														<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" /> --%>
					                            	</c:otherwise>
				                            	</c:choose>
											</div>

								
											<div class="course-bottom">
												<span><%=result%>주</span> 
										    <span class="pull-right">
		                                    	<fmt:formatNumber value="${favStudy.courseDTO.coursePrice}" pattern="#,###,###.##"/>원
		                                    </span>
											</div>
											
										</div>
										<div style="width: 100%; margin: 0 auto;">
											<div style="width: 50%; float: left">
												<input type="submit" id="purchase-action-button"
													class="btn btn-primary" style="width: 100%;" value="결제하기">
											</div>

											<input type="hidden" id="coursePrice"
												value="${favStudy.courseDTO.coursePrice}" /> <input
												type="hidden" id="courseCode"
												value="${favStudy.courseDTO.courseCode}" />
											<div style="width: 50%; float: right">
												<a style="width: 100%;" class="btn btn-primary"
													href="${pageContext.request.contextPath}/myPage/favStudy/delete?userId=${favStudy.userId}&courseCode=${favStudy.courseCode}">찜하기
													취소</a>
											</div>
										</div>
										
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