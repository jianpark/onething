<%@page import="kosta.spring.postIT.model.dto.CourseDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%-- <head>
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
</head> --%>
<html>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src=" https://code.highcharts.com/modules/exporting.js"></script>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<script type="text/javascript">
	
	$(function(){
		
		function CourseByChart() {

			//alert("drawChart");
			$.ajax({
    	  		type:"post",//전송방식
				url:"${pageContext.request.contextPath}/admin/dashboardGraph", //서버주소
				data:"${_csrf.parameterName}=${_csrf.token}",
				dataType:"json", //서버가 front로 보내주는 데이터 타입(text,html,xml,json)
				success:function(data) {  

					var ohlc=[], dataLength=data.length, i=0;					
					var sum =0;
					var str = "";
					$.each(data, function(index, item) {	
						var courseCode = item.courseSubGroup;
						var courseCodeName="";
	                 	if(courseCode=="U001"){
	                 		courseCodeName="Java";
	                 	} if(courseCode=="U002"){
	                 		courseCodeName="C";
	                 	} if(courseCode=="U003"){
	                 		courseCodeName="자료구조/알고리즘";
	                 	} if(courseCode=="U004"){
	                 		courseCodeName="DBMS";
	                 	} if(courseCode=="W001"){
	                 		courseCodeName="백엔드 개발자";
	                 	} if(courseCode=="W002"){
	                 		courseCodeName="프론트엔드 개발자";
	                 	} if(courseCode=="W003"){
	                 		courseCodeName="안드로이드앱 개발자";
	                 	} if(courseCode=="W004"){
	                 		courseCodeName="아이폰앱 개발자";
	                 	} if(courseCode=="H001"){
	                 		courseCodeName="사이버해킹 보안";
	                 	} if(courseCode=="H002"){
	                 		courseCodeName="웹 해킹";
	                 	} if(courseCode=="H003"){
	                 		courseCodeName="시스템 해킹";
	                 	} if(courseCode=="S001"){
	                 		courseCodeName="리눅스 서버";
	                 	} if(courseCode=="S002"){
	                 		courseCodeName="네트워크 엔지니어";
	                 	}
	                 	
						var coursePriceComma = item.coursePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						str += "<tr><td><span>" + (index+1) + "</span></td>"+
							   "<th><span>" + courseCodeName + "</span></th>"+
							   "<th><span>" + coursePriceComma + "</span></th></tr>";
						sum+=item.coursePrice;
					});
					
					var sumComma = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

					str += "<tr><td colspan='2'><span><Strong>총합</Strong></span></td>"+
					  	   "<th><span>" + sumComma + "</span></th></tr>";
					
					//table영역에 추가
					$("#resultTable tr:gt(0)").remove();
					$("#resultTable").append(str);
					$("#resultTable").show(); 
				
				    
				},//function
				error : function(err) {
					console.log("에러 발생 : " + err);
				}
			});//ajax 
		}
		
		$("#courseBySeach").on("click",function(){
			/* alert($("#datepickerStart").val())
			alert($("#datepickerEnd").val()) */
			
			$.ajax({
				type : "post",//전송방식
				url : "${pageContext.request.contextPath}/admin/dashboardGraph", //서버주소
				data : $("#courseBySeachForm").serialize(),//서버에게 보낼 parameter 정보
				dataType:"json", //서버가 front로 보내주는 데이터 타입(text,html,xml,json)
				success:function(data) {  

					var ohlc=[], dataLength=data.length, i=0;					

					var str = "";
					var sum =0;
					$.each(data, function(index, item) {	
						var courseCode = item.courseSubGroup;
						var courseCodeName="";
	                 	if(courseCode=="U001"){
	                 		courseCodeName="Java";
	                 	} if(courseCode=="U002"){
	                 		courseCodeName="C";
	                 	} if(courseCode=="U003"){
	                 		courseCodeName="자료구조/알고리즘";
	                 	} if(courseCode=="U004"){
	                 		courseCodeName="DBMS";
	                 	} if(courseCode=="W001"){
	                 		courseCodeName="백엔드 개발자";
	                 	} if(courseCode=="W002"){
	                 		courseCodeName="프론트엔드 개발자";
	                 	} if(courseCode=="W003"){
	                 		courseCodeName="안드로이드앱 개발자";
	                 	} if(courseCode=="W004"){
	                 		courseCodeName="아이폰앱 개발자";
	                 	} if(courseCode=="H001"){
	                 		courseCodeName="사이버해킹 보안";
	                 	} if(courseCode=="H002"){
	                 		courseCodeName="웹 해킹";
	                 	} if(courseCode=="H003"){
	                 		courseCodeName="시스템 해킹";
	                 	} if(courseCode=="S001"){
	                 		courseCodeName="리눅스 서버";
	                 	} if(courseCode=="S002"){
	                 		courseCodeName="네트워크 엔지니어";
	                 	}

						var coursePriceComma = item.coursePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						str += "<tr><td><span>" + (index+1) + "</span></td>"+
							   "<th><span>" + courseCodeName + "</span></th>"+
							   "<th><span>" + coursePriceComma + "</span></th></tr>";
						sum+=item.coursePrice;
					});
					
					var sumComma = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

					str += "<tr><td colspan='2'><span><Strong>총합</Strong></span></td>"+
					  	   "<th><span>" + sumComma + "</span></th></tr>";
					
					//table영역에 추가
					$("#resultTable tr:gt(0)").remove();
					$("#resultTable").append(str);
					$("#resultTable").show(); 
				
				    
				},//function
				error : function(err) {
					console.log("에러 발생 : " + err);
				}

			});//ajax끝
			
			return false;
			
	   	});//onclick


        //datepicker 한국어로 사용하기 위한 언어설정
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        
        // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

        //시작일.
        $('#datepickerStart').datepicker({
            //showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
           // buttonImage: "images/calendar.gif", // 버튼 이미지
          //  buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
           // buttonText: "날짜선택",             // 버튼의 대체 텍스트
            dateFormat: "yy/mm/dd",             // 날짜의 형식
            changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
            //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#datepickerEnd").datepicker( "option", "minDate", selectedDate );
            }       
       
        });

        //종료일
        $('#datepickerEnd').datepicker({
          //  showOn: "both", 
          //  buttonImage: "images/calendar.gif", 
          //  buttonImageOnly : true,
          //  buttonText: "날짜선택",
            dateFormat: "yy/mm/dd",
            changeMonth: true,
            //minDate: 0, // 오늘 이전 날짜 선택 불가
            onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#datepickerStart").datepicker( "option", "maxDate", selectedDate );
            }                
        });



	   	CourseByChart();
	});
	
	
	
</script>
<body>

   	<section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                <div class="col-md-4" style="flex:23%; max-width:23%">
                  <div class="sidebar">
                   <div class="sidebar-widget category-widget">
                    <div class="title inner-page-title">
				       <h3 style="font-size: 20px">dashboard</h3>
				    </div>
				    <ul>
				      <li>
                        <a href="${pageContext.request.contextPath}/admin/dashboard/selectAll" style="color: black" >DashBoard메인</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/admin/dashboard/selectCourse" style="color: black">스터디별 수익</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/admin/dashboard/selectMento" style="color: black">강사별 수익</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/admin/dashboard/selectBanner" style="color: black">광고 수익</a>
                      </li>
                     <%--  <li>
                        <a href="${pageContext.request.contextPath}/admin/dashboard/selectByMonthYear" style="color: black">월/년 총매출</a>
                      </li> --%>
                    </ul>                    
                	</div>
                  </div>
                </div>
                	<div class="col-md-8" style="flex:77%; max-width:77%">
                    	<div><h3 class="mentoImage" style="font-size: 20px"><img alt="mentoImage" src="${pageContext.request.contextPath}/resources/images/dashboard/mentoImage.png">스터디별 수익</h3></div>
                        	<!-- 관리자 멘토신청자 명단 리스트 화면 -->
                            <div style="margin-top: .5em;">
				            <div class="table-responsive" style="text-align: center;">
				            <form id="courseBySeachForm" method="post">
				            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">				            	
				            	<div style="margin:0 0 0 5px ;float: right; border-radius: 10px;">
				            		<button type="button" class="btn btn-primary button" id="courseBySeach" >검색하기<span class="btn-shape"></span></button>									
				            	</div>
					            <div style="width: 200px; float: right; border-radius: 10px;">
					            	<!-- <input style="border-radius: 8px;" type="date" id="datepickerEnd" style="float: right;"> -->	
					            	<input type="text" name="courseEndDate" id="datepickerEnd" style="border-radius: 8px;" placeholder="마지막일">    
	                            </div> 
	                            <div style="margin-left:5px; float: right;">
	                            	<span> ~ </span> 
	                            </div>
	                            <div style="width: 200px; margin-left:5px; float: right;">
                            	   <!-- <input style="border-radius: 8px;" type="date" id="datepickerStart">  -->
                            	   <input type="text" name="courseStartDate" id="datepickerStart" style="border-radius: 8px;" placeholder="시작일">  
	                            </div>   
                            </form>
				                <table class="table" id="resultTable">
				                    <tbody>
				                        <tr bgcolor="LightGrey" style="color: white">				                        	
				                        	<th>순위</th>
				                            <th>스터디</th>
				                            <th>수익</th>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>