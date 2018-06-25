<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   	<section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                <div class="col-md-4" style="flex:23%; max-width:23%">
                  <div class="sidebar">
                   <div class="sidebar-widget category-widget">
       				<div class="title inner-page-title">
				       <h3 style="font-size: 20px">Member</h3>
				    </div>
				    <ul>

                      <li>
                        <a href="${pageContext.request.contextPath}/admin/menteeSelect">회원</a>
                      </li>
                      
                      <li>
                        <a href="${pageContext.request.contextPath}/admin/mentoSelect">멘토</a>
                      </li>
                      
                    </ul>                    
                	</div>
                  </div>
                </div>
                    <div class="col-md-8" style="flex:77%; max-width:77%">
                    	<div><h1 class="menteeImage" style="font-size: 20px"><img alt="menteeImage" src="${pageContext.request.contextPath}/resources/images/menteeImage.png";>회원</h1></div>
                            <div style="margin-top: .5em;">
				            <div class="table-responsive" style="text-align: center;">
				                <table class="table">
				                    
				                        <tr bgcolor="lightGrey"; style="color: white">
				                        	<th>No</th>
				                            <th>이름</th>
				                            <th>아이디</th>
				                            <th>연락처</th>
				                            <th>이메일 주소</th>
				                            <th>회원 삭제</th>
				                        </tr>
				                        
				                        <c:forEach items="${list}" var="mentee" varStatus="status">					                       
					                        <c:choose>
					                        	<c:when test="${'admin' eq mentee.userId}">
					                        	</c:when>
						                        <c:otherwise>
						                         <tr>
						                    		<td>${status.index}</td>
						                            <td>${mentee.userName}</td>
						                            <td>${mentee.userId}</td>
						                            <td>${mentee.userPhone}</td>
						                            <td>${mentee.userEmail}</td>
						                            <td>
						                            	<div class="blog-btn" id="delete">
		                               						<a href="${pageContext.request.contextPath}/admin/menteeDelete?userId=${mentee.userId}" class="btn btn-primary" >삭제</a>
		                            					</div>
						                            </td>
						                        </tr>				                        
						                        </c:otherwise>
					                        </c:choose>
				                        </c:forEach>
				                </table>
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