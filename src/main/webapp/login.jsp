<!-- 로그인 페이지 (2022-10-27 이수) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/header_style.css">
<link rel="stylesheet" type="text/css" href="./css/login_style.css">
<script src="https://kit.fontawesome.com/22a8f0c699.js"></script>
<!-- 부트스트랩을 기본 디자인으로 사용 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조 -->
<script src="./js/main.js" defer></script>

<title>로그인 페이지</title>
<style type="text/css">
* {  
       margin: 0;  
       padding: 0;
       box-sizing: border-box;
   }
a, a:hover {
	color:#000000;
	text-decoration: none;
}
li{
 list-style:none;
}
	
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@700&family=Poppins:wght@400;500;600&display=swap');

.login{
  position: fixed;
  margin: 0 auto;
  left: 0;
  right: 0;
  width: 350px;
  background-color: white;
  margin-top:50px;
  align-self: center;
  border: 1px solid silver;
  border-radius: 10px;
  box-shadow: 10px 10px 15px rgba(0,0,0,0.05);
}
.login h1{
  text-align: center;
  padding: 10px 0;
  border-bottom: 1px solid silver;
}
.login form{
  padding: 0 40px;
  box-sizing: border-box;
}
form .form-group{
  position: relative;
  border-bottom: 2px solid #adadad;
  position: relative;
    border-bottom: 2px solid #adadad;
    margin-top: 20px;
    margin-bottom: 10px;
}
.form-group input{
  width: 100%;
  padding: 0 5px;
  height: 40px;
  font-size: 16px;
  border: none;
  background: none;
  outline: none;
}
.form-group label{
  position: absolute;
  top: 50%;
  left: 5px;
  color: #adadad;
  transform: translateY(-50%);
  font-size: 16px;
  pointer-events: none;
  transition: .5s;
}
.form-group span::before{
  content: '';
  position: absolute;
  top: 40px;
  left: 0;
  width: 0%;
  height: 2px;
  background: #2691d9;
  transition: .5s;
}
.form-group input:focus ~ label,
.form-group input:valid ~ label{
  top: -5px;
  color: #2691d9;
}
.form-group input:focus ~ span::before,
.form-group input:valid ~ span::before{
  width: 100%;
}
.pass{
  margin: -5px 0 20px 5px;
  color: #a6a6a6;
  cursor: pointer;
}
.pass:hover{
  text-decoration: underline;
}
input[type="submit"]{
  width: 100%;
  height: 50px;
  border: 1px solid;
  background: #2691d9;
  border-radius: 25px;
  font-size: 18px;
  color: #e9f4fb;
  font-weight: 700;
  cursor: pointer;
  outline: none;
}
input[type="submit"]:hover{
  border-color: #2691d9;
  transition: .5s;
}
.signup_link{
  margin: 30px 0;
  text-align: center;
  font-size: 16px;
  color: #666666;
}
.signup_link a{
  color: #2691d9;
  text-decoration: none;
}
.signup_link a:hover{
  text-decoration: underline;
}

</style>
</head>
<body>
<div>
	<!-- 상단 헤더 (2022-11-18 이수) -->
 	<!-- 상단우측 메뉴바 버튼 -->
 	<header class="header">
 	<!-- 상단 메뉴버튼 -->
 		<!-- 상단 우측 메뉴 -->
	 	<div class="navbar_topmenu" style="margin:0;">
	 	<%
			// 로그인이 된 경우.
			String userID = null;
			if(session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
		%>	
	       	<li>
	       	<a href="logoutAction.jsp"><i class="fa-solid fa-right-from-bracket"></i></a>
	        |
	       	<a href="myPage.jsp"><i class="fa-solid fa-user"></i></a>
	       	|
	       	<a href="basket.jsp"><i class="fa-solid fa-basket-shopping"></i></a>
	       	</li> <p>
	       	
       	 <%
			}
      		// 로그인이 되어 있지 않은 경우.
      		else if(userID == null) {
         %>
	       	<li>
	       	<a href="login.jsp"><i class="fa-solid fa-lock"></i></a>
	       	|
	       	<a href="join.jsp"><i class="fa-solid fa-user-plus"></i></a>
	       	|
	       	<a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
	       	</li> <p>
	       	<%
          	}
       		%>
	    </div>
	    
	    <!-- 토글버튼 -->
		<a href="#" class="navbar_toggleBtn">
	       	<i class="fa-solid fa-bars"></i>
	   	</a>
	    
	    <!-- 상단 로고 -->
		<div class="header_logo">
			<a href="MainIndex.jsp"><i class="fa-solid fa-tags"></i>ShoppingMal</a>
		</div>
		
		<!-- 상단 센터메뉴 -->
		<div class="navbar_centermenu" style="margin-bottom: 10px;">
			<ul>
				<li><a href="product.jsp">모든상품</a></li>
				<li><a href="#">인기상품</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="bbs.jsp">고객센터</a></li>
			</ul>
		</div>
   	</header>
  
    <!-- 로그인 화면 -->
	<!-- 로그인 정보 전달 -->
	<div class="login">
	    <h1>Login</h1>
	    	<form method = "post" action="loginAction.jsp" style="padding-bottom: 30px;">
		    	<div class ="form-group">
			        <input type ="text" class="form-control" name ="userID" maxlength='20' required>
			    	<span></span>
			    	<label>User ID</label>
		    	</div>
			    <div class ="form-group">
			        <input type ="password" class="form-control" name ="userPassword" maxlength='20' required>
			    	<span></span>
			    	<label> Password</label>
			    </div>
			    <div class="sub" style="display: flex; justify-content: space-between; padding-bottom: 20px;">
			    	<li style="text-align: left;"><a href="#" >비밀번호 재설정</a></li>
		    		<li style="text-align: rigth;"><a href="join.jsp">회원가입</a></li>	
    			</div>
		    	<input type="submit"  class="btn btn-primary form-control" value="로그인">
   		</form>
   	</div>
   	</div>
</body>
</html>