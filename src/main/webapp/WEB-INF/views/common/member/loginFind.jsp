<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<style>
.col-md-5 {
	margin-left: auto;
	margin-right: auto;
}
/* #findButton{margin-left: 80px} */
input[type="text"] {
	text-transform: none;
}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script>
   $(function(){
	   	      
		$("#findButton").on("click", function() {
	         if($("#seachForm :input[name=userName]").val().trim()==""){
				alert("이름을 입력하세요");            
				return false;
	         } 
	         if($("#seachForm :input[name=userEmail]").val().trim()==""){
				alert("이메일을 입력하세요");            
				return false;
	         } 
	         if($("#seachForm :input[name=userEmail]").val().trim().indexOf('@')<0){
	             alert("올바른 이메일 형식이 아닙니다.");            
	             return false;
	         }
	         
	         var userName=$("#seachForm :input[name=userName]").val().trim();
	         var userEmail=$("#seachForm :input[name=userEmail]").val().trim();
	         
	       
	         $.ajax({
	            type:"POST",
	            url:"${pageContext.request.contextPath}/member/loginFind",            
	            //data:"${_csrf.parameterName}=${_csrf.token}&&userName="+userName+"&&userEmail="+userEmail,
	            data:$("#seachForm").serialize(),
	            success:function(data){ 
	               if(data=="fail"){
		           	   alert("이름과 이메일을 다시 확인해주세요.");
	               } else{
	            	   alert("이메일로 임시비밀번호가 발송되었습니다.");
	               }         
	            }//callback         
	         });//ajax 

		});   
   });
</script>
<body>
	<!-- banner slider -->
	<section class="coaching section pdb0">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="coaching-sign">

						<div class="title sec-title">
							<h2>이메일로 비밀번호 찾기</h2>
						</div>
						<form  method="post" id="seachForm">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="inputSection">
								<div class="form-group">
									<input type="text" name="userName" placeholder="이름을 입력해주세요.">
								</div>
								<div class="form-group">
									<input type="text" name="userEmail" placeholder="이메일을 입력해주세요.">
								</div>
							</div>
							<div class="findButton">
								<button type="button" class="button btn btn-primary" id="findButton">비밀번호 찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>