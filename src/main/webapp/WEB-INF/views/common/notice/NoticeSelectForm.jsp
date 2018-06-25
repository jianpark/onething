<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="container">

	<sec:authorize access="isAuthenticated()">
		<c:set var="id"><sec:authentication property="principal.userId"/></c:set>
	</sec:authorize>
	
	<div>
		<div class="title inner-page-title">
			<h3>공지사항 상세보기</h3>
		</div>
		<div style="width: 70%; margin-left: 200px;">
			<form>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="row">
					<div class="col-sm-12 ">
						<div class="form-group">
							<label>공지 제목 :</label> 
							<input type="text" name="noticeTitle" class="form-control" placeholder="title" value="${requestScope.noticeDTO.noticeTitle}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>공지 내용 :</label>
							<textarea rows="6" name="noticeContent" class="form-control"
								placeholder="content" style="height: 400px;" readonly="readonly">${requestScope.noticeDTO.noticeContent}</textarea>
						</div>
						<c:if test="${requestScope.noticeDTO.noticeFileName!=null}">
							<div class="form-group">
		                    	<label>다운로드</label> : 
	                            	<a href='${pageContext.request.contextPath}/notice/downLoad?fname=${requestScope.noticeDTO.noticeFileName}'>${requestScope.noticeDTO.noticeFileName}</a>
		                    </div>
						</c:if>
					</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div class="col-md-12">
							<div class="form-group" style="text-align: right;">
								<a href="${pageContext.request.contextPath}/notice/updateForm/${requestScope.noticeDTO.noticeCode}" class="btn btn-primary">수정</a>
								<a href="${pageContext.request.contextPath}/notice/delete/${requestScope.noticeDTO.noticeCode}" class="btn btn-primary">삭제</a>
							</div>
						</div>
					</sec:authorize>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</div>
</div>
</section>



<!-- scroll top -->
<a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>
<!-- srolltop end -->
