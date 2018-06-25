<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
		<style type="text/css">
			.file_input label {
			    position:relative;
			    cursor:pointer;
			    display:inline-block;
			    vertical-align:middle;
			    overflow:hidden;
			    width:100px;
			    height:30px;
			    background:#777;
			    color:#fff;
			    text-align:center;
			    line-height:30px;
			}
			.file_input label input {
			    position:absolute;
			    width:0;
			    height:0;
			    overflow:hidden;
			}
			.file_input input[type=text] {
			    vertical-align:middle;
			    display:inline-block;
			    width:400px;
			    height:28px;
			    line-height:28px;
			    font-size:11px;
			    padding:0;
			    border:0;
			    border:1px solid #777;
			}
		</style>
	</head>


		<script type="text/javascript">
            function checkValid() {
               var f = window.document.NoticeWriteForm;
         
               if (f.qaTitle.value == "") {
                  alert("게시물 제목을 입력해 주세요.");
                  f.crNoticeTitle.focus();
                  return false;
               }
               if (f.qaContent.value == "") {
                  alert("게시물 내용을 입력해 주세요.");
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
			<form name="NoticeWriteForm" action="${pageContext.request.contextPath}/notice/update?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" onsubmit="return checkValid()">
				<div class="row">
					<div class="col-sm-12 ">
						<input type="hidden" name="userId" value="<sec:authentication property="principal.userId" />">
						<input type="hidden" name="noticeCode" value="${requestScope.noticeDTO.noticeCode}"/>
						<div class="form-group">
							<label>공지 제목 :</label> <input type="text" name="noticeTitle"
								class="form-control" placeholder="title" value="${requestScope.noticeDTO.noticeTitle}">
						</div>
						<div class="form-group">
							<label>공지 내용 :</label>
							<textarea rows="6" name="noticeContent" class="form-control"
								placeholder="content" style="height: 400px;">${requestScope.noticeDTO.noticeContent}</textarea>
						</div>
						<div class="form-group">	                      				
                      		<div class="file_input">
								<label class="btn btn-primary" style="margin-top: 0px;">
									업로드<input type="file" name="file" onchange="javascript:document.getElementById('file_route').value=this.value">
								</label>
								<input type="text" readonly="readonly"  class="form-control" title="File Route" id="file_route" style="height: 40px; margin-top: 15px;" value="${requestScope.noticeDTO.noticeFileName}">
							</div>
                        </div>
					</div>
					<div class="col-md-12">
						<div class="form-group" style="text-align: right;">
							<input type="submit" class="btn btn-primary" value="수정">
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
