<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	
	<head>
		<style type="text/css">
			.file_input label {
			    position:relative;
			    cursor:pointer;
			    display:inline-block;
			    vertical-align:middle;
			    overflow:hidden;
			    width:100px;
			    height:30px;
			    background:#777;
			    color:#fff;
			    text-align:center;
			    line-height:30px;
			}
			.file_input label input {
			    position:absolute;
			    width:0;
			    height:0;
			    overflow:hidden;
			}
			.file_input input[type=text] {
			    vertical-align:middle;
			    display:inline-block;
			    width:400px;
			    height:28px;
			    line-height:28px;
			    font-size:11px;
			    padding:0;
			    border:0;
			    border:1px solid #777;
			}


		</style>
	</head>
	
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script> --%>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

    //아이디 체크

		function checkValid() {
		    var f = window.document.bannerInsertForm;
		    
		    if ( f.adsName.value == "" ) {
			      alert( "회사명을 입력해주세요.");
			      f.adsName.focus();
			      return false;
			   }
		    if ( f.adsPrice.value == "" ) {
			      alert( "광고가격을 입력해주세요.");
			      f.adsPrice.focus();
			      return false;
			   }
		    
		   if ( f.datepickerStart.value == "" ) {
			      alert( "시작일을 선택해주세요." );
			      return false;
			   }
		   if ( f.datepickerEnd.value == "" ) {
			      alert( "마감일을 선택해주세요." );
			      return false;
			   }
		   if ( f.adsLink.value == "" ) {
			      alert( "연결주소를 입력해주세요." );
			      f.adsLink.focus();
			      return false;
			   }
		   /* if ( f.adsFileName.value == "" ) {
			      alert( "이미지를 등록해주세요." );
			      return false;
			   } */
		   if($("input[name=file]").val().trim()==""){
               alert("이미지을 업로드하세요");            
               return false;
           }  
		    return true;
		}
    
		$(function(){
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
	            dateFormat: "y/mm/dd",             // 날짜의 형식
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
	            dateFormat: "y/mm/dd",
	            changeMonth: true,
	            //minDate: 0, // 오늘 이전 날짜 선택 불가
	            onClose: function( selectedDate ) {
	                // 종료일(toDate) datepicker가 닫힐때
	                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                $("#datepickerStart").datepicker( "option", "maxDate", selectedDate );
	            }                
	        });
		});

	</script>

<body>
   	<section class="blog-page inner-page">
        <div class="container">
            <div class="blog-page-inner clear">
                <div class="row">
                  <div class="col-md-4">
                    <div class="col-md-8">
                        <div class="title inner-page-title">
	                        <h3>배너광고 등록</h3>
	                    </div>
	                    <form style="width: 800px" name="bannerInsertForm" method="post" action="${pageContext.request.contextPath}/admin/banner/register?${_csrf.parameterName}=${_csrf.token}" onsubmit="return checkValid()" enctype="multipart/form-data">
                           <div class="row">
                               <div class="col-sm-12 ">
                                  <!-- 배너위치설정 -->
                                   <div class="form-group" style="width: 300px; float:left">
                                        <H5 style="color: cornFlowerBlue">광고회사명</H5>
                                      <input type="text" name="adsName" placeholder="회사명을 입력해주세요." style="border-radius: 5px"/>
                                   </div>
                                   <!-- 광고가격 -->
                                   <div class="form-group" style="width: 200px; float:left; margin-left: 200px">
                                        <H5 style="color: cornFlowerBlue">광고가격</H5>
                                      <input type="text" name="adsPrice" placeholder="금액을 입력해주세요" style="border-radius: 5px"/>
                                   </div><hr style="background:LightGrey">
                                   <!-- 시작일 마감일 설정 -->
                                   <div class="form-group" style="width: 400px; float:left;">
                                      <h5 style="color: cornFlowerBlue">기간</h5>
                                    <!-- <div style="width: 150px; float:left;">
                                       <input id="adsStartDate" name="adsStartDate" type="date" style="border-radius:5px"/>
                                    </div>
                                    <div  style="width:150px; float:left;">
                                       <input id="adsEndDate" name="adsEndDate" type="date" style="border-radius: 5px"/>
                                    </div> -->
                                    
		                            <div style="width: 150px; float:left; margin-left:5px;">
	                            	   <input type="text" name="adsStartDate" id="datepickerStart" style="border-radius: 8px;" placeholder="시작일">  
		                            </div> 
		                            <div style="margin-left:5px; float: left;">
		                            	<span> ~ </span> 
		                            </div>
		                            <div style="width: 150px; float:left; border-radius: 10px;">
						            	<input type="text" name="adsEndDate" id="datepickerEnd" style="border-radius: 8px;" placeholder="마감일">    
		                            </div> 
                                    
                                    
                                   </div>
                                   <!-- 연결주소 -->
                                   <div class="form-group" style="width: 200px; float:left; margin-left: 100px">
                                         <h5 style="color:cornFlowerBlue;">연결주소[링크]</h5>
                                      <input name="adsLink" type="text" placeholder="연결주소를 입력해주세요" style="border-radius:5px; width: 300px">
                                   </div><hr style="background:LightGrey">
                                   <!-- 이미지등록 -->
                                   <div class="form-group">
                                   		<h5 style="color: cornFlowerBlue">배너이미지</h5>
	                      				<div class="file_input">
										    <label class="btn btn-primary" style="margin-top: 0px;">
										        업로드
										        <input type="file" name="file" onchange="javascript:document.getElementById('file_route').value=this.value">
										    </label>
										    <input type="text" readonly="readonly"  class="form-control" title="File Route" id="file_route" style="height: 40px; margin-top: 15px;">
										</div>
	                                </div>
                                   <hr style="background:LightGrey">
                                   
                               </div>
                               <div class="col-md-12">
                                   <div class="form-group" style="text-align: center;">
                                      <input type="submit" class="btn btn-primary" value="등록하기">
                                      <input type="reset" value="다시쓰기" style="background-color: LightGrey; border-radius: 5px;">
                           </div>
                               </div>
                           </div>
                       </form>            
                    </div>
                </div>
            </div>
        </div>
     </div>
    </section>