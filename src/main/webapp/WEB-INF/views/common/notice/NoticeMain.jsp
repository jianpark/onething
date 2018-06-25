<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<head>
<style type="text/css">
.table thead tr th {
	text-align: center;
}

.table tbody tr td {
	text-align: center;
}
</style>
</head>

<div class="popular-course course-page">
	<div class="container" style="margin-bottom:60px ">
		<div class="pupular-course-inner clear">
			<div class="row">
			<!-- <div style="text-align: center; width: 100%;">
					<h3>공지사항</h3>
					<hr>
				</div> -->

				<div style="margin: 50px 0 0 0; text-align: center; width: 100%;">
					<div style="margin: 0px auto; width: 140px">
						<div class="title sec-title" style="text-align: right;">
							<h2>공지사항</h2>
						</div>
					</div>
				</div>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div style="text-align: right; width: 100%;">
						<a class="btn btn-primary"
							href="${pageContext.request.contextPath}/notice/insertForm">글쓰기</a>
					</div>
				</sec:authorize>
				<table class="table" style="margin-top: 5px;">
					<thead>
						<tr bgcolor="lightGrey" style="color: white"><!-- 여기 수정 -->
							<th style="width: 10%;">번호</th>
							<th style="width: 20%;">아이디</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 30%;">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty requestScope.noticeList }">
								<tr>
									<td colspan="5">
										<div style="text-align: center;">
											<b>등록된 게시물이 없습니다.</b>
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.noticeList}" var="notice"
									varStatus="status">
									
									<tr>
										<td>${status.count}</td>
										<td>${notice.noticeWriter}</td>
										<td><a href="${pageContext.request.contextPath}/notice/select/${notice.noticeCode}">${notice.noticeTitle}</a></td>
										<td>${notice.noticeDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- <div class="page">
	<ul class="pagination">
		<li class="disabled"><a href="#"><i
				class="fa fa-long-arrow-left"></i></a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
	</ul>
</div> -->
</body>

</html>


