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
			<div >
				<div class="teacher-details">
					
						<div class="course-tab-desc">
							${applicant.userId}님,<br>
							멘토 신청이 성공적으로 이루어졌습니다. </p>
							we will inform your resume carefully and shortly
							so, keep in touch with us within postIT !! 
							thanks. 

						</div>
						<a href="${pageContext.request.contextPath}/">메인으로 가기</a>
				</div>
			</div>
		</div>
	</div>
	</section>


</body>
</html>