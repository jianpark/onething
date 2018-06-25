<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
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
    <title>Edustar-Educational html5 template</title>

    <!-- faveicon start   -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">

    <!-- stylesheet start -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

</head>

<body>
    <section class="breadcrumb" style="background-color: black;">
        <div class="breadcrumb-overlay"></div>
        <div class="container">
            <h1 style="text-transform: none;">
            	<a href="#" style="font-size: 20px;">${sessionScope.courseName} (${sessionScope.courseStartDate} ~ ${sessionScope.courseEndDate})</a><br><br>
            	<a href="#" style="font-size: 13px;">postIT 클래스룸</a>
            </h1>
        </div>
    </section>
    <section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                    <div class="col-md-4">
                        <div class="sidebar">
                            <div class="sidebar-widget category-widget">
                                <div class="title sidebar-widget-title">
                                    <h3>주제</h3>
                                </div>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cr/notice/selectList/"+${sessionScope.courseCode}>공지</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cr/asgn/selectList">과제</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="sidebar-widget category-widget">
                                <div class="title sidebar-widget-title">
                                    <h3>곧 마감되는 과제</h3>
                                </div>
                                <ul>
                                	 <sec:authorize access="hasRole('ROLE_MENTEE')">
				                    	<sec:authorize access="hasRole('ROLE_MENTO')">
					                    	<c:set var="mentoId"><sec:authentication property="principal.userId" /></c:set>
					                    	<c:if test="${mentoId==sessionScope.classroomMento}">
					                    		<c:forEach items="${sessionScope.deadlineList}" var="subject" begin="0" end="2">
			                                		<li>
			                                			<a href="${pageContext.request.contextPath}/cr/asgn/select/${subject.crAsgnCode}">${subject.crAsgnTitle}</a>
			                                		</li>
			                                	</c:forEach>
					                    	</c:if>
				                    	</sec:authorize>
						   			 </sec:authorize>
						   			 
                                	 <sec:authorize access="hasRole('ROLE_MENTEE')">
				                    	<c:set var="menteeId"><sec:authentication property="principal.userId" /></c:set>
				                    	<c:if test="${menteeId!=sessionScope.classroomMento}">
							                    <c:forEach items="${sessionScope.deadlineList}" var="subject" begin="0" end="2">
			                                		<li>
			                                			<a href="${pageContext.request.contextPath}/cr/asgn/select/${subject.crAsgnCode}/<sec:authentication property="principal.userId" />">${subject.crAsgnTitle}</a>
			                                		</li>
			                                	</c:forEach>
					                    </c:if>
						   			 </sec:authorize>
                                </ul>
                            </div>
                        </div>
                    </div>