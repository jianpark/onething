<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<body>
    <!--login-page-->
    <div class="inner-page login-page">
        <div class="container">
            <div class="row">
                <div class="login-form">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="navbar-brand">
                            <img src="${pageContext.request.contextPath}/images/logo.png" class="img-responsive" alt="">
                        </div>
                    </div>
                    
                    <h1>Level Test를 하고 싶은 분야를 선택해 주십시오.</h1><br>
                    <form action="${pageContext.request.contextPath}/course/levelTest/content">
                    <div class="form-group">
						<strong>강좌종류</strong><br> <select name="classification">
							<optgroup label="스킬업단과">
								<option value="U001">JAVA</option>
								<option value="U002">C</option>
								<option value="U003">알고리즘</option>
								<option value="U004">DBMS</option>
							</optgroup>
							<optgroup label="Web Developer">
								<option value="W001">Back-End</option>
								<option value="W002">Front-End</option>
								<option value="W003">안드로이드 앱 개발</option>
								<option value="W004">iOS 앱 개발</option>
							</optgroup>
							<optgroup label="보안">
								<option value="H001">사이버 해킹 보안</option>
								<option value="H002">웹 보안</option>
								<option value="H003">시스템보안</option>
							</optgroup>
							<optgroup label="server/networking">
								<option value="S001">Linux</option>
								<option value="S002">Network</option>
							</optgroup>
						</select>
					</div>
					<div style="margin-bottom: 60px">
						<button type="submit" class="btn" style="width:100%">레벨 테스트하러 가기</button>
					</div>
					</form>
                    
                </div>
            </div>
        </div>
    </div>

	
	<!-- Stat Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-12 col-xs-12">
					<div class="footer-widget">
						<h2>Edustar</h2>
						<div class="widget-content">
							<div class="text">Lorem ipsum dolor sit amet, consects
								adipiscing elit enean commodo ligula.</div>
							<address>
								<p>
									<i class="fa fa-map-marker"></i> kathmandu, nepal
								</p>
								<p>
									<i class="fa fa-phone"></i>+977-9856055360
								</p>
								<p>
									<i class="fa fa-envelope"></i> khnl.prem@gmail.com
								</p>
							</address>
						</div>
					</div>
				</div>

				<div class="col-md-5 col-sm-6 col-xs-12">
					<div class="footer-widget links-widget">
						<h2>Explore</h2>

						<div class="row">
							<div class="col-md-6 col-sm-6 col-sm-12">
								<ul>
									<li><a href="#">home</a></li>
									<li><a href="#">about</a></li>
									<li><a href="#">services</a></li>
									<li><a href="#">projects</a></li>
									<li><a href="#">contact</a></li>

								</ul>
							</div>
							<div class="col-md-6 col-sm-6 col-sm-12">
								<ul>
									<li><a href="#">News</a></li>
									<li><a href="#">Trade</a></li>
									<li><a href="#">Investment</a></li>
									<li><a href="#">projects</a></li>
									<li><a href="#">contact</a></li>

								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="footer-widget subscribe-widget">
						<h2>Newsletter</h2>
						<div class="widget-content">
							<div class="text">Lorem ipsum dolor sit amet, adipiscing</div>
							<div class="newsletter-form">
								<form>
									<div class="form-group">
										<input type="email" name="email" value=""
											placeholder="Email Address..." required>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary button">
											subscribe now<span class="btn-shape"></span>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!--Footer Bottom-->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<div class="text text-left">
						Copyrights &copy; <a href="#">Khanalprem</a>. All Rights Reserved
					</div>
				</div>
				<div class="col-md-6 col-sm-6">
					<ul class="social-links text-right">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li class="active"><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-youtube"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- scroll top -->
	<a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>
	<!-- srolltop end -->

<%-- 	
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/countdown.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/script.js"></script> --%>
</body>

</html>