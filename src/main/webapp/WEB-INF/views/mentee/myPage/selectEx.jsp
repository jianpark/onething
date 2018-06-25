<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script>
$(function(){
		
	$("a[id='리뷰 작성 완료']").bind('click', false);
	
})

</script>
<body>
	<%
	String userId = (String)request.getAttribute("userId");
		
	%>
	<%-- <%= userId %> --%>


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

					<ul>
						<li class="filter" data-filter="all"><a
							href="${pageContext.request.contextPath}/myPage/study/select?userId=${userId}">내
								스터디</a></li>
						<li class="filter" data-filter="all"><a
							href="${pageContext.request.contextPath}/myPage/favStudy/select?userId=${userId}">찜한
								스터디</a></li>
						<li class="filter" data-filter="all"><a
							href="${pageContext.request.contextPath}/myPage/exStudy/select?userId=${userId}">완료된
								스터디</a></li>
						<li class="filter" data-filter="all"><a
							href="${pageContext.request.contextPath}/myPage/profile/updateForm">프로필
								수정</a></li>
						<sec:authorize access="hasRole('ROLE_MENTO')">
							<li class="filter"><a
								href="${pageContext.request.contextPath}/myPage/studyInsert/insertForm">스터디
									만들기</a></li>
						</sec:authorize>
					</ul>

				</div>
			</div>
			</section>

			<div class="pupular-course-inner clear">
				<c:choose>
					<c:when test="${mentoExList[0] eq null}">
					</c:when>
					<c:otherwise>
						<h1>완료된 멘토 스터디</h1>
					</c:otherwise>
				</c:choose>
				<div class="row">
					<c:choose>
						<c:when test="${mentoExList[0] eq null}">
						</c:when>
						<c:otherwise>

							<c:forEach items="${mentoExList}" var="mentoEx">
								<div class=" col-md-4 col-lg-4">
									<div class="course-content">
										<div class="course-img">
											<img class="img-responsive"
												src="${pageContext.request.contextPath}/resources/images/course/1.jpg "
												alt="image" />
										</div>
										<div class="course-detail">
											<c:set var="startDate" scope="session"
												value="${mentoEx.courseStartDate}" />
											<%
												String startDate = (String) session.getAttribute("startDate");

															String updateStartDate = startDate.substring(0, 10);

															//session.setAttribute("updateStartDate", updateStartDate);
											%>

											<div class="course-date">
												<p>
													<%=updateStartDate%>
													${mentoEx.courseStartTime}~${mentoEx.courseEndTime} 첫시작
												</p>
											</div>


											<p>${mentoEx.courseLoc}/${mentoEx.courseLevel}</p>

											<h3>
												<a href="course-details.html" title="Details">${mentoEx.courseTitle}</a>
											</h3>

											<div class="course-icon">
												<img
													src="${pageContext.request.contextPath}/resources/images/users/1.jpg"
													class="img-responsive" alt="image">
											</div>

											<c:set var="start" scope="session"
												value="${mentoEx.courseStartDate}" />
											<c:set var="end" scope="session"
												value="${mentoEx.courseEndDate}" />
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
											<div class="course-bottom">
												<span><%=result%>주</span> <span class="pull-right">${mentoEx.coursePrice}</span>
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

						<h1>완료된 멘티 스터디</h1>
					</c:otherwise>
				</c:choose>
				<div class="row">
					<c:choose>
						<c:when test="${menteeExList[0] eq null}">
						</c:when>
						<c:otherwise>

							<c:forEach items="${menteeExList}" var="menteeEx">
								<div class=" col-md-4 col-lg-4">
									<div class="course-content">
										<div class="course-img">
											<img class="img-responsive"
												src="${pageContext.request.contextPath}/resources/images/course/1.jpg "
												alt="image" />
											<%-- /${mentee.courseDTO.menteeDTO.userPhoto} --%>
										</div>
										<div class="course-detail">
											<c:set var="startDate" scope="session"
												value="${menteeEx.courseDTO.courseStartDate}" />
											<%
												String startDate = (String) session.getAttribute("startDate");

															String updateStartDate = startDate.substring(0, 10);

															//session.setAttribute("updateStartDate", updateStartDate);
											%>

											<div class="course-date">
												<p>
													<%=updateStartDate%>
													${menteeEx.courseDTO.courseStartTime}~${menteeEx.courseDTO.courseEndTime}
													첫시작
												</p>
											</div>


											<p>${menteeEx.courseDTO.courseLoc}/${menteeEx.courseDTO.courseLevel}</p>

											<h3>
												<a href="course-details.html" title="Details">${menteeEx.courseDTO.courseTitle}</a>
											</h3>

											<div class="course-icon">
												<img
													src="${pageContext.request.contextPath}/resources/images/users/1.jpg"
													class="img-responsive" alt="image">
											</div>

											<c:set var="start" scope="session"
												value="${menteeEx.courseDTO.courseStartDate}" />
											<c:set var="end" scope="session"
												value="${menteeEx.courseDTO.courseEndDate}" />
											<%
												String end = ((String) session.getAttribute("end")).substring(0, 10);
															String start = ((String) session.getAttribute("start")).substring(0, 10);

															SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

															Date d1 = formatter.parse(end);
															Date d2 = formatter.parse(start);

															//System.out.println("d2--------------"+d2);

															long difference = d1.getTime() - d2.getTime();

															long differenceDay = difference / (1000 * 60 * 60 * 24 * 7);

															int result = (int) Math.ceil(differenceDay);
											%>
											<div class="course-bottom">
												<span><%=result%>주</span> <span class="pull-right">${menteeEx.courseDTO.coursePrice}</span>
											</div>
										</div>

										<a id="${menteeEx.state}" style="width: 100%;"
											class="btn btn-primary"
											href="${pageContext.request.contextPath}/myPage/exStudy/reviewInsertForm?userId=${menteeEx.userId}&courseCode=${menteeEx.courseCode}">${menteeEx.state}</a>

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