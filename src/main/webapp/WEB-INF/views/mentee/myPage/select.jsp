<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	var validation = $('#isMento').val();
</script>
<body>
	<div class="popular-course course-page inner-page"
		style="margin-top: 20px">
		<div class="container">

			<section id="gallery" style="padding-top: 0px; padding-bottom: 0px">
			<div class="course-filter">
				<div class="gallery-nav">
					<sec:authorize access="hasRole('ROLE_MENTO')">
						<c:set var="validation" value="Mento" />
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
							href="${pageContext.request.contextPath}/myPage/profile/updateForm?validation=${validation}">프로필
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
					<c:when test="${mentoList[0] eq null}">
					</c:when>
					<c:otherwise>
						<h1>멘토 스터디</h1>
					</c:otherwise>
				</c:choose>
				<div class="row">
					<c:choose>
						<c:when test="${mentoList[0] eq null}">
						</c:when>
						<c:otherwise>

							<c:forEach items="${mentoList}" var="mento">
								<div class=" col-md-4 col-lg-4">
									<div class="course-content">
										<div class="course-img">
											<img class="img-responsive"
												src="${pageContext.request.contextPath}/resources/images/course/1.jpg "
												alt="image" />
										</div>
										<div class="course-detail">
											<c:set var="startDate" scope="session"
												value="${mento.courseStartDate}" />
											<%
												String startDate = (String) session.getAttribute("startDate");

															String updateStartDate = startDate.substring(0, 10);

															//session.setAttribute("updateStartDate", updateStartDate);
											%>

											<div class="course-date">
												<p>
													<%=updateStartDate%>
													${mento.courseStartTime}~${mento.courseEndTime} 첫시작
												</p>
											</div>


											<p>${mento.courseLoc}/${mento.courseLevel}</p>

											<h3>
												<a href="course-details.html" title="Details">${mento.courseTitle}</a>
											</h3>

											<div class="course-icon">
												<img
													src="${pageContext.request.contextPath}/resources/images/users/1.jpg"
													class="img-responsive" alt="image">
											</div>

											<c:set var="start" scope="session"
												value="${mento.courseStartDate}" />
											<c:set var="end" scope="session"
												value="${mento.courseEndDate}" />
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
												<span><%=result%>주</span> <span class="pull-right">${mento.coursePrice}</span>
											</div>
										</div>
										<a style="width: 100%;" class="btn btn-primary"
											href="${pageContext.request.contextPath}/classroom/${mento.courseCode}"
											target="_blank">클래스룸으로 이동</a>

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

						<h1>멘티 스터디</h1>
					</c:otherwise>
				</c:choose>
				<div class="row">
					<c:choose>
						<c:when test="${menteeList[0] eq null}">
						</c:when>
						<c:otherwise>

							<c:forEach items="${menteeList}" var="mentee">
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
												value="${mentee.courseDTO.courseStartDate}" />
											<%
												String startDate = (String) session.getAttribute("startDate");

															String updateStartDate = startDate.substring(0, 10);

															//session.setAttribute("updateStartDate", updateStartDate);
											%>

											<div class="course-date">
												<p>
													<%=updateStartDate%>
													${mentee.courseDTO.courseStartTime}~${mentee.courseDTO.courseEndTime}
													첫시작
												</p>
											</div>


											<p>${mentee.courseDTO.courseLoc}/${mentee.courseDTO.courseLevel}</p>

											<h3>
												<a href="course-details.html" title="Details">${mentee.courseDTO.courseTitle}</a>
											</h3>

											<div class="course-icon">
												<img
													src="${pageContext.request.contextPath}/resources/images/users/1.jpg"
													class="img-responsive" alt="image">
											</div>

											<c:set var="start" scope="session"
												value="${mentee.courseDTO.courseStartDate}" />
											<c:set var="end" scope="session"
												value="${mentee.courseDTO.courseEndDate}" />
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
												<span><%=result%>주</span> <span class="pull-right">${mentee.courseDTO.coursePrice}</span>
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

										<a style="width: 100%;" class="btn btn-primary"
											href="${pageContext.request.contextPath}/myPage/study/delete?userId=${mentee.userId}&courseCode=${mentee.courseDTO.courseCode}">스터디
											취소하기</a>

										<%
											} else {
										%>
										<a style="width: 100%;" class="btn btn-primary"
											href="${pageContext.request.contextPath}/classroom/${mentee.courseDTO.courseCode}"
											target="_blank">클래스룸으로 이동</a>
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