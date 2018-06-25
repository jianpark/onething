<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

    <style>
    .radius-test{
       width:200px;
       height:200px;
       background-color:#777;
       line-height:20px;
       color:#ffffff;
       text-align
    
    }
    
    .form-join{
          margin-bottom: 10px;
    }
    
    .form-fav{
       padding: 10px 10px 10px 10px;
       width:50%;
       float:left;
    }
    
    input[type="text"]{
       text-transform:none;
    }

    </style>
    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

    //아이디 체크
   $(function() {

      $("#joinForm :input[name=userId]").keyup(function(){
         
         var id=$(this).val().trim();
         //alert(id);
         if(id.length<4 || id.length>10){
            $("#idCheckView").html("4~10글자 사이로 입력해주세요").css("color","red");
            checkResultId="";
            return;
         }
         
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/idcheckAjax",            
            data:"${_csrf.parameterName}=${_csrf.token}&&id="+id,	
            success:function(data){                  
               if(data=="fail"){
               $("#idCheckView").html("  "+id+" 아이디 사용할 수 없습니다.").css("color","red");
                  checkResultId="";
               }else{                  
                  $("#idCheckView").html("  "+id+" 는 사용할 수 있습니다. ").css("color","green");      
                  checkResultId=id;
               }            
            }//callback         
         });//ajax 
      });//keyup
      
      
       //비밀번호체크
         $("input[name=userPwd]").keyup(function(){
               
            var pwd=$(this).val().trim();
            if(pwd.length<8){
               $("#pwdView").html("8글자이상 입력해주세요").css("color","red");
               checkResultId="";
               return;
            }else{
               $("#pwdView").html("사용 가능합니다.").css("color","green");
               checkResultId="";
               return;
            }         
         });//keyup
      
      //비밀번호체크
      $("input[name=pwdCheck]").keyup(function(){
         
         var pwd=$(this).val().trim();
         var pwdFirst=$("input[name=userPwd]").val().trim();
         //alert(id);
         if(pwd!=pwdFirst){
            $("#pwdCheckView").html("비밀번호를 다시 확인해주세요.").css("color","red");
            checkResultId="";
            return;
         }else{
            $("#pwdCheckView").html("사용 가능합니다.").css("color","green");
         }
      });//keyup
      
      //체크박스
      $("#joinButton").on("click", function() {
         
         
         if($("#joinForm :input[name=userName]").val().trim()==""){
              alert("이름을 입력하세요");            
              return false;
           } 
         if($("#joinForm :input[name=userId]").val().trim()==""){
            alert("아이디를 입력하세요");            
            return false;
         }
         if($("#joinForm :input[name=userPwd]").val().trim()==""){
            alert("패스워드를 입력하세요");            
            return false;
         }
         if($("#joinForm :input[name=pwdCheck]").val().trim()==""){
            alert("패스워드를 확인하세요");            
            return false;
         }
         if($("#joinForm :input[name=userId]").val().trim()==""){
            alert("이름을 입력하세요");            
            return false;
         }
         if($("#joinForm :input[name=userPhone]").val().trim()==""){
            alert("연락처를 입력하세요");            
            return false;
         }   
         if($("#joinForm :input[name=userEmail]").val().trim()==""){
            alert("이메일을 입력하세요");            
            return false;
         }
         
         if($("#joinForm :input[name=userEmail]").val().trim().indexOf('@')<0){
             alert("올바른 이메일 형식이 아닙니다.");            
             return false;
          }
         
         if($("#personalData:checked").size() < 1){
            alert("개인정보 수집에 동의해주세요.");            
            return false;
         }
         
         if ( $("#checkbox :checked").size()<1 ||  $("#checkbox :checked").size()>3 ) {
             alert("관심분야는 1~3개까지 가능합니다.");
             return false;
          
          } else{
             $('input[type=checkbox]:checked').each(function(index,item){            
                var indexplus = index+1;
                $('#interField'+indexplus).attr('value',$(this).val());
             });
             return ;
          }    
         
            
          
          
      }); 
         
   
         
   });
</script>
<body>
    
   <!-- 여기부터 수정 -->
    
<!--     <div class="login-form" style="box-shadow:none; padding:50px 0 0 0">
    	<div class="title sec-title" style="text-align: left">
			<h2>멘티로 회원가입</h2>
		</div>
    </div> -->

    <!--login-page-->
    <div class="inner-page login-page">
        <div class="container">
            <div class="row">
                <div class="login-form">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="navbar-brand"  style="margin-bottom: 10px">
                            <!-- <img src="images/logo.png" class="img-responsive" alt=""> -->
					        <div class="title sec-title" style="text-align: left; margin: 20px 0 0 0" >
								<h2>멘티로 회원가입</h2>
							</div>
                        </div>
                    </div>
                    
                       <form method="post" action="${pageContext.request.contextPath}/join/Mentee?${_csrf.parameterName}=${_csrf.token}" id="joinForm" enctype="multipart/form-data">
             			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
             			<input type="hidden" name="_csrf" value="{{#_csrf}}token{{/_csrf}}" />
             			
             			
                        <div class="form-join">
                            <input type="text" placeholder="이름을 입력해주세요" name="userName">
                        </div>
                        <div class="form-join" >                                          
                            <input type="text" placeholder="아이디를 입력해주세요" name="userId">
                        	<span id="idCheckView"></span>
                        </div>
                        
                        <div class="form-join">
                            <input type="password" placeholder="비밀번호를 입력해주세요" name="userPwd" >
                        	<span id="pwdView"></span>
                        </div>                        
                        <div class="form-join">
                            <input type="password" placeholder="비밀번호를 확인해주세요" name="pwdCheck">
                            <span id="pwdCheckView"></span>
                        </div>
                        <div class="form-join">
                            <input type="text" placeholder="연락처를 입력해주세요" name="userPhone">
                        </div>
                        <div class="form-join" >
                             <div>
                              <input type="text" placeholder="이메일을 입력해주세요"  name="userEmail">
                           </div>
                           
                        </div>
                                    
                                                   
                        <div class="form-join" id="checkbox">
                           <div style = "font-size:1.2em;">
                              <strong>관심분야</strong>
                           </div>
                           
                           <div class="form-fav">
                              <div style = "font-size:1.1em; width:50%;">
                                 스킬업단과
                              </div>
                              
                              <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="U001" name="">
                               Java
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="U002" >
                               C
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="U003" >
                               자료구조/알고리즘
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="U004" >
                               DBMS
                             </label>
                            </div>
                           </div>
                           
                           <div class="form-fav">
                              <div style = "font-size:1.1em; width:50%;">
                                 웹/앱개발자
                              </div>
                              
                              <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="W001" >
                               백엔드 개발자
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="W002" >
                               프론트엔드 개발자
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="W003" >
                               안드로이드앱 개발자
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="W004" >
                               아이폰앱 개발자
                             </label>
                            </div>
                           </div>
                           
                           <div class="form-fav">
                              <div style = "font-size:1.1em;">
                                 해킹/보안
                              </div>
                              
                              <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="H001" >
                               사이버해킹 보안
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="H002" >
                               웹 해킹
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="H003" >
                               시스템 해킹
                             </label>
                            </div>
                           </div>
                           
                           <div class="form-fav">
                              <div style = "font-size:1.1em;">
                                 서버 네트워크
                              </div>
                              
                              <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="S001" >
                               리눅스 서버
                             </label>
                            </div>
                            <div class="form-check">
                             <label class="form-check-label">
                               <input class="form-check-input" type="checkbox" value="S002" >
                               네트워크 엔지니어
                             </label>
                            </div>
                           </div>                         
                        </div>
                        
                        <div>&nbsp</div>
                        <div class="form-join">                      
                            <div style = "font-size:1.2em;">
                              <strong>개인정보 수집동의(필수)</strong>
                           </div>                          
                           <div class="form-check">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" value="" id="personalData">
                             postIT의 이용약관, 개인정보 취급방침, 참가자 약관, 리더약관에 동의합니다.
                          </label>
                         </div>
                        </div>  
                       <div class="col-md-12 col-sm-12 col-xs-12">
                           <button type="submit" class="login-btn btn" id="joinButton">가입하기</button>
                       </div>
                       <input type="hidden" name="interField1" value="" id="interField1">
                       <input type="hidden" name="interField2" value="" id="interField2">
                       <input type="hidden" name="interField3" value="" id="interField3">
                       
                       
                     </form>
                    
                    
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="doyou">
                            <span>이미 회원이신가요?</span><span><a href="${pageContext.request.contextPath}/loginForm">로그인하기</a></span>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>


</body>

</html>