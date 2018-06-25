<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	<style type="text/css">
		tr{
			text-align: center;
		}
	</style>


                    <div class="col-md-8">
                        <div class="blog-div">
                            <div class="blog-desc">
                            	<c:forEach items="${mento.asgns}" var="asgn">
                            		<c:choose>
                            			<c:when test="${asgn.crAsgnCode == requestScope.crAsgnCode}">
                            				<b>${mento.userName} 멘토</b><br>
			                                <date>${asgn.crAsgnDate}</date>
			                                <hr style="margin-top: 5px; margin-bottom: 5px;">
			                                <date>${asgn.crAsgnDeadline}마감</date>
			                                
			                                <h3>${asgn.crAsgnTitle}</h3>
			                                <c:set value="${asgn.crAsgnTitle}" var="crAsgnTitle"/>
			                                <pre>${asgn.crAsgnContent}</pre>
                            			</c:when>
                            		</c:choose>
                            	</c:forEach>
                            	
                            	<sec:authorize access="hasRole('ROLE_MENTEE')">
			                    	<c:set var="menteeId"><sec:authentication property="principal.userId" /></c:set>
			                    	<c:if test="${menteeId!=sessionScope.classroomMento}">
					                    <c:choose>
		                            		<c:when test="${empty requestScope.crSubAsgnDTO}">
		                            			<div class="blog-div" style="text-align: center;">
		                            				<h6>제출한 과제가 없습니다.</h6>
		                            			</div>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<div>
				                                	<b>내가 제출한 과제</b><br>
				                                	<div class="blog-div">
				                                		<date>${requestScope.crSubAsgnDTO.crSubasgnDate}</date><br>
				                                	    <a href="${pageContext.request.contextPath}/cr/asgn/subAsgnSelectForm/${requestScope.crSubAsgnDTO.crAsgnCode}/${requestScope.crSubAsgnDTO.userId}">${requestScope.crSubAsgnDTO.crSubasgnTitle}</a><br>
				                                	</div>                            	
				                                </div>
		                            		</c:otherwise>
		                            	</c:choose>
				                    </c:if>
					    		</sec:authorize>
                            	
                            	<div class="blog-btn" style="text-align: right;">
                            		
                            		<sec:authorize access="hasRole('ROLE_MENTEE')">
				                    	<c:set var="menteeId"><sec:authentication property="principal.userId" /></c:set>
				                    	<c:if test="${menteeId!=sessionScope.classroomMento}">
							                <a href="${pageContext.request.contextPath}/cr/mentee/subAsgnForm/${requestScope.crAsgnCode}/${crAsgnTitle}" class="btn btn-primary">과제제출</a>
					                    </c:if>
						    		</sec:authorize>

                            		<sec:authorize access="hasRole('ROLE_MENTEE')">
				                    	<sec:authorize access="hasRole('ROLE_MENTO')">
					                    	<c:set var="mentoId"><sec:authentication property="principal.userId" /></c:set>
					                    	<c:if test="${mentoId==sessionScope.classroomMento}">
	                                  			<a href="${pageContext.request.contextPath}/cr/asgnUpdateForm/asgnUpdateForm/${requestScope.crAsgnCode}" class="btn btn-primary">과제수정</a>				                    	
							                    <a href="${pageContext.request.contextPath}/cr/asgn/delete/${requestScope.crAsgnCode}" class="btn btn-primary">과제삭제</a>
					                    	</c:if>
				                    	</sec:authorize>
						   			</sec:authorize>                		                                
                                </div>
                            </div>
                        </div>
                        <sec:authorize access="hasRole('ROLE_MENTEE')">
	                    	<sec:authorize access="hasRole('ROLE_MENTO')">
		                    	<c:set var="mentoId"><sec:authentication property="principal.userId" /></c:set>
		                    	<c:if test="${mentoId==sessionScope.classroomMento}">
				                    <c:choose>
		                        		<c:when test="${empty requestScope.crSubAsgnList}">
		                        			 <div class="curriculum-table teacher-course-table">
									            <div class="title inner-page-title">
									                <h3>과제제출 명단</h3>
									            </div>
									            <div class="table-responsive">
									                <div class="blog-div" style="text-align: center;">
		                            					<h6>현재 제출된 과제가 없습니다.</h6>
		                            				</div>
									            </div>
									        </div>
		                        		</c:when>
		                        		<c:otherwise>
		                        			 <div class="curriculum-table teacher-course-table">
									            <div class="title inner-page-title">
									                <h3>과제제출 명단</h3>
									            </div>
									            <div class="table-responsive">
									                <table class="table">
									                    <tbody>
									                        <tr>
									                        	<th>순번</th>
									                            <th>멘티명</th>
									                            <th>과제제목</th>
									                            <th>제출일자</th>
									                        </tr>
									                        <c:forEach items="${requestScope.crSubAsgnList}" var="subAsgnDTO" varStatus="status">
									                        	<tr>
									                        		<td><b>${status.count}</b></td>
									                        		<td><b>${subAsgnDTO.userId}</b></td>
									                            	<td><a style="font-weight: bold;" href="${pageContext.request.contextPath}/cr/asgn/subAsgnSelectForm/${subAsgnDTO.crAsgnCode}/${subAsgnDTO.userId}">${subAsgnDTO.crSubasgnTitle}</a></td>
									                        		<td><b>${subAsgnDTO.crSubasgnDate}</b></td>
									                        	</tr>
									                        </c:forEach>
									                    </tbody>
									                </table>
									            </div>
									        </div>
		                        		</c:otherwise>
		                        	</c:choose>
		                    	</c:if>
	                    	</sec:authorize>
			   			</sec:authorize>  
                    </div>
                </div>
            </div>
        </div>
    </section>

    