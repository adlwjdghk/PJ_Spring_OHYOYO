<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>footer</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
	#footer{
		margin-top: 50px;
		padding-top: 50px;
	}
	.footer_wrap{
		position: relative;
		width: 100%;
	}
	.footer_container{
		position: relative;
		width: 1260px;
		margin: 0 auto;
		padding: 60px 0;
		color: #404041;
	}
	.footer_banner a{
		position: relative;
	}
	.footer_banner_img{
		width: 1900px;
		height: 400px;
		background: url(${path}/resources/img/puppies-2243686_1920.jpg) no-repeat -1px -335px;
	}
	.footer_banner_text{
		position: absolute;
	    bottom: 60px;
	    left: 50%;
	    transform: translate(-50%,-50%);
	    text-align: center;
	    font-size: 114pt;
	    font-weight: bold;
	    color: #111;
	}
	.footer_top > ul {
    	margin: 0 auto 9px;
    	text-align: left;
    }
    .footer_top > ul > li {
    	display: inline;
    	padding: 0 5px 0 7px;
    }
    .footer_top > ul > li a:hover {
    	color: #f46665; 
    	text-decoration: underline;
    }
    .footer_top ul li:first-child {
    	border-left: 0px!important;
    }
    .footer_bottom{
    	padding: 30px 0 20px;
    	text-align: left;
    }
    .footer_info_1{
    	line-height: 125%;
    }
    .footer_info_1 span{
    	margin-right: 6px; 
    }
    .footer_info_1 span strong{
    	margin-right: 5px; 
    }
    .footer_info_2{
    	margin: 0 auto;
    	text-align: left;
    	padding-top: 30px;
    }
    #address span{
    	font-size: 12px;
    }
    #address a:hover{
    	color: #f46665;
    	text-decoration: underline;
    }
</style>
</head>
<body>
	<div id="footer">
		<div class="footer_banner_wrap">
			<div class="footer_banner">
				<a href="#">
					<img class="footer_banner_img" >
					<div class="footer_banner_text">ohyoyo</div>
				</a>
			</div>
		</div>
		<div class="footer_wrap">
			<div class="footer_container">
				<div class="footer_top">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><strong><a href="#">개인정보처리방침</a></strong></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div class="footer_bottom">
					<div class="footer_info">
						<div class="footer_info_1">
							<span><strong>CEO</strong>이구리</span>
							<span><strong>Company</strong>주식회사 오요요</span>
							<span><strong>Address</strong>강아지시 귀엽구 사랑스럽동 해주고싶로 599 10동 1004호</span>
							<br>
							<span><strong>Business registration number</strong>001-00-12345</span>
							<span><strong>Report number</strong>2020-광주A-0028</span>
							<span><strong>Personal information manager</strong>이구리</span>
							<br>
							<span><strong>Sales inquiry</strong>ohyoyo2020@gmail.com</span>
						</div>
						<div class="footer_info_2" id="address">
							<span>Copyright</span>
							<span>ⓒ</span>
							<span><strong><a href="#">OHYOYO Corp.</a></strong></span>
							<span>All Right Reserved.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>