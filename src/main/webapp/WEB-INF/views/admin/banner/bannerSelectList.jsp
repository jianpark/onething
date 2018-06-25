<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
      <section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                <div>
                   <div class="title inner-page-title">
                   <h3 class="bannerImage" style="font-size: 20px"><img alt="bannerImage" src="${pageContext.request.contextPath}/resources/images/bannerImage.png";>배너등록</h3>
                </div>                    
                </div>
                    <div style="width:100%">
                           <!-- 관리자 광고배너 등록 리스트 화면 -->
                            <div style="margin-top: .5em">
                        <div class="table-responsive" style="text-align: center;">
                            <table class="table">
                                <tbody>
                                    <tr bgcolor="Lightgray" style="color: white; text-align: center;">
                                       <th>순번</th>
                                        <th>회사명</th>
                                        <th>등록일</th>
                                        <th>마감일</th>
                                        <th>연결주소</th>
                                        <th>광고가격</th>
                                        <th>삭제</th>
                                    </tr>
                                    <c:choose>
                                    <c:when test="${empty requestScope.adsList}">
                                       <tr>
                                          <th colspan="7"><h5 style="text-align: center;">등록된 광고가 없습니다.</h5></th>
                                       </tr>
                                   </c:when>
                                   <c:otherwise>
                                   <c:forEach items="${requestScope.adsList}" var="adsBannerDTO" varStatus="status">
                                    <tr style="text-align: center;">
                                      <td width="20px;">${status.count}</td>
                                        <td>${adsBannerDTO.adsName}</td>
                                        <td>${adsBannerDTO.adsStartDate}</td>
                                        <td>${adsBannerDTO.adsEndDate}</td>
                                        <td>${adsBannerDTO.adsLink}</td>
                                        <td>${adsBannerDTO.adsPrice}</td>
                                        <td>
                                        	<a href="${pageContext.request.contextPath}/admin/banner/delete?adsCode=${adsBannerDTO.adsCode}" style="color: lightGrey;">삭제</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
                   <div class="col-md-12">
                  <div class="form-group" style="text-align: right; margin-left: 20em">
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/banner/bannerInsertForm">광고등록</a>
                  </div>
                 </div>
                </div>
            </div>
        </div>
    </section>
    <!-- scroll top -->
    <a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>