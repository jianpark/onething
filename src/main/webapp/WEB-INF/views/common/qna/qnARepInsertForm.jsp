<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
            function checkValid() {
               var f = window.document.qnARepInsertForm;
         
               if (f.qaTitle.value == "") {
                  alert("답글 제목을 입력해 주세요.");
                  f.crNoticeTitle.focus();
                  return false;
               }
               if (f.qaContent.value == "") {
                  alert("답글 내용을 입력해 주세요.");
                  f.crNoticeContent.focus();
                  return false;
               }
               return true;
            }
         </script>
<div class="container">
	<div>
		<div class="title inner-page-title">
			<h3>QnA 등록</h3>
		</div>
		<div style="width: 70%; margin-left: 200px;">
			<form name="qnARepInsertForm" method="post" action="${pageContext.request.contextPath}/qna/reqInsert"
				onsubmit="return checkValid()">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="qaReplyCode" value="${requestScope.qaCode}">
				<div class="row">
					<div class="col-sm-12 ">
						<input type="hidden" name="userId" value="<sec:authentication property="principal.userId" />">
						<div class="form-group">
							<label>답글 제목 :</label> <input type="text" name="qaTitle"
								class="form-control" placeholder="title">
						</div>
						<div class="form-group">
							<label>답글 내용 :</label>
							<textarea rows="6" name="qaContent" class="form-control"
								placeholder="content" style="height: 400px;"></textarea>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group" style="text-align: right;">
							<input type="submit" class="btn btn-primary" value="답글등록">
							<input type="reset" class="btn btn-primary" value="다시쓰기">
						</div>
					</div>
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
