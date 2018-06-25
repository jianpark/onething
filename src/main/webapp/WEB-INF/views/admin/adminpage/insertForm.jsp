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
	
	<!-- 광고등록폼체크 해당 form과 DTO에 맞게 변경해주세요-->
    <script>
	function checkValid() {
	    var f = window.document.bannerInsert;
			
		if ( f.crSubasgnTitle.value == "") {
		    alert( "배너위치설정을 해주세요." );
		    f.crSubasgnTitle.focus();
			return false;
	    }
		if ( f.crSubasgnContent.value == "" ) {
			alert( "게시여부 체크를 해주세요." );
			f.crSubasgnContent.focus();
			return false;
		}
		if ( f.crSubasgnFile.value == "" ) {
			alert( "노출방식 체크를 해주세요." );
			f.crSubasgnContent.focus();
			return false;
		}
		if ( f.crSubasgnFile.value == "" ) {
			alert( "시작일과 종료일을 선택해 주세요." );
			f.crSubasgnContent.focus();
			return false;
		}
		if ( f.crSubasgnFile.value == "" ) {
			alert( "연결주소를 입력해 주세요." );
			f.crSubasgnContent.focus();
			return false;
		}
		if ( f.crSubasgnFile.value == "" ) {
			alert( "배너이미지를 등록해 주세요." );
			f.crSubasgnContent.focus();
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
                    <div class="title inner-page-title">
				       <h3 class="bannerImage" style="font-size: 20px"><img alt="bannerImage" src="${pageContext.request.contextPath}/resources/images/bannerImage.png";>배너광고</h3>
				    </div>                    
                </div>
                    <div class="col-md-8">
                    	<table>
                    	<!-- 배너위치설정 -->
                    	<div style="width: 200px; float:left">
                    		<H5 style="color: cornFlowerBlue">배너위치설정</H5>
                    		<select style="border-radius: 5px">
                           		<option selected=>선택</option>
                           		<option>강의 레이아웃 배너</option>
				            </select>
                    	</div>
                    	<!-- 게시여부 -->
                        <div style="width: 200px; float:left; margin-left: 200px">
                        	<h5 style="color: cornFlowerBlue">게시여부</h5>
                        	<input type="radio">보이기</input>
                        	<input type="radio">숨기기</input>
                        </div><hr style="background:LightGrey">
                        <!-- 노출방식 -->
                        <div style="width: 200px; float:left; margin-bottom: 30px">
                        	<h5 style="color: cornFlowerBlue">노출방식</h5>
                        	 <input type="radio">무제한방식</input>
                        	 <input type="radio">기간제방식</input>
                        </div>
                        <!-- 시작일 -->
                        <div style="width: 310px; float:left; margin-left: 200px;">
                        	<h5 style="color: cornFlowerBlue">시작일</h5>
	                        	<div style="width: 150px; float:left;">
	                        	   <input style="border-radius: 5px;  id="" type="date"/>
	                        	</div>
	                        	<div  style="width: 150px; float:left;">
	                        	   <input style="border-radius: 5px; id="" type="date"/>
	                        	</div>
                        </div><hr style="background:LightGrey">
                        <!-- 연결주소 -->
                        <div>
                        	<h5 style="color: cornFlowerBlue">연결주소[링크]</h5>
                        	<input style="border-radius: 5px" type="text">
                        </div><hr style="background:LightGrey">
                        <!-- 배너이미지 -->
                        <div class="form-group">
                        	<h5 style="color: cornFlowerBlue">배너이미지</h5>
	                          <label class="btn btn-primary">
	                              	사진찾기
	                              	<input type="file" name="file" style="display: none;">
	                          </label>	  
                              <span>
                              	<!--  동적으로 선택된 파일명을 여기에 띄워줘야함 -->
                              	<b>선택된 파일이 없습니다.</b>
                              </span>                               
	                    </div><hr style="background:LightGrey">
                       </table> 
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group" style="text-align: center; margin-left: 20em">
                <input type="submit" class="btn btn-primary" value="광고등록">
            	<input style="background-color: lightgrey; border-radius: 5px" type="reset" value="다시쓰기">
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