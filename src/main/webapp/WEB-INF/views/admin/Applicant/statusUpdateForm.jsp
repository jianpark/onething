<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


	<script type="text/javascript">
		function checkValid() {
		    var f = window.document.statusUpdateForm;
		   if ( f.crAsgnContent.value == "" ) {
		      alert( "내용을 입력해 주세요." );
		      f.crAsgnContent.focus();
		      return false;
		   }

		    return true;
		}
	</script>
        
   	<section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                <div class="col-md-4">
                    <div class="col-md-8">
                        <div class="title inner-page-title">
	                        <h3>멘토지원자 알림보내기</h3>
	                    </div>
	                    <form name="statusUpdateForm" method="post" action="${pageContext.request.contextPath}/" onsubmit="return checkValid()">
	                        <div class="row">
	                            <div class="col-sm-12 ">
	                                <div class="form-group">
	                                     <select style="border-radius: 5px; multiple" name="name" onchange="window.open(this.value, mini-width=200, height=300)">
								      		<option value="#">선택</option>
								      		<option value="${pageContext.request.contextPath}/admin/appInsert/insertForm">서류심사중</option>
								      		<option value="${pageContext.request.contextPath}/admin/appInsert/insertForm">면접심사중</option>
								      		<option value="${pageContext.request.contextPath}/admin/appInsert/insertForm">멘토승인완료</option>
								      		<option value="${pageContext.request.contextPath}/admin/appInsert/insertForm">거절</option>
								         </select><p>
	                                </div>
	                                <div class="form-group">
	                                    <textarea rows="8" name="crAsgnContent" class="form-control" placeholder="메세지를 입력해주세요" style="height: 400px;"></textarea>
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="form-group" style="text-align: center;">
	                                	<input type="submit" class="btn btn-primary" value="보내기">
	                                	<input type="reset" value="다시쓰기" style="background-color: LightGrey; border-radius: 5px;">
									</div>
	                            </div>
	                        </div>
	                    </form>               
                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>

  