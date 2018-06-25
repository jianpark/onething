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
                    	<div><h1 class="mentoImage" style="font-size: 20px"><img alt="mentoImage" src="${pageContext.request.contextPath}/resources/images/mentoImage.png";>멘토</h1></div>
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
				                        
				                        <c:forEach items="${list}" var="mento" varStatus="status">
				                         <tr>
				                    		<td>${status.count}</td>
				                            <td>${mento.menteeDTO.userName}</td>
				                            <td>${mento.menteeDTO.userId}</td>
				                            <td>${mento.menteeDTO.userPhone}</td>
				                            <td>${mento.menteeDTO.userEmail}</td>
				                            <td>
				                            	<div class="blog-btn" id="delete">
                               						<a href="${pageContext.request.contextPath}/admin/mentoDelete?userId=${mento.menteeDTO.userId}" class="btn btn-primary">삭제</a>
                            					</div>
				                            </td>
				                        </tr>
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

   