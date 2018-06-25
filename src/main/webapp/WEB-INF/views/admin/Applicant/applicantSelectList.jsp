<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


   	<section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                <div class="col-md-4">
                    <%-- <div class="title inner-page-title">
				       <h3 class="appImage" style="font-size: 20px"><img alt="appImage" src="${pageContext.request.contextPath}/resources/images/appImage.png";>멘토신청자 명단</h3>
				    </div> --%>
				    <div class="title inner-page-title">
				       <h3 style="font-size: 20px">Member</h3>
				    </div>                    
                </div>
                    <div class="col-md-8">
                        	<!-- 관리자 멘토신청자 명단 리스트 화면 -->
                            <div style="margin-top: .5em">
				            <div class="table-responsive" style="text-align: center;">
				                <table class="table">
				                    <tbody>
				                        <tr bgcolor="skyblue"; style="color: white;">
				                        	<th>순번</th>
				                            <th>이름</th>
				                            <th>아이디</th>
				                            <th>주력분야</th>
				                            <th>이력서</th>
				                            <th>상태</th>
				                        </tr>
				                        <tr>
				                    		<td><span>1</span></td>
				                            <td><span>이원섭</span></td>
				                            <td><span>OneThing</span></td>
				                            <td><span>java</span></td>
				                            <td><span>이원섭.hwp(다운로드)</span></td>
				                            <td>
				                            	<select style="border-radius: 5px; multiple" name="name" onchange="window.open(this.value, width=50, height=50)">
				                            		<option value="#">선택</option>
				                            		<option value="${pageContext.request.contextPath}/admin/appInsert/insertForm">서류심사중</option>
				                            		<option value="${pageContext.request.contextPath}/admin/appInsert/insertForm">면접심사중</option>
				                            		<option value="${pageContext.request.contextPath}/admin/appInsert/insertForm">멘토승인완료</option>
				                            		<option value="">거절</option>
				                            	</select>
				                            </td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 페이지 -->
        <div class="page">
             <ul class="pagination">
                 <li class="disabled"><a href="#"><i class="fa fa-long-arrow-left"></i></a></li>
                 <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                 <li><a href="#">2</a></li>
                 <li><a href="#">3</a></li>
                 <li><a href="#">4</a></li>
                 <li><a href="#">5</a></li>
                 <li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
             </ul>
        </div>
    </section>
    <!-- scroll top -->
    <a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>
    <!-- srolltop end -->
