<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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

<%-- 	<section class="breadcrumb"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/background/breadcrumb.jpg);">
	<div class="breadcrumb-overlay"></div>
	<div class="container">
		<h1>
			<a href="courses.html">MyPage</a>
		</h1>
		<span><a href="index.html">Home</a></span> <span><i
			class="fa fa-angle-right"></i>MyPage</span>
	</div>
	</section> --%>

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
				<div class="row">
					<c:choose>
						<c:when test="${favList[0] eq null}">
							<div
								style="text-align: center; margin: 0 auto; margin-bottom: 200px">찜한
								스터디가 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${favList}" var="favStudy">
								<div class=" col-md-4 col-lg-4">
									<div class="course-content">
										<div class="course-img">
											<img class="img-responsive"
												src="${pageContext.request.contextPath}/resources/images/course/1.jpg "
												alt="image" />
										</div>
										<div class="course-detail">
											<c:set var="startDate" scope="session"
												value="${favStudy.courseDTO.courseStartDate}" />
											<%
												String startDate = (String) session.getAttribute("startDate");

															String updateStartDate = startDate.substring(0, 10);

															//session.setAttribute("updateStartDate", updateStartDate);
											%>

											<div class="course-date">
												<p>
													<%=updateStartDate%>
													${favStudy.courseDTO.courseStartTime}~${favStudy.courseDTO.courseEndTime}
													첫시작
												</p>
											</div>


											<p>${favStudy.courseDTO.courseLoc}/${favStudy.courseDTO.courseLevel}</p>

											<h3>
												<a href="course-details.html" title="Details">${favStudy.courseDTO.courseTitle}</a>
											</h3>

											<div class="course-icon">
												<img
													src="${pageContext.request.contextPath}/resources/images/users/1.jpg"
													class="img-responsive" alt="image">
											</div>

											<c:set var="start" scope="session"
												value="${favStudy.courseDTO.courseStartDate}" />
											<c:set var="end" scope="session"
												value="${favStudy.courseDTO.courseEndDate}" />
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
												<span><%=result%>주</span> <span class="pull-right">${favStudy.courseDTO.coursePrice}</span>
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