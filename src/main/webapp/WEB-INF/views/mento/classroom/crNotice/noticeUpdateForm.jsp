<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
      function checkValid() {
          var f = window.document.noticeInsertForm;
            
         if ( f.crNoticeTitle.value == "") {
             alert( "공지제목을 입력해 주세요." );
             f.crNoticeTitle.focus();
            return false;
          }
         if ( f.crNoticeContent.value == "" ) {
            alert( "공지내용을 입력해 주세요." );
            f.crNoticeContent.focus();
            return false;
         }
          return true;
      }
      
   </script>
                    <div class="col-md-8">
                        <div class="title inner-page-title">
                           <h3>공지사항 등록</h3>
                       </div>
                       <form name="insertNoticeForm" method="post" action="${pageContext.request.contextPath}/cr/notice/update" onsubmit="return checkValid()">
                           <div class="row">
                               <div class="col-sm-12 ">
       	                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" > 
                                  <input type="hidden" name="crNoticeCode" value="${requestScope.crNoticeDTO.crNoticeCode}"/>
                                   <div class="form-group">
                                       <label>공지제목 :</label>
                                       <input type="text" name="crNoticeTitle" class="form-control" placeholder="title" value="${requestScope.crNoticeDTO.crNoticeTitle}">
                                   </div>
                                   <div class="form-group">
                                       <label>공지내용 :</label>
                                       <textarea rows="6" name="crNoticeContent" class="form-control" style="height: 400px;" placeholder="content" >${requestScope.crNoticeDTO.crNoticeContent}</textarea>
                                   </div>
                               </div>
                               <div class="col-md-12">
                                   <div class="form-group" style="text-align: right;">     
                                       <input type="submit" class="btn btn-primary" value="공지수정">
                                      <input type="reset" class="btn btn-primary" value="다시쓰기">
                                   </div>
                               </div>
                           </div>
                       </form>               
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <!-- scroll top -->
    <a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>
    <!-- srolltop end -->