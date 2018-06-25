<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  
<style>	
	.col-md-5{margin-left: auto; margin-right: auto;}	
	#loginButton{margin-left: 25px}	
	#backButton{margin-left: 1px}
	#findButton{margin-left: 1px}
	input[type="text"]{
       text-transform:none;
    }
    
</style>

<body>


    <!-- banner slider -->
	<section class="coaching section pdb0">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="coaching-sign">
						<form method="post" action="${pageContext.request.contextPath}/loginCheck" id="login">
						 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" > 
						 
							<div class="title sec-title">
								<h2>로그인</h2>
							</div>
							<div class="form-group">
								<input type="text" name="userId" placeholder="아이디를 입력해주세요.">
							</div>
							<div class="form-group">
								<input type="password" name="password"
									placeholder="비밀번호를 입력해주세요.">									
							</div>						
							<div class="form-group" style="margin:10px">
		                        <c:if test="${not empty requestScope.errorMessage}">
		                           <span style="color:red">${requestScope.errorMessage}</span>
		                        </c:if>
		                    </div>

							<div class="loginButton">
								<button class="button btn btn-primary" id="loginButton">로그인</button>						
							</form>
								<input type="button" onclick="location.href='${pageContext.request.contextPath}/loginFind'" class="button btn btn-primary" id="findButton" value="비밀번호 찾기"/>
								<input type="button" onclick="location.href='${pageContext.request.contextPath}/index'" class="button btn btn-primary" id="backButton" value="취소"/>
								<!-- <button class="button btn btn-primary" id="backButton">취소</button> -->
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
  
</body>

</html>