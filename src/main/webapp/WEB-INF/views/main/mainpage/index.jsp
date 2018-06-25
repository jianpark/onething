<%@page import="kosta.spring.postIT.model.dto.CourseDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="org.springframework.security.core.context.SecurityContextImpl"%>
<%@page import="java.util.Enumeration"%>

   <style>


	#leveltest{float: left; margin-left: 200px;}
	#leveltestImg{float: right; margin-right: 110px; }
	
	.edu-counter-overlay2 {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    position: absolute;
    background-color: skyblue;
    }
    
    .testimonial-overlay2 {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    background-color: grey;
	}
	
	.testimonial2 .sec-title h2,
	.testimonial2 .sec-title p {
	    color: #ffffff;
	}
	
	 #menteeCount{
	color:orange;
	} 
	
	#mentoCount{
	color:orange;
	}
	
	#studyCount{
	color:orange;
	}
	
	#reviewCount{
	color:orange;
	}
	
	.main-slider.owl-theme .owl-nav [class*=owl-] {
    color: #ffffff;
    width: 44px;
    height: 44px;
    line-height: 47px;
    background-color: transparent;
    display: inline-block;
    cursor: pointer;
    font-size: 24px;
    margin: 0;
    filter: alpha(opacity=80);
    border:none;
    opacity: 1; 
}

.owl-theme .owl-nav [class*=owl-] {
    color: gray;
    width: 44px;
    height: 44px;
    line-height: 47px;
    background-color: transparent;
    display: inline-block;
    cursor: pointer;
    font-size: 24px;
    margin: 0;
    filter: alpha(opacity=80);
    border:none;
    opacity: 1; 
}

a.scroll-top {
    background-color: transparent;
    border:1px solid black;
    bottom: 45px;
    color: black;
    cursor: pointer;
    font-size: 14px;
    height: 40px;
    font-weight: bold;
    line-height: 38px;
    position: fixed;
    right: 12px;
    text-align: center;
    width: 40px;
    z-index: 999;
}

#main-navigation li > a:hover,
#main-navigation li.current-menu-item > a,
#main-navigation li:hover > a {
    color: skyblue;
}

.title h2::after {
    background: skyblue none repeat scroll 0 0;
    bottom: -15px;
    content: "";
    height: 2px;
    left: 0;
    right: 0;
    margin: 0 auto;
    position: absolute;
    width: 50px;
}

.lecture-btn a.btn {
    background-color: transparent;
    border: 1px solid skyblue;
    color: #333;
    text-transform: uppercase;
    margin: 20px auto 50px auto;
}

.lecture-btn a.btn:hover {
    background-color: gray;
    border: 1px solid gray;
    color: #fff;
}

.testimonial-carousel.owl-theme .owl-dots .owl-dot span {
    background: #ffffff;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
    width: 12px;
    height: 5px;
    margin: 5px 7px;
    display: block;
    border-radius: 30px;
    -webkit-border-radius: 30px;
    -ms-border-radius: 30px;
    -moz-border-radius: 30px;
    -o-border-radius: 30px;
}

.testimonial-carousel.owl-theme .owl-dots .owl-dot.active span {
    background: skyblue;
    -webkit-transform: scale(1.3);
    -ms-transform: scale(1.3);
    transform: scale(1.3);
    width: 15px;
    height: 5px
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

</style>

<%-- <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.userName" /> 님 환영합니다. 
		<!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
	</sec:authorize>
        --%>
       <!-- banner slider -->
    <div class="banner-slider">
        <div class="main-slider owl-carousel owl-theme">
            <div class="slider-items" style="background-image:url(${pageContext.request.contextPath}/resources/images/slider/main.jpg); height=">
                <div class="slider-overlay"></div>
                <div class="slider-content">
                    <div class="carousel-caption caption-center">
                        <div class="content">
                            <h2>Let's code together</h2>
                            <p>postIT는 나와 비슷한  멤버들과 시작하는 오프라인 스터디 매칭 플랫폼 입니다!</p>
                            <a  href="${pageContext.request.contextPath}/course" class="btn btn-primary" style="background-color: skyblue">스터디 알아보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slider-items" style="background-image:url(${pageContext.request.contextPath}/resources/images/slider/main2.jpg);">
                <div class="slider-overlay"></div>
                <div class="slider-content">
                    <div class="carousel-caption caption-center">
                        <div class="content">
                            <h2>Let's code together</h2>
                            <p>postIT은 나와 비슷한  멤버들과 시작하는 오프라인 스터디 매칭 플랫폼 입니다!</p>
                            <a  href="${pageContext.request.contextPath}/join" class="btn btn-primary" style="background-color: skyblue">스터디 시작하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
   
    <section class="popular-course section grey-background">
        <div class="container" style="width: 2030px;"> 
            <div class="title sec-title">
                <h2>추천 강좌</h2>
                <p>문구가 들어갈 자리입니다. 문구가 들어갈 자리입니다. 문구가 들어갈 자리입니다. 문구가 들어갈 자리입니다. 문구가 들어갈 자리입니다. 문구가 들어갈 자리입니다.  </p>
                <p><a href="course">전체강좌 보러가기</a></p>
            </div>
            
            <div class="row col-md-12 col-lg-12">
                                <!-- 스터디 보여주기 -->
                   <c:if test="${!empty courseRecommedList}">
                    	<c:forEach items="${courseRecommedList}" var="courseDTO">
                   			
                  			<c:set var="start" scope="session" value="${courseDTO.courseStartDate}" />
							<c:set var="end" scope="session" value="${courseDTO.courseEndDate}" />
							<%
							String end = ((String) session.getAttribute("end")).substring(0, 10);
							String start = ((String) session.getAttribute("start")).substring(0, 10);
							
							SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							
							Date d1 = formatter.parse(end);
							Date d2 = formatter.parse(start);
							
							long difference = d1.getTime() - d2.getTime();		
							long differenceDay = difference / (1000 * 60 * 60 * 24 * 7 );		
							int result = (int) Math.ceil(differenceDay);
															
							Date currentTime = new Date ();
							String mTime = formatter.format(currentTime);								
							Date c1 = formatter.parse(mTime);
							
							long difference1 = d2.getTime() - c1.getTime();
							long differenceDay1 = difference1 / (1000 * 60 * 60 * 24 * 7 );		
							int result1 = (int) Math.ceil(differenceDay1);
							
							String cut="";	
							String reClass="";
							if(result1<2){
								cut = "마감임박";
								reClass = "recruiting-status-end";
							}else{
								cut = "신규모집";
								reClass = "recruiting-status-start";
							}
							
							%>
							<c:set var="startDate" scope="session" value="${courseDTO.courseStartDate}" />
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
		                    <c:set var="startTime" scope="session" value="${courseDTO.courseStartTime}" />
			                <%
			               	    String startHour = ((String) session.getAttribute("startTime")).substring(0, 2);
			               	    String startMinute = ((String) session.getAttribute("startTime")).substring(2, 4);
			                %>
			                <c:set var="endTime" scope="session" value="${courseDTO.courseEndTime}" />
			                <%
			                	String endHour = ((String) session.getAttribute("endTime")).substring(0, 2);
			                 	String endMinute = ((String) session.getAttribute("endTime")).substring(2, 4);
			                %>
                  			<c:set var="courseSubGroup" scope="session" value="${courseDTO.courseSubGroup}" />
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
			                
			                <%-- <form action="${pageContext.request.contextPath}/course/detail"> --%>                  			
		                   <div class=" col-md-4 col-lg-4" style="display:inline-block">            
		                        <div class="course-content">	                        	
		                            <div class="course-img ">
		                        <!-- <div class="pupular-cosurse-inner">
						                <div class="course-carousel owl-carousel owl-theme">
						                    <div class="course-item">
						                        <div class="course-img "> -->
		                            	<c:choose>
			                            	<c:when test="${empty courseDTO.courseBackpic}">
			                               		<img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/course/2.jpg " alt="image" />
			                            	</c:when>
			                            	<c:otherwise>
			                            		<%-- <img class="img-responsive " src="${pageContext.request.contextPath}/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" />
			                            		 --%><img class="img-responsive " src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.courseBackpic} " style="width:100%; height:230px" alt="image" />
			                            	</c:otherwise>
			                            	<%-- ${courseDTO.courseBackpic}/${courseDTO.menteeDTO.userPhoto} --%>
		                            	</c:choose>
		                            	<!-- ${courseDTO.courseBackpic} -->
		                            	<div class="<%=reClass%>">
			                        		<%=cut %>                       	
			                        	</div>
		                            	
		                            </div>
		                            <div class="course-detail ">
		                               <div style="text-align:center;">
		                                  <div class="course-date" >    
		                                  	   <span style="font-size:13pt"><strong>[${courseDTO.courseTopGroup}] <%=courseCodeName%></strong></span><br>
		                                  	   <span style="color:skyblue"><%=smonth %>월 <%=sday%>일(<%=day%>)</span>                              			                                      
		                                       <span> <%=startHour %>:<%=startMinute %>~<%=endHour %>:<%=endMinute %> 첫시작</span>
		                                       <p style="color:#92B3B7; font-style:normal ">${courseDTO.courseLoc} | ${courseDTO.courseLevel}</p>                           
		                                   </div>
		                                   
		                                   <h3>
		                                   		<a href="${pageContext.request.contextPath}/course/detail?courseCode=${courseDTO.courseCode}" id="moveAction">
		                                   			${courseDTO.courseTitle}
		                                   		</a>
		                                   </h3>
		                               </div>

		                                <div class="course-icon">
		                                    <%-- <img src="${pageContext.request.contextPath}/resources/images/users/2.jpg" class="img-responsive" alt="image">
		                               		 --%><!-- 멘토 프로필사진 -->
											<c:choose>
												<c:when test="${empty courseDTO.menteeDTO.userPhoto}">
													<img src="${pageContext.request.contextPath}/resources/images/users/2.jpg" class="img-responsive" alt="image">
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/images/save/${courseDTO.menteeDTO.userPhoto}" class="img-responsive" alt="image">		                               
												</c:otherwise>
											</c:choose>
		                               
		                                </div>
		                                <div class="course-bottom">
		                                  <!--   <span><i class="fa fa-users"></i>365</span>
		                                    <span><i class="fa fa-comment"></i>7</span> -->
		                                    <span class="pull-right">
		                                    	<fmt:formatNumber value="${courseDTO.coursePrice}" pattern="#,###,###.##"/>원
		                                    </span>

		                                    <span> <%=result %>주</span>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    
		                    	<!-- </div>
		                    </div>
		                   </div>
		                 </div> -->
		                    
                    		<!-- </form> -->
                    	</c:forEach>
                    </c:if>  
                    </div>
             
        </div>
    </section>
    
    <section class="lecture section grey-background pdb0">
        <div class="title sec-title" id="leveltest">
            <h2>레벨 테스트부터 시작해보세요</h2>
            <p>내 레벨을 파악하고 꼭 맞는 스터디를 안내받으세요!</p>
            <p>1분 정도 소요됩니다.</p>
            <div class="lecture-btn">
                <a href="${pageContext.request.contextPath}/course/levelTest/choice" class="btn">레벨테스트 시작하기</a>
            </div>
        </div>
        <div class="title sec-title" id="leveltestImg">
        	<img src="${pageContext.request.contextPath}/resources/images/levelTest.PNG" class="img-responsive" alt="image">
        </div>
        <div class="lecture-bg">
            <img src="${pageContext.request.contextPath}/resources/images/background/backgroundimg2.png" class="img-responsive" alt="image">
        </div>
    </section>
    

    
    <!--edu-counter-->
    <section class="edu-counter section" >
        <div class="edu-counter-overlay2"></div>
        <div class="container ">
            <div class="row clearfix ">
                <!--Column-->
                <div class="col-md-3 col-sm-6 ">
                    <div class="counter-area ">
                        <h1 class="counter " id="menteeCount">${MenteeCount}</h1>
                        <h3>누적 멘티 수</h3>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 ">
                    <div class="counter-area ">
                        <h1 class="counter " id="mentoCount">${MentoCount}</h1>
                        <h3>누적 멘토 수</h3>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 ">
                    <div class="counter-area ">
                        <h1 class="counter " id="studyCount">${CourseCount}</h1>
                        <h3>누적 스터디 수</h3>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 ">
                    <div class="counter-area ">
                        <h1 class="counter " id="reviewCount">${RepCount}</h1>
                        <h3>리뷰 수</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- counter end -->
    <!-- testimonial -->
    <section class="testimonial section" style="background: url(${pageContext.request.contextPath}/resources/images/background/common.jpg) no-repeat;">
        <div class="testimonial-overlay2"></div>
        <div class="container">
            <div class="title sec-title">
                <h2>수강생 강사 리뷰</h2>
                <p>강사 리뷰가 들어가면 좋을 것 같아서 일단 놔뒀어요.</p>
            </div>
            <div class="testimonial-inner">
                <div class="testimonial-carousel owl-carousel owl-theme">
                    <div class="testimonial-item">
                        <div class="testi-img">
                            <img src="${pageContext.request.contextPath}/resources/images/users/1.jpg" alt="">
                        </div>
                        <div class="testi-content">
                            <h4>${mentoRepList[0].repWriter}</h4>
                            <span>
                                ${mentoRepList[0].repContent}
                            </span>
                        </div>
                    </div>
                    <div class="testimonial-item">
                        <div class="testi-img">
                            <img src="${pageContext.request.contextPath}/resources/images/users/2.jpg" alt="">
                        </div>
                        <div class="testi-content">
                            <h4>${mentoRepList[1].repWriter}</h4>
                            <span>
                            	${mentoRepList[1].repContent}
                            </span>
                        </div>
                    </div>
                    <div class="testimonial-item">
                        <div class="testi-img">
                            <img src="${pageContext.request.contextPath}/resources/images/users/1.jpg" alt="">
                        </div>
                        <div class="testi-content">
                            <h4>${mentoRepList[2].repWriter}</h4>
                            <span>
                            	${mentoRepList[2].repContent}
                            </span>
                        </div>
                    </div>
                    <div class="testimonial-item">
                        <div class="testi-img">
                            <img src="${pageContext.request.contextPath}/resources/images/users/2.jpg" alt="">
                        </div>
                        <div class="testi-content">
                            <h4>${mentoRepList[3].repWriter}</h4>
                            <span>
                            	${mentoRepList[3].repContent}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <!-- testimonial end -->
