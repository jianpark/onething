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
<script type="text/javascript">
	
	$(function(){
		
		function MentoByChart() {

			$.ajax({
    	  		type:"post",//전송방식
				url:"${pageContext.request.contextPath}/admin/dashboard/selectMentoDashboardGraphTop", //서버주소
				data:"${_csrf.parameterName}=${_csrf.token}",
				dataType:"json", //서버가 front로 보내주는 데이터 타입(text,html,xml,json)
				success:function(data) {  
					var ohlc=[], dataLength=data.length, i=0;
					
					$.each(data, function(index, item) {
						ohlc.push([
							item.userId,item.coursePrice
						]);
						//alert(item.userId+","+item.coursePrice)
					});	
					
				    var chart = new Highcharts.Chart({
						title: {
					        text: ''
					    }, 
				        chart: {
				            renderTo: 'containerMento',
				            type: 'pie'
				        },
				        plotOptions: {
				            pie: {
				                borderColor: '#ffffff',
				                innerSize: '30%'
				            }
				        },
				        /* 툴팁 */
				        tooltip: {
				        	valueSuffix: '원'
				        },
				        series: [{
				            name:'수익 총액',
				            data:ohlc
				        }]
				    })// using	
    
				},//function
				error : function(err) {
					console.log("에러 발생 : " + err);
				}
			});//ajax 
		}

		function CourseByChart() {

			//alert("drawChart");
			$.ajax({
    	  		type:"post",//전송방식
				url:"${pageContext.request.contextPath}/admin/dashboardGraphTop", //서버주소
				data:"${_csrf.parameterName}=${_csrf.token}",
				dataType:"json", //서버가 front로 보내주는 데이터 타입(text,html,xml,json)
				success:function(data) {  

					var ohlc=[], dataLength=data.length, i=0, xAx=[];					
					
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
									
						ohlc.push([
							courseCodeName,item.coursePrice

						]);
						
						xAx.push([
							courseCodeName
						]);  
						//alert(item.courseSubGroup+","+item.coursePrice)
					});	
					
					var chart = new Highcharts.Chart({
						title: {
					        text: ''
					    }, 
				        chart: {
				            renderTo: 'containerCourse',
				            type: 'bar'
				        }, 
				        plotOptions: {
				            pie: {
				                borderColor: '#ffffff',
				                innerSize: '30%'
				            }
				        }, 
				        /* X축 / Y 축 */
				        yAxis: { title: { text: '수입' } },
				        xAxis: {
				        	 categories: xAx
				        }, 

				        /* 툴팁 */
				        tooltip: {
				        	valueSuffix: '원'
				        },
				        series: [{
				            name:'수익 총액',
				            data:ohlc
				        }]
				    })// using	
				    	
				},//function
				error : function(err) {
					console.log("에러 발생 : " + err);
				}
			});//ajax 
		}
		
		function MonthByChart() {

			//alert("drawChart");
			$.ajax({
    	  		type:"post",//전송방식
				url:"${pageContext.request.contextPath}/admin/dashboard/selectByMonthDashboardGraph", //서버주소
				data:"${_csrf.parameterName}=${_csrf.token}",
				dataType:"json", //서버가 front로 보내주는 데이터 타입(text,html,xml,json)
				success:function(data) {  

					var ohlc=[], dataLength=data.length, i=0, xAx=[];
					
					$.each(data, function(index, item) {
						ohlc.push([
							item.courseStartDate,item.coursePrice
						]);
						
					    xAx.push([
							item.courseStartDate
						]);  
						
					});			
					
					var chart = new Highcharts.Chart({
						title: {
					        text: ''
					    }, 
				        chart: {
				            renderTo: 'containerByMonth',
				            type: 'line'
				        },
				        plotOptions: {
				            pie: {
				                borderColor: '#ffffff',
				                innerSize: '30%'
				            }
				        },
				        
				        /* X축 / Y 축 */
				        yAxis: { title: { text: '수입' } },
				        xAxis: {
				        	 categories: xAx
				        },  
				        /* 툴팁 */
				        tooltip: {
				        	valueSuffix: '원'
				        },
				        series: [{
				            name:'수익 총액',
				            data:ohlc
				        }]
				    })// using		
					
				
				    
				},//function
				error : function(err) {
					console.log("에러 발생 : " + err);
				}
			});//ajax 
		}
		
		function BannerChart() {

			//alert("drawChart");
			$.ajax({
    	  		type:"post",//전송방식
				url:"${pageContext.request.contextPath}/admin/dashboard/selectBannerDashboardGraphTop", //서버주소
				data:"${_csrf.parameterName}=${_csrf.token}",
				dataType:"json", //서버가 front로 보내주는 데이터 타입(text,html,xml,json)
				success:function(data) {  
					
					var ohlc=[], dataLength=data.length, i=0, xAx=[];
					
					$.each(data, function(index, item) {
						ohlc.push([
							item.adsName,parseInt(item.adsPrice)
						]);
						
					    xAx.push([
							item.adsName
						]);  						
					});	
					
					var chart = new Highcharts.Chart({
						title: {
					        text: ''
					    }, 
				        chart: {
				            renderTo: 'containerBanner',
				            type: 'line'
				        },
				        plotOptions: {
				            pie: {
				                borderColor: '#ffffff',
				                innerSize: '30%'
				            }
				        },
				        
				        /* X축 / Y 축 */
				        yAxis: { title: { text: '수입' } },
				        xAxis: {
				        	 categories: xAx
				        },  
				        /* 툴팁 */
				        tooltip: {
				        	valueSuffix: '원'
				        },
				        series: [{
				            name:'수익 총액',
				            data:ohlc
				        }]
				    })// using		
				},//function
				error : function(err) {
					console.log("에러 발생 : " + err);
				}
			});//ajax 
		}
		
		BannerChart();
	   	MonthByChart();		
	   	CourseByChart();
	   	MentoByChart();
	   	
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
                	<%
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
														
						Date currentTime = new Date ();
						String mTime = formatter.format(currentTime);								
						String month = mTime.substring(5,7);
					%>
                	<div class="col-md-8" style="flex:77%; max-width:77%">
                    	<div><h3 class="mentoImage" style="font-size: 20px"><img src="${pageContext.request.contextPath}/resources/images/dashboard/MonthYearImage.png"><%=month%>월 수익 그래프</h3></div>
                        	<!-- 관리자 멘토신청자 명단 리스트 화면 -->
                        <div style="margin-top: .5em;"> 
                       		<table class="table" id="resultTable" style="width: 400px; height: 400px; float:left; margin:20px 10px">
								<tbody>
								    <tr bgcolor="LightGrey" style="color: white">				                        	
								    	<th>스터디 소분류별 수익</th>
								    </tr>
								     <tr>
								        <th><div id="containerCourse" style="width: 350px; height: 350px;"></div></th>
								    </tr>
								</tbody>
				             </table>   
				             <table class="table" id="resultTable" style="width: 400px; height: 400px; float:left;margin:20px 10px">
								<tbody> 
								    <tr bgcolor="LightGrey" style="color: white">				                        	
								    	<th>멘토별 수익</th>
								     </tr>
								     <tr>
								        <th><div id="containerMento" style="width: 350px; height: 350px;"></div></th>
								   	 </tr>
							    </tbody>
				             </table> 
				             <table class="table" id="resultTable" style="width: 400px; height: 400px; float:left;margin:20px 10px">
								<tbody> 
								    <tr bgcolor="LightGrey" style="color: white" >				                        	
								    	<th>광고별 수익</th>
								    </tr>
								     <tr>
								        <th><div id="containerBanner" style="width: 350px; height: 350px;"></div></th>
								    </tr>
							  	</tbody>
				             </table>    
				             <table class="table" id="resultTable" style="width: 400px; height: 400px; float:left;margin:20px 10px">
								<tbody> 
								    <tr bgcolor="LightGrey" style="color: white" >				                        	
								    	<th>월별 수익</th>
								    </tr>
								     <tr>
								        <th><div id="containerByMonth" style="width: 350px; height: 350px;"></div></th>
								    </tr>
							  	</tbody>
				             </table>                        
				        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>