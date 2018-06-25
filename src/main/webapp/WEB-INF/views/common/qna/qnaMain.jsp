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
	<div class="container" style="margin-bottom:60px">
		<div class="pupular-course-inner clear">
			<div class="row">
				<!-- <div style="text-align: center; width: 100%;">
					<h3>QnA게시판</h3>
					<hr>
				</div> -->

				<div style="margin: 50px 0 0 0; text-align: center; width: 100%;">
					<div style="margin: 0px auto; width: 170px">
						<div class="title sec-title" style="text-align: right;">
							<h2>QnA게시판</h2>
						</div>
					</div>
				</div>
				<sec:authorize access="isAuthenticated()">
					<div style="text-align: right; width: 100%;">
						<a class="btn btn-primary"
							href="${pageContext.request.contextPath}/qna/insertQnAForm">글쓰기</a>
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
							<c:when test="${empty requestScope.qnAList }">
								<tr>
									<td colspan="5">
										<div style="text-align: center;">
											<b>등록된 게시물이 없습니다.</b>
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.qnAList}" var="qna"
									varStatus="status">
									
									<tr>
										<td>${status.count}</td>
										<td>${qna.userId}</td>
										<td><a href="${pageContext.request.contextPath}/qna/select/${qna.qaCode}">${qna.qaTitle}</a></td>
										<td>${qna.qaDate}</td>
									</tr>
									
									<c:forEach items="${requestScope.repList}" var="repQna">
										<c:if test="${repQna.qaReplyCode==qna.qaCode}">
											<tr style="opacity: 0.5; font-style: italic; font-weight: bold; color: red;">
												<td>${status.count}</td>
												<td>${repQna.userId}</td>
												<td><a href="${pageContext.request.contextPath}/qna/select/${repQna.qaCode}" style="color: red;">┗ 답변 : ${repQna.qaTitle}</a></td>
												<td>${repQna.qaDate}</td>
											</tr>
										</c:if>
									</c:forEach>
						
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


