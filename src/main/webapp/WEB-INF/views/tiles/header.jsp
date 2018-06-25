<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>

<head>
    <!--meta tag start-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="edustar">
    <meta name="author" content="khanalprem">
    <meta name="copyright" content="khanalprem">
    <!--title-->
    <title>PostIT</title>

    <!-- faveicon start   -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">

    <!-- stylesheet start -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    <!-- icon 전용 CSS https://saeedalipoor.github.io/icono/참조 -->
    <link rel="stylesheet" href="http://icono-49d6.kxcdn.com/icono.min.css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
</head>
<style>

   #tophead-link{background-color: skyblue}
   
   #tophead-link{background-color: skyblue}
   
   input[type="text"]{
       text-transform:none;
    }
    
    .top-header {
    background: skyblue;
    padding: 10px 0;
    clear: both;
   }

</style>

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
<script>
   function logout() {
      document.getElementById("logoutForm").submit();
   }
   
   $(document).ready(function(){
      function selectAll(){
         var ajaxNotId = $('#ajaxNotId').val();
         $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/notification/select",
            data:"${_csrf.parameterName}=${_csrf.token}&&userId="+ajaxNotId,
            dataType:"json", //(text, html, xml, json)
            success:function(result){
               str="";
               unReadCount=0;
               readCount=0;
               if(jQuery.isEmptyObject(result)){
                  str+="<a class='dropdown-item' href='#' style='text-align: center;'>도착한 알림이 없습니다.</a>"
               }else{
                  str+="<div style='text-align:center;'><font size='2em' color='gray'>읽지않은 메시지</font></div>"
                  
                  $.each(result, function(index, item){
                     if(item.notIsRead == 0){
                        unReadCount = unReadCount+1;
                        str+="<a class='dropdown-item' href='#'>"+item.senderName+" "+item.notDatetime+"<br>"+item.notMessage+"</a>"
                        str+="<div style='text-align: right;'>"
                        str+="<span class='icono-eye' name="+item.notId+" aria-hidden='true' style='color: #000000;  transform : scale(0.5);'></span>"
                        str+="<span class='icono-trash' name="+item.notId+" aria-hidden='true' style='color: #000000;  transform : scale(0.5);'></span>"
                        str+="</div>"
                     }
                  });
                  if(unReadCount==0){
                     str+="<div style='text-align:center;'><font size='2em' color='gray'>읽지않은 메시지가 없습니다.</font></div><br>"
                  }
                  
                  str+="<div style='text-align:center;'><font size='2em' color='gray'>읽은 메시지</font></div>"
                  $.each(result, function(index, item){
                     if(item.notIsRead == 1){
                        readCount = readCount+1;
                        str+="<a class='dropdown-item' href='#' style='opacity: 0.5;'>"+item.senderName+" "+item.notDatetime+"<br>"+item.notMessage+"</a>"
                        str+="<div style='text-align: right; opacity: 0.5;'>"
                        str+="<span class='icono-eye' name="+item.notId+" aria-hidden='true' style='color: #000000;  transform : scale(0.5);'></span>"
                        str+="<span class='icono-trash' name="+item.notId+" aria-hidden='true' style='color: #000000;  transform : scale(0.5);'></span>"
                        str+="</div>"
                     }
                  });
                  if(readCount==0){
                     str+="<div style='text-align:center;'><font size='2em' color='gray'>읽은 메시지가 없습니다.</font></div><br>"
                  }
                  str+="<div style='text-align:right; margin-top:10px;'><font class='allRead' size='2em' color='gray'>전체읽음표시 </font><font class='allDel' size='2em' color='gray'>전체삭제</font></div>"
               }
               
               
               $("#notificationList").html(str);                           
               $("a").css("textDecoration","none");
               
               if(unReadCount>0){
                  $("#notIcon").css("color", "red");
               }else{
                  $("#notIcon").css("color", "black");   
               }
               
            
            },
            error:function(err){
               console.log("에러발생 : "+err);
            }
         });
      }
      
      
      
      $('.icono-disqus').click(function(){
         selectAll();
      })
      

      //삭제하기
      $(document).on("click",".icono-trash",function(){
          var notId = $(this).attr("name").trim();

         $.ajax({      
            type:"post",  //서블릿의 doPost()와 맞아야 한다. 
            url:"${pageContext.request.contextPath}/notification/delete",
            data:"${_csrf.parameterName}=${_csrf.token}&&notId="+notId,
            dataType:"text", //(text, html, xml, json)
            success:function(result){
               if(result>0){
                  selectAll();
               }else{
                  alert("삭제되지 않았습니다.");
               }
            },
            error:function(err){
               console.log("에러발생 : "+err);
            }   
         });
      });
      
      
      //읽음표시
      $(document).on("click",".icono-eye",function(){
          var notIdReadStatus = $(this).attr("name").trim();

         $.ajax({      
            type:"post",  //서블릿의 doPost()와 맞아야 한다. 
            url:"${pageContext.request.contextPath}/notification/updateReadStatus",
            data:"${_csrf.parameterName}=${_csrf.token}&&notIdReadStatus="+notIdReadStatus,
            dataType:"text", //(text, html, xml, json)
            success:function(result){
               if(result>0){
                  selectAll();
               }else{
                  alert("삭제되지 않았습니다.");
               }
            },
            error:function(err){
               console.log("에러발생 : "+err);
            }   
         });
      });
      
      
      //전체삭제하기
      $(document).on("click",".allDel",function(){
          var allDelUserId = $('#ajaxNotId').val().trim();
         $.ajax({      
            type:"post",  //서블릿의 doPost()와 맞아야 한다. 
            url:"${pageContext.request.contextPath}/notification/deleteAll",
            data:"${_csrf.parameterName}=${_csrf.token}&&allDelUserId="+allDelUserId,
            dataType:"text", //(text, html, xml, json)
            success:function(result){
               if(result>0){
                  selectAll();
               }else{
                  alert("삭제되지 않았습니다.");
               }
            },
            error:function(err){
               console.log("에러발생 : "+err);
            }   
         });
      });
      
      
      //전체읽음표시하기
      $(document).on("click",".allRead",function(){
          var allReadUserId = $('#ajaxNotId').val().trim();
         $.ajax({      
            type:"post",  //서블릿의 doPost()와 맞아야 한다. 
            url:"${pageContext.request.contextPath}/notification/readAll",
            data:"${_csrf.parameterName}=${_csrf.token}&&allReadUserId="+allReadUserId,
            dataType:"text", //(text, html, xml, json)
            success:function(result){
               if(result>0){
                  selectAll();
               }else{
                  alert("오류가 발생했습니다.");
               }
            },
            error:function(err){
               console.log("에러발생 : "+err);
            }   
         });
      });
      
      
      selectAll();
   });
   
   
</script>

<body>
<!--

<c:choose>
   <c:when test="${not empty pageContext.request.userPrincipal}"><p>
   
   <form action="${pageContext.request.contextPath}/j_spring_security_logout" method="get">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="submit" value="로그아웃">
   </form>
   
   </c:when>
   
   <c:otherwise>
      <li>
      <a href="${pageContext.request.contextPath}/loginForm"><i class="fa fa-lock" aria-hidden="true"></i> 로그인</a>
        </li>
   </c:otherwise>
</c:choose>-->


<%-- <sec:authorize access="isAuthenticated()">
         <li><a href="javascript:logout();">로그아웃</a></li>
      </sec:authorize>
 --%>


    <header>
    <sec:authorize access="isAuthenticated()">
       <c:set var="loginedId"><sec:authentication property="principal.userId"/></c:set>
       <c:choose>
          <c:when test="${loginedId eq 'admin'}">
             <div class="top-header" style="background-color: red;">   
          </c:when>
          <c:otherwise>
             <div class="top-header">
          </c:otherwise>
       </c:choose>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
       <div class="top-header">
    </sec:authorize>
   
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <ul class="tophead-link" >
                            <li><a href="${pageContext.request.contextPath}/"><i > Welcome to PostIT center!</i></a></li>
                        </ul>
                    </div>
                    
                    <div class="col-md-7 col-sm-7 col-xs-7 tophead-right">
                        <ul class="tophead-link">
                            <c:choose>
                        <c:when test="${not empty pageContext.request.userPrincipal}">
                              <li><a href="javascript:logout();"><i class="fa fa-lock" aria-hidden="true"></i>로그아웃</a></li>
                              <li>
                                        <sec:authorize access="isAuthenticated()">
                                          <a href="${pageContext.request.contextPath}/myPage/study/select?userId=<sec:authentication property="principal.userId" />"><sec:authentication property="principal.userName"/>님 MyPage </a>
                                          <!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
                                        <input type="hidden" id="ajaxNotId" value="<sec:authentication property="principal.userId"/>">
                                        </sec:authorize>
                              </li>  
                              <li><a href="${pageContext.request.contextPath}/myPage/insertApplicantForm">멘토신청하기</a></li>
                        </c:when>
                        
                        
                        <c:otherwise>
                           <li>
                           <a href="${pageContext.request.contextPath}/loginForm"><i class="fa fa-lock" aria-hidden="true"></i> 로그인</a>
                             </li>
                             
                             <li>
                                  <a href="join"><i class="fa fa-key" aria-hidden="true"></i> 회원가입</a>
                                  </li>
                        </c:otherwise>
                     </c:choose>
                            
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <!-- Start Navigation -->
        <div id="masthead" class="site-header menu">
            <div class="container">
                <div class="site-branding">
                    <div id="site-identity" style="padding-top: 10px">
                        <a href="${pageContext.request.contextPath}/" class="logo"><img src="${pageContext.request.contextPath}/resources/images/postitlogo.PNG" alt="logo"></a>
                    </div>
                    <!-- #site-identity -->
                </div>
                <!-- .site-branding -->
                <div class="header-nav-search">
                    <div class="header-search">
                       <i class="fa fa-search top-search" style="padding-top: 30px"></i>
                          <div class="search-popup" >
                               <form role=search action="${pageContext.request.contextPath}/search" class="search-wrapper">
                                   <div>
                                       <input type="text" name="search" placeholder="강사, 강좌이름으로 검색해주세요.">
                                       <input type="submit" name="button" class="pop-search" value="검색">
                                   </div>
                               </form>
                               <div class="search-overlay"></div>
                           </div>
                    </div>
                    <div class="toggle-button">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div id="main-navigation">
                        <nav class="main-navigation"  style="padding-top: 30px">
                            <div class="close-icon">
                                <i class="fa fa-close"></i>
                            </div>
                            <ul>
                                <li class="current-menu-item "><a href="${pageContext.request.contextPath}/">Home</a></li>
                                <li><a href="${pageContext.request.contextPath}/notice/mainPage">Notice</a> </li>
                                <li class="menu-item-has-children"><a href="${pageContext.request.contextPath}/course">courses</a></li>
                                
                                 <li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>                                
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                 <li><a href="${pageContext.request.contextPath}/admin/dashboard/selectAll">Dashboard</a></li>
                                 <li><a href="${pageContext.request.contextPath}/admin/menteeSelect">Member</a></li>
                                 <li><a href="${pageContext.request.contextPath}/admin/applicationSelect">Applicant</a></li>
                                 <li><a href="${pageContext.request.contextPath}/banner/selectList">banner</a></li>
                                </sec:authorize>
                                
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                   <li>
                                      <div class="dropdown">
                                  <span class="dropdown-toggle" data-toggle="dropdown">
                                     <span id="notIcon" class="icono-disqus" aria-hidden="true" style="color: black;  transform : scale(0.5);" ></span>
                                  </span>
                                  <div id="notificationList" class="dropdown-menu" style="width: 350px; overflow-y:scroll; overflow-x:hidden; height:400px;">
                                     
                                  </div>
                              </div>
                                   </li> 
                                                        
                                </c:if>
                                
                                
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Navigation -->
        
        
    <!-- 
   로그아웃은 스프링시큐리티 4 부터는 로그아웃시 POST 방식으로 이동하며 /logout url로 요청한다. (따로 정의하지 않으면)
   그리고 _csrf 를 요청파라미터로 보내야 한다.
    -->
   <form id="logoutForm" action="${pageContext.request.contextPath}/member/logout" method="post" style="display: none">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   </form>
        
    </header>