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
	
	<section class="teacher-details-page inner-page">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="teacher-details">
					
						<div class="course-tab-desc">

							<h3>당신의 레벨은 =</h3>
							<c:choose>
								<c:when test="${result eq 2}">
									<h3>중급입니다.</h3>
								</c:when>

								<c:when test="${result eq 3}">
									<h3>고급입니다.</h3>
								</c:when>

								<c:otherwise>
									<h3>초급입니다.</h3>
								</c:otherwise>
							</c:choose>

						</div>
						<a href="${pageContext.request.contextPath}/">메인으로 가기</a>
				</div>
			</div>
		</div>
	</div>
	</section>


</body>
</html>