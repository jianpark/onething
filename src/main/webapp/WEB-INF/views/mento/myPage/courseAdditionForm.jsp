<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<!--meta tag start-->
<meta content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="edustar">
<meta name="author" content="khanalprem">
<meta name="copyright" content="khanalprem">

<!--title-->
<title>Edustar-Educational html5 template</title>

<!-- faveicon start   -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.png"
	type="image/x-icon">
	
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- stylesheet start -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<%-- <script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script> --%>
<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
		
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
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	//유효성체크
	function checkValid() {
		var f = window.document.courseAddForm;

		if (f.courseTitle.value == "") {
			alert("과제제목을 입력해 주세요.");
			f.courseTitle.focus();
			return false;
		}

		var text = $('#courseTitle').val();
		var textlength = text.length;
		var limit = 10;
		if (textlength > 10) {
			alert("제목은 10자를 초과할 수 없습니다.");
			f.courseTitle.focus();
			return false;
		}

		if (f.courseLevel.value == "") {
			alert("스터디 레벨을 선택해 주십시오.");
			f.courseLevel.focus();
			return false;
		}
		if (f.courseRecruitMax.value == "") {
			alert("총 인원을 입력해 주십시오.");
			f.courseRecruitMax.focus();
			return false;
		}
		if (f.courseRecruitPerid.value == "") {
			alert("모집 마감 날짜를 선택해 주십시오.");
			f.courseRecruitPerid.focus();
			return false;
		}
		if (f.courseStartDate.value == "") {
			alert("개강날짜를 선택해 주십시오.");
			f.courseStartDate.focus();
			return false;
		}
		if (f.courseEndDate.value == "") {
			alert("종강날짜를 선택해 주십시오.");
			f.courseEndDate.focus();
			return false;
		}
		if (f.classDay.value == "") {
			alert("요일을 선택해 주십시오.");
			f.classDay.focus();
			return false;
		}
		if (f.courseLoc.value == "") {
			alert("지역을 선택해 주십시오.");
			f.courseLoc.focus();
			return false;
		}
		if (f.courseStartTime.value == "") {
			alert("시작시간을 선택해 주십시오.");
			f.courseStartTime.focus();
			return false;
		}
		if (f.courseEndTime.value == "") {
			alert("종료시간을 선택해 주십시오.");
			f.courseEndTime.focus();
			return false;
		}
		if (f.coursePrice.value == "") {
			alert("가격을 입력해 주십시오.");
			f.coursePrice.focus();
			return false;
		}
		if (f.courseDetail.value == "") {
			alert("상세설명을 입력해주십시오");
			f.courseDetail.focus();
			return false;
		}
		
		alert("스터디 개설을 성공하였습니다.");
		return true;
		
		
	}
</script>
</head>

<body>
<div class="popular-course course-page inner-page"
	style="margin-top: 20px">
	<section id="gallery">
	<div class="container">
		<div class="col-md-12">
			<div class="row">
				<!-- gallery Nav -->

				<div class="course-filter">
					<div class="gallery-nav">
						<sec:authorize access="hasRole('ROLE_MENTO')">
							<c:set var="validation" value="Mento" />
						</sec:authorize>
						<c:set var="userId">
							<sec:authentication property="principal.userId" />
						</c:set>
	
						<ul>
							<li class="filter" data-filter="all"><a
								href="${pageContext.request.contextPath}/myPage/study/select?userId=${userId}">내
									스터디</a></li>
							<li class="filter" data-filter="all"><a
								href="${pageContext.request.contextPath}/myPage/favStudy/select?userId=${userId}">찜한
									스터디</a></li>
							<li class="filter" data-filter="all"><a
								href="${pageContext.request.contextPath}/myPage/exStudy/select?userId=${userId}">완료된
									스터디</a></li>
	
							<li class="filter" data-filter="all"><a
								href="${pageContext.request.contextPath}/myPage/profile/updateForm?validation=${validation}">프로필
									수정</a></li>
							<sec:authorize access="hasRole('ROLE_MENTO')">
								<li class="filter"><a
									href="${pageContext.request.contextPath}/myPage/studyInsert/insertForm">스터디
										만들기</a></li>
							</sec:authorize>
						</ul>
	
					</div>
				</div>
				<!--/ End gallery Nav -->

				<div class="login-form" style="margin-bottom: 60px; margin-top: 30px">

					<%-- <div class="col-md-12 col-sm-12 col-xs-12">
						<div class="navbar-brand">
							<img
								src="${pageContext.request.contextPath}/resources/images/logo.png"
								class="img-responsive" alt="">
						</div>
					</div> --%>
					<div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="navbar-brand"  style="margin-bottom: 10px">
                            <!-- <img src="images/logo.png" class="img-responsive" alt=""> -->
					        <div class="title sec-title" style="text-align: left; margin: 20px 0 0 0" >
								<h2>스터디 등록하기</h2>
							</div>	                        
                        </div>
                    </div>


					<form name="courseAddForm" method="post"
						action="${pageContext.request.contextPath}/myPage/courseInsertConfirm?${_csrf.parameterName}=${_csrf.token}"
						onSubmit='return checkValid()' enctype="multipart/form-data">

						<div class="form-group">
							스터디제목<br> <input type="text" placeholder="class title"
								name="courseTitle" id="courseTitle">
						</div>
						<div class="form-group">
							스터디종류<br> <select name="courseSubGroup">
								<optgroup label="스킬업단과">
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'U001'}">
										<option value="U001">JAVA</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'U002'}">
										<option value="U002">C</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'U003'}">
										<option value="U003">알고리즘</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'U004'}">
										<option value="U004">DBMS</option>
									</c:if>
								</c:forEach>
								</optgroup>
								<optgroup label="Web Developer">
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'W001'}">
										<option value="W001">Back-End</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'W002'}">
										<option value="W002">Front-End</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'W003'}">
										<option value="W003">Android Application</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'W004'}">
										<option value="W004">iOS Application</option>
									</c:if>
								</c:forEach>
								</optgroup>
								<optgroup label="보안">
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'H001'}">
										<option value="H001">사이버보안</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'H002'}">
										<option value="H002">웹 보안</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'H003'}">
										<option value="H003">시스템보안</option>
									</c:if>
								</c:forEach>
								</optgroup>
								<optgroup label="server/networking">
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'S001'}">
										<option value="S001">Linux</option>
									</c:if>
								</c:forEach>
								<c:forEach var="major" items="${majorList}">
									<c:if test="${major == 'S002'}">
										<option value="S002">Network</option>
									</c:if>
								</c:forEach>
									
									
								</optgroup>
							</select>
						</div>
						<div class="form-group">
							스터디레벨<br> <select name="courseLevel">
								<optgroup label="스터디레벨">
									<option value="초급">초급</option>
									<option value="중급">중급</option>
									<option value="고급">고급</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group">
							모집인원<br> <input type="number" placeholder="모집인원"
								name="courseRecruitMax">
						</div>
						<div class="form-group">
							<!-- 강좌 시작 날짜<input type="date" name="courseStartDate"> ~ 강좌
							종료 날짜<input type="date" name="courseEndDate"> -->
							 스터디 시작 날짜
		                     <div style="width: 100%; margin-left: 5px; ">
		                        <input type="text" name="courseStartDate" id="datepickerStart"
		                           style="border-radius: 8px;" placeholder="스터디 시작 날짜 선택하기">
		                     </div>
		                     
		                     스터디 종료 날짜
		                     <div style="width: 100%; border-radius: 10px;">
		                        <input type="text" name="courseEndDate" id="datepickerEnd"
		                           style="border-radius: 8px;" placeholder="스터디 종료 날짜 선택하기">
		                     </div>
						</div>
						
						<div class="form-group">
							스터디가능요일선택<br> 
							<div style="width: 100%; text-align: center;">
							<input type="checkbox" name="classDay" value="월">월 
								<input type="checkbox" name="classDay" value="화">화 
								<input type="checkbox" name="classDay" value="수">수 
								<input type="checkbox" name="classDay" value="목">목 
								<input type="checkbox" name="classDay" value="금">금 
								<input type="checkbox" name="classDay" value="토">토 
								<input type="checkbox" name="classDay" value="일">일
							</div>
						</div>
						<div class="form-group">
							스터디가능지역<br> <select name="courseLoc">
								<optgroup label="서울">
									<option value="건대">건대</option>
									<option value="홍대">홍대</option>
									<option value="종각">종각</option>
									<option value="강남">강남</option>
									<option value="신촌">신촌</option>
									<option value="노원">노원</option>
								</optgroup>
								<optgroup label="수도권">
									<option value="인천">인천</option>
									<option value="부평">부평</option>
									<option value="수원역">수원역</option>
									<option value="영통역">영통역</option>
									<option value="광교">광교</option>
									<option value="분당">분당</option>
									<option value="안양">안양</option>
									<option value="일산">일산</option>
								</optgroup>
							</select>
						</div>

						<div class="form-group">
							스터디시작시간<br> <select name="courseStartTime" size="5"
								style="height: 100px">
								<optgroup label="오전">
									<option value="0030">0:30am</option>
									<option value="0100">1:00am</option>
									<option value="0130">1:30am</option>
									<option value="0200">2:00am</option>
									<option value="0230">2:30am</option>
									<option value="0300">3:00am</option>
									<option value="0330">3:30am</option>
									<option value="0400">4:00am</option>
									<option value="0430">4:30am</option>
									<option value="0500">5:00am</option>
									<option value="0530">5:30am</option>
									<option value="0600">6:00am</option>
									<option value="0630">6:30am</option>
									<option value="0700">7:00am</option>
									<option value="0730">7:30am</option>
									<option value="0800">8:00am</option>
									<option value="0830">8:30am</option>
									<option value="0900">9:00am</option>
									<option value="0930">9:30am</option>
									<option value="1000">10:00am</option>
									<option value="1030">10:30am</option>
									<option value="1100">11:00am</option>
									<option value="1130">11:30am</option>
									<option value="1200">noon</option>
								</optgroup>
								<optgroup label="오후">
									<option value="1230">00:30pm</option>
									<option value="1300">01:00pm</option>
									<option value="1330">01:30pm</option>
									<option value="1400">02:00pm</option>
									<option value="1430">02:30pm</option>
									<option value="1500">03:00pm</option>
									<option value="1530">03:30pm</option>
									<option value="1600">04:00pm</option>
									<option value="1630">04:30pm</option>
									<option value="1700">05:00pm</option>
									<option value="1730">05:30pm</option>
									<option value="1800">06:00pm</option>
									<option value="1830">06:30pm</option>
									<option value="1900">07:00pm</option>
									<option value="1930">07:30pm</option>
									<option value="2000">08:00pm</option>
									<option value="2030">08:30pm</option>
									<option value="2100">09:00pm</option>
									<option value="2130">09:30pm</option>
									<option value="2200">10:00pm</option>
									<option value="2230">10:30pm</option>
									<option value="2300">11:00pm</option>
									<option value="2330">11:30pm</option>
									<option value="2400">midnight</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group">
							스터디종료시간<br> <select name="courseEndTime" size="5"
								style="height: 100px">
								<optgroup label="오전">
									<option value="0030">0:30am</option>
									<option value="0100">1:00am</option>
									<option value="0130">1:30am</option>
									<option value="0200">2:00am</option>
									<option value="0230">2:30am</option>
									<option value="0300">3:00am</option>
									<option value="0330">3:30am</option>
									<option value="0400">4:00am</option>
									<option value="0430">4:30am</option>
									<option value="0500">5:00am</option>
									<option value="0530">5:30am</option>
									<option value="0600">6:00am</option>
									<option value="0630">6:30am</option>
									<option value="0700">7:00am</option>
									<option value="0730">7:30am</option>
									<option value="0800">8:00am</option>
									<option value="0830">8:30am</option>
									<option value="0900">9:00am</option>
									<option value="0930">9:30am</option>
									<option value="1000">10:00am</option>
									<option value="1030">10:30am</option>
									<option value="1100">11:00am</option>
									<option value="1130">11:30am</option>
									<option value="1200">noon</option>
								</optgroup>
								<optgroup label="오후">
									<option value="1230">00:30pm</option>
									<option value="1300">01:00pm</option>
									<option value="1330">01:30pm</option>
									<option value="1400">02:00pm</option>
									<option value="1430">02:30pm</option>
									<option value="1500">03:00pm</option>
									<option value="1530">03:30pm</option>
									<option value="1600">04:00pm</option>
									<option value="1630">04:30pm</option>
									<option value="1700">05:00pm</option>
									<option value="1730">05:30pm</option>
									<option value="1800">06:00pm</option>
									<option value="1830">06:30pm</option>
									<option value="1900">07:00pm</option>
									<option value="1930">07:30pm</option>
									<option value="2000">08:00pm</option>
									<option value="2030">08:30pm</option>
									<option value="2100">09:00pm</option>
									<option value="2130">09:30pm</option>
									<option value="2200">10:00pm</option>
									<option value="2230">10:30pm</option>
									<option value="2300">11:00pm</option>
									<option value="2330">11:30pm</option>
									<option value="2400">midnight</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group">
							수강금액<br> <input type="number" placeholder="수강금액"
								name="coursePrice">
						</div>
						<div class="form-group">
							스터디 오픈 카톡방 URL<br> <input type="url"
								placeholder="스터디 오픈 카톡방 URL" name="courseUrl">
						</div>


						<div class="form-group">
							스터디소개<br>
							<textarea rows="100" name="courseDetail" cols="50"
								style="height: 300px"
								placeholder="   스터디소개말을 입력해 주십시오. 수강생들이 보는 스터디에 대한 첫 인상이기 때문에 무엇보다도 중요할 수 있습니다. 그러니 조금이라도 신경을 써 주신다면 감사하겠습니다. 항상, 최선을 다 하는 postIT이 되겠습니다."></textarea>
						</div>

						<div class="form-group">
							<!-- <div>
								<p class="title">
									배경화면사진 업로드 <input type="file" id="input_img" name="file" />
							</div> -->
							 <label class="btn btn-primary" style="margin-top: 0px;">
                                    배경화면사진 업로드
                                    <input type="file" name="file" id="input_img" style="display: none;" onchange="javascript:document.getElementById('file_route').value=this.value">
                             </label>     
                            
							<input type="text" readonly="readonly"  class="form-control" title="File Route" id="file_route" style="height: 40px; margin-top: 15px;">
							 

						</div>

						<div>
							<div class="img_wrap">
								<img id="img" />
							</div>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<button type="submit" class="login-btn btn" style="align: center; width:100%">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>

	<a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>
	<!-- srolltop end -->

</div>
</body>

</html>