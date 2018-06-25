<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    
    #gallery-wrapper{
       margin:100px 0;
    }
    
    
/*     .gallery-inner{margin-left: 400px} 
    
    #gallery{margin-top: 200px; margin-bottom: 200px} */

    </style>

<body>
   
   <!-- 여기부터 수정 -->
    <div style="margin: 50px 0 0 0;text-align: center; width: 100%;">
	    <div style="margin: 0px auto; width:140px">
		    <div class="title sec-title" style=" text-align:right; ">
				<h2>회원가입</h2>
			</div>
		</div>
    </div>
    
   <section id="gallery" style="padding:0 0 20px 0">
        <div class="container">
            <div class="col-md-12">
                <div class="row">
                    <div class="gallery-inner">
                        <div id="gallery-wrapper">
                            <div class="row" style="text-align:center; width:100%">
                                <!-- Single gallery -->
                                <div class="mix events seminar col-md-3 col-sm-6 col-xs-12" style=" display: inline-block; margin:0 auto;" >
                                    <div class="gallery-single" >
                                        <div class="gallery-head" >
                                            <img src="${pageContext.request.contextPath}/resources/images/gallery/1.jpg" class="img-responsive" alt="" />
                                        </div>
                                        <div class="gallery-hover" style="border-radius: 250px;">
                                            <h4><span style="font-size:35px;">멘토</span></h4>
                                            <p> <a href="${pageContext.request.contextPath}/joinMento" style="color: #fff; font-size:30px;">가입하기</a></p><br>                                            
                                        </div>
                                    </div>
                                </div>
                                <!--/ End gallery -->
                                <!-- Single gallery -->
                                <div class="mix scholar events col-md-3 col-sm-6 col-xs-12" style="display: inline-block; margin:0 auto;">
                                    <div class="gallery-single" >
                                        <div class="gallery-head">
                                            <img src="${pageContext.request.contextPath}/resources/images/gallery/2.jpg" class="img-responsive" alt="" />
                                        </div>
                                         <div class="gallery-hover">
                                            <h4><span style="font-size:35px;">멘티</span></h4> 
                                              <p><a href="${pageContext.request.contextPath}/joinMentee" style="color: #fff; font-size:30px;">가입하기</a></p><br>                                                                
                                        </div>
                                    </div>
                                </div>
                                <!--/ End gallery -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



</body>

</html>