<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <style>
  
  #footer-widget {margin-left: 130px}
  
  #footer-search {margin-left: 7px}
  
  footer h2::after {
    content: '';
    position: absolute;
    width: 30px;
    height: 2px;
    bottom: -15px;
    background-color: skyblue;
    left: 0;
}

footer .footer-widget address p i:hover{
    background-color: skyblue;
}

footer .links-widget ul li a:before {
    content: '\f105';
    font-family: 'FontAwesome';
    margin-right: 11px;
    color: skyblue;
}

footer .newsletter-form .form-group button[type="submit"] {
    background-color: skyblue;
    border: 0;
    text-transform: capitalize;
    font-weight: 600;
}
  </style>  
    <!-- Stat Footer -->
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="footer-widget">
                        <h2>PostIT</h2>
                        <div class="widget-content">
                            <div class="text" style="color:orange">Let's code together!</div>
                            <address>
                                <p><i class="fa fa-map-marker"></i>서울특별시 서초구 서초동 벨라빌딩 5층</p>
                                <p><i class="fa fa-phone"></i>010-2534-1756</p>
                                <p><i class="fa fa-envelope"></i> postIT@gmail.com</p>
                            </address>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 col-sm-6 col-xs-12">
                    <div class="footer-widget links-widget" id="footer-widget">
                        <h2>바로가기</h2>

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-sm-12">
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/index">home</a></li>
                                    <li><a href="${pageContext.request.contextPath}/course">course</a></li>
                                    <li><a href="#">about</a></li>
                                    <li><a href="#">Q&A</a></li>                          
                                </ul>
                            </div>
                            <!-- <div class="col-md-6 col-sm-6 col-sm-12">
                                <ul>
                                    <li><a href="#">about</a></li>
                                    <li><a href="#">Q&A</a></li>
                                </ul>
                            </div> -->
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-widget subscribe-widget">
                        <h2>검색하기</h2>
                        <div class="widget-content">
                            <div class="text">배우고 싶은 스터디를 검색해보세요!</div>
                            <div class="newsletter-form">
                                <!-- <form>
                                    <div class="form-group">
                                        <input type="email" name="email" value="" placeholder="Email Address..." required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary button">suscribe now<span class="btn-shape"></span></button>
                                    </div>
                                </form> -->
                                
                                <form action="${pageContext.request.contextPath}/search" class="search-wrapper">
                                <div class="form-group">
                                    <input type="text" name="search" id="courseSearch" placeholder="강사 or 강좌이름으로 검색해주세요.">
                                </div>
                                <div class="form-group" id="footer-search" >
                                    <input type="submit" name="button" class="btn btn-primary button" value="검색" style="background-color:skyblue; color:gray; width:252px">
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
                    <div class="text text-left">Copyrights &copy; <a href="#">PostIT</a>. All Rights Reserved</div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <ul class="social-links text-right">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
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

	<!-- 여기 scriptㄴ -->
    
</body>

</html>