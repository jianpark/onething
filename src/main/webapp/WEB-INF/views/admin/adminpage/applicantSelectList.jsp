<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
    <!--meta tag start-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="edustar">
    <meta name="author" content="khanalprem">
    <meta name="copyright" content="khanalprem">

    <!--title-->
    <title>Edustar-Educational html5 template</title>

    <!-- faveicon start   -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">

    <!-- stylesheet start -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style type="text/css">
    
    .title h3::after {
    background: transparent none repeat scroll 0 0;
    bottom: -15px;
    content: "";
    height: 2px;
    left: 0;
    position: absolute;
    width: 50px;
}

#right{
   float: right;
}
    
    
    </style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
</head>


<body>
    
      <section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                <div class="col-md-4">
                    <div class="title inner-page-title">
                   <h3 class="appImage" style="font-size: 20px"><img alt="appImage" src="${pageContext.request.contextPath}/resources/images/admin/appImage.png">멘토신청자 명단</h3>
                </div>                    
                </div>
                </div>
                <div class="row" style="width: 100%;"> 
                    <div id="right"class="col-md-15">
                    
                           <!-- 관리자 멘토신청자 명단 리스트 화면 -->
                           
                            <div style="margin-top: .5em">
                        <div class="table-responsive" style="width: 100%;">
                            <table class="table" style="width : 100%;">
                                <tbody>
                                    <tr bgcolor="Lightgray" style="color: white;">
                                       
                                        <th style="width: 100px; height: 10px">이름</th>
                                        <th style="width: 100px; height: 10px">아이디</th>
                                        <th style="width: 150px; height: 10px">주력분야</th>
                                        <th style="width: 200px; height: 10px">이력서</th>
                                        <th style="width: 80px; height: 10px">상태</th>
                                        <th style="width: 50px; height: 10px"></th>
                                    </tr>
                                    
                                    <c:if test="${empty selectApplicantList}">
                                    	<td colspan="6" style="text-align: center; font-weight: bold;">현재 지원자가 없습니다.</td>
                                    </c:if>
                                    
                                  <c:forEach items="${selectApplicantList}" var="applicantDTO">
                                  	
                                  	
                                  	<c:set var="applicantMajor1" scope="session" value="${applicantDTO.applicantMajor}" />
			                         <%
			                             String courseCode1 = ((String) session.getAttribute("applicantMajor1"));   
			                         
			                            String courseCodeName1 ="";
			                             if(courseCode1.equals("U001")){
			                            	 courseCodeName1="Java";
			                             } if(courseCode1.equals("U002")){
			                            	 courseCodeName1="C";
			                             } if(courseCode1.equals("U003")){
			                            	 courseCodeName1="자료구조/알고리즘";
			                             } if(courseCode1.equals("U004")){
			                            	 courseCodeName1="DBMS";
			                             } if(courseCode1.equals("W001")){
			                            	 courseCodeName1="백엔드 개발자";
			                             } if(courseCode1.equals("W002")){
			                            	 courseCodeName1="프론트엔드 개발자";
			                             } if(courseCode1.equals("W003")){
			                            	 courseCodeName1="안드로이드앱 개발자";
			                             } if(courseCode1.equals("W004")){
			                            	 courseCodeName1="아이폰앱 개발자";
			                             } if(courseCode1.equals("H001")){
			                            	 courseCodeName1="사이버해킹 보안";
			                             } if(courseCode1.equals("H002")){
			                            	 courseCodeName1="웹 해킹";
			                             } if(courseCode1.equals("H003")){
			                            	 courseCodeName1="시스템 해킹";
			                             } if(courseCode1.equals("S001")){
			                            	 courseCodeName1="리눅스 서버";
			                             } if(courseCode1.equals("S002")){
			                            	 courseCodeName1="네트워크 엔지니어";
			                             }
			                         %>
                                  	<c:set var="applicantMajor2" scope="session" value="${applicantDTO.applicantMajor2}" />
			                         <%
			                             String courseCode2 = ((String) session.getAttribute("applicantMajor2"));   
			                         
			                            String courseCodeName2 ="";
			                            if(courseCode2!=null){
			                                if(courseCode2.equals("U001")){
				                            	 courseCodeName2="Java";
				                             } if(courseCode2.equals("U002")){
				                            	 courseCodeName2="C";
				                             } if(courseCode2.equals("U003")){
				                            	 courseCodeName2="자료구조/알고리즘";
				                             } if(courseCode2.equals("U004")){
				                            	 courseCodeName2="DBMS";
				                             } if(courseCode2.equals("W001")){
				                            	 courseCodeName2="백엔드 개발자";
				                             } if(courseCode2.equals("W002")){
				                            	 courseCodeName2="프론트엔드 개발자";
				                             } if(courseCode2.equals("W003")){
				                            	 courseCodeName2="안드로이드앱 개발자";
				                             } if(courseCode2.equals("W004")){
				                            	 courseCodeName2="아이폰앱 개발자";
				                             } if(courseCode2.equals("H001")){
				                            	 courseCodeName2="사이버해킹 보안";
				                             } if(courseCode2.equals("H002")){
				                            	 courseCodeName2="웹 해킹";
				                             } if(courseCode2.equals("H003")){
				                            	 courseCodeName2="시스템 해킹";
				                             } if(courseCode2.equals("S001")){
				                            	 courseCodeName2="리눅스 서버";
				                             } if(courseCode2.equals("S002")){
				                            	 courseCodeName2="네트워크 엔지니어";
				                             }
			                            }
			                         
			                         %>                                  	
                                  	<c:set var="applicantMajor3" scope="session" value="${applicantDTO.applicantMajor3}" />
			                         <%
			                             String courseCode3 = ((String) session.getAttribute("applicantMajor3"));   
			                         
			                         
			                            String courseCodeName3 ="";
			                            
			                            if(courseCode3!=null){
			                                if(courseCode3.equals("U001")){
				                                courseCodeName3="Java";
				                             } if(courseCode3.equals("U002")){
				                                courseCodeName3="C";
				                             } if(courseCode3.equals("U003")){
				                                courseCodeName3="자료구조/알고리즘";
				                             } if(courseCode3.equals("U004")){
				                                courseCodeName3="DBMS";
				                             } if(courseCode3.equals("W001")){
				                                courseCodeName3="백엔드 개발자";
				                             } if(courseCode3.equals("W002")){
				                                courseCodeName3="프론트엔드 개발자";
				                             } if(courseCode3.equals("W003")){
				                                courseCodeName3="안드로이드앱 개발자";
				                             } if(courseCode3.equals("W004")){
				                                courseCodeName3="아이폰앱 개발자";
				                             } if(courseCode3.equals("H001")){
				                                courseCodeName3="사이버해킹 보안";
				                             } if(courseCode3.equals("H002")){
				                                courseCodeName3="웹 해킹";
				                             } if(courseCode3.equals("H003")){
				                                courseCodeName3="시스템 해킹";
				                             } if(courseCode3.equals("S001")){
				                                courseCodeName3="리눅스 서버";
				                             } if(courseCode3.equals("S002")){
				                                courseCodeName3="네트워크 엔지니어";
				                             }
			                            }
			                            
			                        
			                         %>                                  	
                                  		
                                  		
                                       <tr>
                                         
                                           <td><span>${applicantDTO.menteeDTO.userName}</span></td>
                                           <td><span>${applicantDTO.userId}</span></td>
                                           <td>
                                              <span><%=courseCodeName1 %></span><p>
                                              <span><%=courseCodeName2 %></span><p>
                                              <span><%=courseCodeName3 %></span>
                                           </td>
                                           <td><span><a href="${pageContext.request.contextPath}/admin/resumeDownLoad?fileName=${applicantDTO.applicantResume}">${applicantDTO.applicantResume}</a></span></td>
                                           <form action="${pageContext.request.contextPath}/admin/changeStatus" id="changeStatusForm">
                                           <td>
                                                <c:choose>
                                                   <c:when test="${applicantDTO.applicantStatus eq '0'}">
                                                      <c:set var="stName" value="서류심사중"></c:set>
                                                      <input type="text" value="${stName}">
                                                   </c:when>
                                                   <c:otherwise>
                                                      <input type="text" value="${applicantDTO.applicantStatus}">
                                                   </c:otherwise>
                                                </c:choose>
                                                                                  
                                              <select style="border-radius: 5px" id="selectBoxStatus" name="selectBox">
                                                 <option class="selected">상태</option>
                                                 <option id="0" value="서류심사중">서류심사중</option>
                                                 <option id="1" value="면접심사중">면접심사중</option>
                                                 <option id="2" value="멘토승인완료">멘토승인완료</option>
                                                 <option id="3" value="거절">거절</option>
                                              </select>
                                              
                                           </td>
                                           <td>
                                              <button type="submit" class="btn" id="changeStatus">확인</button>
                                           </td>
                                           
                                           <!-- <input type="hidden" name="selectBoxStatus" value=""> -->
                                           <input type="hidden" name="userId" value="${applicantDTO.userId}">
                                           </form>
                                       </tr>
                                  </c:forEach>
                                </tbody>
                            </table>
                            
                        </div>
                    </div>
                    
                     
                    </div>
                  
                </div>
            </div>
        </div>
       
    </section>
    <!-- scroll top -->
    <a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>
    <!-- srolltop end -->

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/countdown.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>

</html>