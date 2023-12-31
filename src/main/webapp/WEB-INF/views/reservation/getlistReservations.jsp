<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath=request.getContextPath();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 백신 예약 내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/CSS/listMyReservations.css">
<script>
	window.onload=function(){
		
		var isLogin = "${isLogin}";
		var isAdminLogin = "${isAdminLogin}";
		console.log("isAdminLogin : "+isAdminLogin);
		console.log("isLogin : "+isLogin);
		console.log("${memVO.mid}");
		if(isLogin==""){
			console.log("공백입니다.");
		}
	
		var member_menu = document.getElementById("member_menu");
		var admin_menu = document.getElementById("admin_menu");
		
		if((isLogin=="true"&&isAdminLogin=="false")||(isLogin=="true"&&isAdminLogin.length==0)){
	
			member_menu.style.display="block";
			admin_menu.style.display="none";
		}
		else if((isAdminLogin=="true"&&isLogin=="false")||(isAdminLogin=="true"&&isLogin.length==0)){
	
			member_menu.style.display="none";
			admin_menu.style.display="block";
		}
		else{
	
			member_menu.style.display="block";
			admin_menu.style.display="none";
		}
	
	}
</script>
<style>
   .black-link{
      color: black;
      text-decoration: none;
   }
   .black-link:hover{
      color: blue;
      text-decoration: underline;
   }
</style>
<script>
	document.addEventListener('DOMContentLoaded', function() {
	    const mvcinsertform = document.querySelector('.a-mvcinsertform');
	    const mvclistform = document.querySelector('.a-mvclistform');
	    const hopitalform = document.querySelector('.a-hopitalform');
	
	    mvclistform.classList.add('active'); // 초기 링크를 활성화 상태로 표시
	    
	    hopitalform.addEventListener('click', function() {
	        hopitalform.classList.add('active'); //링크 활성화
	        mvcinsertform.classList.remove('active'); // 다른 링크 비활성화
	        mvclistform.classList.remove('active'); // 다른 링크 비활성화
	    });
	    
	    mvcinsertform.addEventListener('click', function() {
	    	mvcinsertform.classList.add('active'); //링크 활성화
	    	hopitalform.classList.remove('active'); // 다른 링크 비활성화
	        mvclistform.classList.remove('active'); // 다른 링크 비활성화
	    });
	    
	    mvclistform.addEventListener('click', function() {
	    	mvclistform.classList.add('active'); //링크 활성화
	    	hopitalform.classList.remove('active'); // 다른 링크 비활성화
	    	mvcinsertform.classList.remove('active'); // 다른 링크 비활성화
	    });

	});
	
</script>
</head>
<body>
	<jsp:include page="../nav.jsp"/>
	<div class="container-fluid p-3 pt-4 bg-light text-dark pb-5">
		<div class="wrap-container d-flex justify-content-between">
			<!-- 왼쪽 -->
			<div class="left me-4" style="width: 20%;">
				<!-- 왼쪽 회원 서비스 -->
				<div class="hosform-leftwrap-container">
					<div class="hosleft-box">
						<div class="hosservice-box">
							<div class="hosservice form-control">
	                           예방접종 관리
	                        </div>
	                        <div class="card hos-service-box mt-2">
			                  	<ul class="list-group list-group-flush">
								    <li class="list-group-item a-mvcinsertform"><a class="vcc-alink" href="${contextPath}/reservation/getreservationForm.do">회원 예방접종 예약</a></li>
								    <li class="list-group-item a-mvclistform active"><a class="vcc-alink" href="${contextPath}/reservation/getlistReservations.do">회원 예방접종 관리</a></li>
								    <li class="list-group-item a-hopitalform"><a class="vcc-alink" href="${contextPath}/hospital/getlistHospital.do">지정 의료기관 관리</a></li>
							   </ul>
		                   </div>
                        </div>
                    </div>
                </div>
			</div>
			
			<!-- 오른쪽 -->
			<div class="right ms-4 text-center" style="width: 80%;" >
				<h3 class="border-bottom border-2 border-secondary-subtle text-start pb-3 mt-4 pt-5 mb-0"><strong>예방접종 관리</strong></h3>
				<div id="all" style="display: block;">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">병원</th>
								<th scope="col">백신</th>
								<th scope="col">예약날짜</th>
								<th scope="col">아이디</th>
								<th scope="col">작성날짜</th>
								<th scope="col">예약상세</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listReservation" items="${listReservations}" >
								<tr>        
									<td>${listReservation.rhospital}</td>
									<td>${listReservation.rvcc}</td>
	 								<td><fmt:formatDate value="${listReservation.rdate}" pattern="yy-MM-dd HH:mm"/></td>
	 								<td>${listReservation.rid}</td>
				                    <td><fmt:formatDate value="${listReservation.rwritedate}" pattern="yy-MM-dd"/></td>
									<td>
										<a href="<%=contextPath%>/reservation/getDetailReservation.do?rno=${listReservation.rno}">상세보기</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
	
</body>
</html>