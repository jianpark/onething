<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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

	<section class="teacher-details-page inner-page">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="teacher-details">
					
						<div class="course-tab-desc">
							${MenteeDTO.userId}님,<br>
							정보가 갱신되었습니다.

						</div>
						<a href="${pageContext.request.contextPath}/">메인으로 가기</a>
				</div>
			</div>
		</div>
	</div>
	</section>


</body>
</html>