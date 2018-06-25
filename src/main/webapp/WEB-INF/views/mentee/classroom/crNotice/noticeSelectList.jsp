<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	<script type="text/javascript">
		function checkValid() {
		    var f = window.document.insertNoticeReply;
		      
		   if (f.crReplyContent.value == "") {
		       alert( "댓글 내용을 입력해 주세요." );
		       f.crReplyContent.focus();
		      return false;
		    }

		    return true;
		}
	</script>
                    
                    <div class="col-md-8">
	                    <sec:authorize access="hasRole('ROLE_MENTEE')">
	                    	<sec:authorize access="hasRole('ROLE_MENTO')">
		                    	<c:set var="mentoId"><sec:authentication property="principal.userId" /></c:set>
		                    	<c:if test="${mentoId==sessionScope.classroomMento}">
		                    		<!-- 멘토가 보는 부분 공지등록버튼-->
				                    <div style="margin-bottom: 15px; text-align: right;">
				                    	<a class="btn btn-primary" href="${pageContext.request.contextPath}/cr/mentoNotice/noticeInsertForm">공지사항 등록</a>
				                    </div>
		                    	</c:if>
	                    	</sec:authorize>
						</sec:authorize>
	                    
                    
                    	<c:choose>
                    		<c:when test="${empty mento.notices}">
                    			<div class="blog-div">
		                            <div class="blog-desc" style="text-align: center;">
		                            	<h4>등록된 공지사항이 없습니다.</h4>	              
		                            </div>
		                        </div>
                    		</c:when>
                    		
                    		
                    		<c:otherwise>
                    			<c:forEach items="${mento.notices}" var="notice">
	                    			<div class="blog-div">
			                            <div class="blog-desc">
			                            	<b>${mento.userName}</b><br>
			                                <date>${notice.crNoticeDate}</date>
			                                <hr style="margin-top: 5px; margin-bottom: 5px;">
			                                                                
			                                <h3><a href="#" title="Details">${notice.crNoticeTitle }</a></h3>
			                                <pre>${notice.crNoticeContent}</pre>
			                                
			                                <section class="comment-form">
	                    						<form name="insertNoticeReply" method="post" action="${pageContext.request.contextPath}/cr/noticeReply/insert" onsubmit="return checkValid()">
					                                <div class="row">
					                                    <div class="col-md-12">
					                                    	<div class="title inner-page-title">
					                                    		<c:set var="repCount" value="0"/>
					                                    		<c:forEach items="${requestScope.noticeReplyList}" var="replyCount">
					                                    			<c:choose>
					                                    				<c:when test="${notice.crNoticeCode == replyCount.crNoticeCode}">
					   		                                    			<c:set var="repCount" value="${repCount+1}"/>
					                                    				</c:when>
					                                    			</c:choose>
					                                    		</c:forEach>
								                                <h6>댓글 ${repCount}개</h6>
								                            </div>
					                                    	<c:forEach items="${requestScope.noticeReplyList}" var="reply">
					                                    		<c:choose>
					                                    			<c:when test="${notice.crNoticeCode == reply.crNoticeCode}">
					                                    				<article class="row" style="margin-left: 5px;">
											                                <div style="margin-left: 10px; margin-top: 30px;">
											                                    <figure class="thumbnail">
											                                        <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/users/2.jpg" alt="avatar" style="border-radius: 50px; width: 50px; height: 50px;"/>
											                                    </figure>
											                                </div>
											                                <div class="col-md-10 col-sm-10 col-xs-9">
											                                    <div class="panel panel-default arrow left">
											                                        <div class="panel-body">
											                                            <header class="text-left">
											                                            	<br>
											                                            	
											                                                <div class="comment-user">
											                                                	<div style="text-align: right;">${reply.crReplyDate}</div>
											                                                	<b>${reply.userId} 님 :</b>
											                                                </div>
											                                            </header>
											                                            <div class="comment-post">
											                                                <b style="margin-left: 15px;">${reply.crReplyContent}</b>
											                                            </div>
											                                        </div>
											                                    </div>
											                                </div>
											                            </article>
					                                    			</c:when>
					                                    		</c:choose>
					                                    	
					                                    	</c:forEach>
					                                    	
								                            <!-- First Comment -->
								                            
											                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
											                <input type="hidden" name="crNoticeCode" value="${notice.crNoticeCode}"/>
											                <input type="hidden" name="userId" value="<sec:authentication property="principal.userId" />">                    	
					                                        <div class="form-group" style="margin-top: 10px;">
					                                            <label>댓글 :</label>
					                                            <textarea rows="6" name="crReplyContent" class="form-control"></textarea>
					                                        </div>
					                                        <div class="form-group" style="text-align: right; margin-bottom: 5px;">
					                                            <input type="submit" class="btn btn-primary" value="댓글등록">
					                                        </div>
					                                    </div>
					                                </div>
					                            </form>
					                        </section>
			                                
			                                <sec:authorize access="hasRole('ROLE_MENTEE')">
						                    	<sec:authorize access="hasRole('ROLE_MENTO')">
							                    	<c:set var="mentoId"><sec:authentication property="principal.userId" /></c:set>
							                    	<c:if test="${mentoId==sessionScope.classroomMento}">
							                    		<!-- 멘토가 보는 부분 수정 삭제버튼-->
						                                <div style="margin-top: 15px; text-align: center;">
						                                	<a class="btn btn-primary" href="${pageContext.request.contextPath}/cr/notice/updateForm/${notice.crNoticeCode}">수정</a>
						                                	<a class="btn btn-primary" href="${pageContext.request.contextPath}/cr/notice/delete/${notice.crNoticeCode}">삭제</a>
						                                </div>      
							                    	</c:if>
						                    	</sec:authorize>
											</sec:authorize>			                                               
			                            </div>
			                        </div>
                    			</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
<!--             <div class="page">
                <ul class="pagination">
                    <li class="disabled"><a href="#"><i class="fa fa-long-arrow-left"></i></a></li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                </ul>
            </div> -->
        </div>
    </section>