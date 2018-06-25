<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<head>
    <!--meta tag start-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="edustar">
    <meta name="author" content="khanalprem">
    <meta name="copyright" content="khanalprem">

    <!--title-->
    <title>Edustar-Educational html5 template</title>

    <!-- faveicon start   -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">

    <!-- stylesheet start -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>


<body>
    <header>
        <div class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <ul class="tophead-link">
                            <li><a href="about.html"><i > Lets Code Together !</i></a></li>
                        </ul>
                    </div>

                    <div class="col-md-7 col-sm-7 col-xs-7 tophead-right">
                        <ul class="tophead-link">
                            <li><a href="tel:9856055360"><i class="fa fa-mobile" aria-hidden="true"></i>9856055260</a>
                            </li>
                            <li><a href="signin.html"><i class="fa fa-lock" aria-hidden="true"></i> Sign</a>
                            </li>
                            <li><a href="register.html"><i class="fa fa-key" aria-hidden="true"></i> Register</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <!-- Start Navigation -->
        <div id="masthead" class="site-header menu" style="padding-top:2px; padding-bottom: 5px;">
            <div class="container">
                <div class="site-branding">
                    <div id="site-identity">
                        <a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo"></a>
                    </div>
                    <!-- #site-identity -->
                </div>
                <!-- .site-branding -->
                <div class="header-nav-search">
                    <div class="toggle-button">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div id="main-navigation" style="padding-top: 50px">
                        <nav class="main-navigation">
                            <div class="close-icon">
                                <i class="fa fa-close"></i>
                            </div>
                            <ul>
                                <li class="current-menu-item "><a href="index.html">Home</a></li>
                                <li class="menu-item-has-children"><a href="#">class</a></li>
                                <li><a href="about.html">About</a> </li>
                                <li><a href="contact.html">Contact</a></li>
                                <li><a href="notice.html">notice</a> </li>
                                <li><a href="q&a.html">q&a</a> </li>
                                <li><a href="q&a.html">Member</a> </li> 
                                <li><a href="#">Applicant</a> </li>
                                <li><a href="q&a.html">Banner</a> </li> 
                                <li><a href="q&a.html">DashBoard</a> </li>      
                                 <div class="header-search">
			                        <i class="fa fa-search top-search"></i>
			                        <div class="search-popup">
			                            <form role=search action="search" class="search-wrapper">
			                                <div>
			                                    <input type="text" name="search" placeholder="Type your keyword">
			                                    <input type="submit" name="button" class="pop-search">
			                                </div>
			                            </form>
			                            <div class="search-overlay"></div>
			                        </div>
			                    </div>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
   	<section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                <div class="col-md-4">
                  <div class="sidebar">
                   <div class="sidebar-widget category-widget">
                    <div class="title inner-page-title">
				       <h3 style="font-size: 20px">dashboard</h3>
				    </div>
				    <ul>
                      <li>
                        <a ${pageContext.request.contextPath}/admin/dashboard/selectCourse">강좌별 수익</a>
                      </li>
                      <li>
                        <a ${pageContext.request.contextPath}/admin/memberMgr/selectMento">강사별 수익</a>
                      </li>
                      <li>
                        <a ${pageContext.request.contextPath}/admin/memberMgr/selectCourseComission">강좌수수료 수익</a>
                      </li>
                      <li>
                        <a ${pageContext.request.contextPath}/admin/memberMgr/selectBanner">광고 수익</a>
                      </li>
                      <li>
                        <a ${pageContext.request.contextPath}/admin/memberMgr/selectByMonthYear">월/년 총매출</a>
                      </li>
                    </ul>                    
                	</div>
                  </div>
                </div>
                	<div class="col-md-8">
                    	<div><h3 class="mentoImage" style="font-size: 20px"><img alt="mentoImage" src="${pageContext.request.contextPath}/resources/images/mentoImage.png";>강좌별 수익</h3></div>
                        	<!-- 관리자 멘토신청자 명단 리스트 화면 -->
                            <div style="margin-top: .5em;">
				            <div class="table-responsive" style="text-align: center;">
				                <table class="table">
				                    <tbody>
				                        <tr bgcolor="LightGrey"; style="color: white">
				                        	
				                        	<th>순위</th>
				                            <th>강좌</th>
				                            <th>수익</th>
				                        </tr>
				                        <tr>
				                    		<td><span>1</span></td>
				                            <td><span>JAVA</span></td>
				                            <td><span>2,000,000</span></td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				            <div style="width: 200px;">
								  <input type="date" id="datepicker1"> ~
								  <input type="date" id="datepicker2">
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

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/countdown.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>

</html>