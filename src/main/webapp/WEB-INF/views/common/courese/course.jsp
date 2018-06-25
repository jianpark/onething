<%@page import="kosta.spring.postIT.model.dto.CourseDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
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

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$("#search").on("click",function(){
		/* alert($("#courseSubGroup option:selected").val())
		alert($("#courseLoc option:selected").val())
		alert($("#courseLevel option:selected").val())
		alert($("#day option:selected").val()) */
		
		$("input[name=courseSubGroup]").attr('value',$("#courseSubGroup option:selected").val());
 	  	$("input[name=courseLoc]").attr('value',$("#courseLoc option:selected").val());
 	  	$("input[name=courseLevel]").attr('value',$("#courseLevel option:selected").val());
 	  	$("input[name=day]").attr('value',$("#day option:selected").val());
 	  	
 	  	$("#searchForm").submit();

   	});//onclick  
   
	
	
});

</script>

<body>
    
   <!-- 여기부터 수정 -->
   
<%--    <section class="breadcrumb" style="background-image: url(${pageContext.request.contextPath}/resources/images/background/breadcrumb.jpg);">
        <div class="breadcrumb-overlay"></div>
        <div class="container">
            <h1><a href="courses.html">스터디</a></h1>
            <span><a href="index.html">Home</a></span><span><i class="fa fa-angle-right"></i>Courses</span>
        </div>
    </section> --%>
    
    <div style="margin: 50px 0 0 0;text-align: center; width: 100%;">
	    <div style="margin: 0px auto; width:140px">
		    <div class="title sec-title">
				<h2>스터디</h2>
			</div>
		</div>
    </div>
    
  
  

   <div class="popular-course course-page">
        <div class="container">           
            <div class="pupular-course-inner clear">
                <div class="row">            
                	  <!-- 스터디 검색하기 -->         
                      <div class="gallery-nav">   
	                      <form action="${pageContext.request.contextPath}/course/search" id="searchForm">
	                         <select class="custom-select" style="width:178px;" id="courseSubGroup">
	                           <option class="selected">분류</option>
	                            <optgroup label="스킬업단과">
	                              <option value="U001">Java</option>
	                              <option value="U002">C</option>
	                              <option value="U003">자료구조/알고리즘</option>
	                              <option value="U004">DBMS</option>
	                           </optgroup>
	                           <optgroup label="웹/앱 개발">
	                              <option value="W001">백엔드 개발자</option>
	                              <option value="W002">프론트엔드 개발자</option>
	                              <option value="W003">안드로이드앱 개발자</option>
	                              <option value="W004">아이폰앱 개발자</option>
	                           </optgroup>
	                           <optgroup label="해킹/보안">
	                              <option value="H001">사이버해킹 보안</option>
	                              <option value="H002">웹 해킹</option>
	                              <option value="H003">시스템 해킹</option>
	                           </optgroup>
	                           <optgroup label="서버 네트워크">
	                              <option value="S001">리눅스 서버</option>
	                              <option value="S002">네트워크 엔지니어</option>
	                           </optgroup>
	                        </select>
	      
	                        <select class="custom-select" style="width:178px;" id="courseLoc">
	                           <option class="selected">지역</option>
	                            <optgroup label="서울">
	                              <option value="건대">건대</option>
	                              <option value="홍대">홍대</option>
	                              <option value="종각">종각</option>
	                              <option value="강남">강남</option>
	                              <option value="신촌">신촌</option>
	                              <option value="노원">노원</option>
	                           </optgroup>
	                           <optgroup label="수도권">
	                              <option value="인천">인천</option>
	                              <option value="부평">부평</option>
	                              <option value="수원역">수원역</option>
	                              <option value="영통역">영통역</option>
	                              <option value="광교">광교</option>
	                              <option value="분당">분당</option>
	                              <option value="안양">안양</option>
	                              <option value="일산">일산</option>
	                           </optgroup>
	                        </select>
	                        
	                        <select class="custom-select" style="width:178px;" id="courseLevel">
	                           <option class="selected">레벨</option>                            
	                              <option value="초급">초급</option>
	                              <option value="중급">중급</option>
	                              <option value="고급">고급</option>
	                        </select>
	                        
	                        <select class="custom-select" style="width:178px;" id="day">
	                           <option class="selected">시간</option>                            
	                              <option value="평일">평일</option>
	                              <option value="주말">주말</option>
	                        </select>
	                        
	                        <input type="hidden" name="courseSubGroup" value="">
	                        <input type="hidden" name="courseLoc" value="">
	                        <input type="hidden" name="courseLevel" value="">
	                        <input type="hidden" name="day" value="">
	                        
	                        <button type="submit" class="btn" id="search">검색하기</button>
	                     </form>                    
                    </div>

                    <!-- 스터디 보여주기 -->
                    <c:if test="${!empty courseListSelect}">
                    	<c:forEach items="${courseListSelect}" var="courseDTO">
                   			
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
		                    <div class=" col-md-4 col-lg-4">		            
		                        <div class="course-content">	                        	
		                            <div class="course-img ">
		                            	<!-- 코스 배경화면 -->
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
		                                	<!-- 멘토 프로필사진 -->
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
		                    
                    		<!-- </form> -->
                    	</c:forEach>
                    </c:if>  
                    <c:if test="${empty courseListSelect}">
                    	<div class="gallery-nav" style="margin-top: 0">                  
                           <!-- <div class="course-content"> -->
                              검색된 스터디가 없습니다.
                          <!--  </div> -->
                     	</div>
                    </c:if>    
                    <!-- 여기까지 -->

                </div>
            </div>
        </div>

    </div>
   
  

</body>

</html>