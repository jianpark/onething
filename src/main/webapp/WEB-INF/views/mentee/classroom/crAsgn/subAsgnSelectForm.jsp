<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	<script type="text/javascript">
		function checkValid() {
		    var f = window.document.insertFeedback;
		      
		   if ( f.crFeedContent.value == "") {
		       alert( "피드백 내용을 입력해 주세요." );
		       f.crFeedContent.focus();
		      return false;
		    }

		    return true;
		}
	</script>
                    <div class="col-md-8">
                        <div class="title inner-page-title">
	                        <h3>${requestScope.crSubAsgnDTO.userId}님 과제</h3>
	                        <div style="text-align: right;">
	                        	<date>${requestScope.crSubAsgnDTO.crSubasgnDate}</date><br>
	                        </div>
	                    </div>
							<form name="insertFeedback" method="post" action="${pageContext.request.contextPath}/cr/feedback/insert" onsubmit="return checkValid()">
	                        <div class="row">
	                         <div class="col-sm-12 ">
	                                <div class="form-group">
	                                    <label>과제제목 :</label>
	                                    <input type="text" name="crSubasgnTitle" class="form-control" placeholder="title" 
	                                    value="${requestScope.crSubAsgnDTO.crSubasgnTitle}" readonly="readonly">
	                                </div>
	                                <div class="form-group">
	                                    <label>과제내용 :</label>
	                                    <textarea rows="6" name="crSubasgnContent" class="form-control" placeholder="content" style="height: 400px;"
	                                    readonly="readonly">${requestScope.crSubAsgnDTO.crSubasgnContent}</textarea>
	                                </div>
	                                <div class="form-group">
	                                    
	                                    <label>다운로드</label> : 
                                    	<a href='${pageContext.request.contextPath}/cr/asgn/subAsgn/downLoad?fname=${requestScope.crSubAsgnDTO.crSubasgnFile}'>
							    			${requestScope.crSubAsgnDTO.crSubasgnFile} 
							      		</a>
	                                </div>
	                            </div>
	                        
	                            <div class="col-md-12">
	                            
		                            <sec:authorize access="hasRole('ROLE_MENTEE')">
				                    	<c:set var="menteeId"><sec:authentication property="principal.userId" /></c:set>
				                    	<c:if test="${menteeId!=sessionScope.classroomMento}">
							                    <div class="form-group" style="text-align: right;">
				                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/cr/subAsgn/updateform/${requestScope.crSubAsgnDTO.crAsgnCode}/<sec:authentication property="principal.userId" />">과제수정</a>
				                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/cr/subAsgn/delete/${requestScope.crSubAsgnDTO.crAsgnCode}/<sec:authentication property="principal.userId" />">과제삭제</a><br><br>
				                                </div>
					                    </c:if>
					    			</sec:authorize>

	                                <c:choose>
	                                	<c:when test="${empty requestScope.crFeedbackDTO}">
			                                <div class="blog-div">
					                            <div class="blog-desc" style="text-align: center;">
					                            	<h4>등록된 피드백이 없습니다.</h4>	              
					                            </div>
					                        </div>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<article class="row">
				                                <div style="margin-left: 10px;">
				                                    <figure class="thumbnail" style="margin-left: 10px; margin-top: 30px;">
				                                        <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/users/2.jpg" alt="avatar" style="border-radius: 50px; width: 50px; height: 50px;"/>
				                                    </figure>
				                                </div>
				                                <div class="col-md-10 col-sm-10 col-xs-9">
				                                    <div class="panel panel-default arrow left">
				                                        <div class="panel-body">
				                                            <header class="text-left">
				                                            	<br>
				                                            	<div class="comment-user">
				                                                	<div style="text-align: right;">${requestScope.crFeedbackDTO.crFeedDate}</div>
				                                                	<b>${requestScope.menteeDTO.userName} 멘토 :</b>
				                                                </div>
				                                            </header>
				                                            <div class="comment-post">
				                                                <p>
				                                                	${requestScope.crFeedbackDTO.crFeedContent}
				                                                </p>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </article>
	                                	</c:otherwise>
	                                </c:choose>
	                                
					                
					                <sec:authorize access="hasRole('ROLE_MENTEE')">
				                    	<sec:authorize access="hasRole('ROLE_MENTO')">
					                    	<c:set var="mentoId"><sec:authentication property="principal.userId" /></c:set>
					                    	<c:if test="${mentoId==sessionScope.classroomMento}">
					                    		<div class="form-group">
			                                        <label>댓글 :</label>
			                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
			                                        <input type="hidden" name="crAsgnCode" value="${requestScope.crSubAsgnDTO.crAsgnCode}">
			                                        <input type= "hidden" name="userId" value="${requestScope.crSubAsgnDTO.userId}">
			                                        <input type= "hidden" name="mentoId" value="${mentoId}">
			                                        <textarea rows="6" name="crFeedContent" class="form-control"></textarea>
			                                    </div>
			                                    <div class="form-group" style="text-align: right; margin-bottom: 5px;">
			                                         <input type="submit" class="btn btn-primary" value="피드백등록">
			                                    </div>
					                    	</c:if>
				                    	</sec:authorize>
						  			</sec:authorize>        	
	                            </div>
	                        </div>
	                    </form>               
                    </div>
                </div>
            </div>
        </div>
    </section>