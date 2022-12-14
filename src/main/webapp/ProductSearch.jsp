<!-- 2022-12-02 이수 -->
<%@page import="product.ProductListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="./css/header_style.css">
   <link rel="stylesheet" type="text/css" href="./css/main_style.css">
   <!-- 부트스트랩을 기본 디자인으로 사용 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조 -->
    <script src="https://kit.fontawesome.com/22a8f0c699.js" crossorigin="anonymous"></script>
    <script src="./js/main.js" defer></script>
    
  <style>
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
 </style>
<title>상품 검색 페이지</title>
</head>
<body>
<!-- 상단 헤더 (2022-11-18 이수) -->
 	<!-- 상단우측 메뉴바 버튼 -->
 	<div>
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
	       	</li> <p></p>
	       	<%
          	}
       		%>
	    </div>
	    
	    <!-- 토글버튼 -->
		<a href="#" class="navbar_toggleBtn">
	       	<i class="fa-solid fa-bars"></i>
	   	</a>
	    
	    <!-- 상단 로고 -->
		<div class="header_logo"">
			<a href="MainIndex.jsp"><i class="fa-solid fa-tags"></i>ShoppingMal</a>
		</div>
		
		<!-- 상단 센터메뉴 -->
		<div class="navbar_centermenu">
			<ul>
				<li><a href="product.jsp">모든상품</a></li>
				<li><a href="#">인기상품</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="bbs.jsp">고객센터</a></li>
			</ul>
		</div>
   	</header>
   	
	<!-- 중간화면 -->
   	<section class="section">
   		<div class="article" style="text-align: center; align-items: center;"> 
            <h1>Best Pick</h1> <p>
            <table style="margin-left: auto; margin-right: auto;">
			<%
				// 검색하는 객체 생성.
				ProductDAO pdao = new ProductDAO();
				ArrayList<ProductListBean> arr = pdao.getSearch("");
				
				// 화면에 3개의 열(테이블)로 보여주기 위해 선언하는 변수.
				int j = 0;
        		for(int i=0; i < arr.size(); i++) {
        			ProductListBean bean = arr.get(i);
        			if(j%3==0) {
			%>
            	<tr>
           	<%
        			}
        			
           	%>
            		<td align="center">
	            		<a href="ProductInfo.jsp?no=<%=bean.getNo()%>">
	            		<img alt="" src="img/<%=bean.getImg()%>" width="215" height="160" style="margin:10px;">
	            		</a><p> <%=bean.getName()%>
            		</td>
         	<% 
         				j++;
         			} 
         	%>
           		</tr>
            </table>
    	</div>
	</section>
	

</body>
</html>