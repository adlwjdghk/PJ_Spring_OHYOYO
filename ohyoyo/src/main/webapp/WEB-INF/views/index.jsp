<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/header.jsp" %> 
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>ohyoyo 오요요</title>
	<script src="https://kit.fontawesome.com/e2a7455480.js" crossorigin="anonymous"></script>
	<link rel="stylesheet"  type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap');
		#main_wrap{
			width: 100%;
			margin: 0 auto;
		}
		#main_container{
			width: 1260px;
			margin: auto;
		}
		/* 메인 슬라이드*/
		.main_contain_nav{
			overflow: hidden;
			width: 1260px;
			/* height: 100%; */
		}
		/* Slideshow container */
		.slideshow_container {
		  max-width: 1400px;
		  position: relative;
		  margin: auto;
		}

		/* Next & previous buttons */
		.prev, .next {
		  cursor: pointer;
		  position: absolute;
		  top: 50%;
		  width: auto;
		  padding: 16px;
		  margin-top: -22px;
		  color: white;
		  font-weight: bold;
		  font-size: 18px;
		  transition: 0.6s ease;
		  border-radius: 0 3px 3px 0;
		}

		/* Position the "next button" to the right */
		.next {
		  right: 0;
		  border-radius: 3px 0 0 3px;
		}

		/* On hover, add a black background color with a little bit see-through */
		.prev:hover, .next:hover {
		  color: rgba(0,0,0,0.8);
		}

		.img_nav_wrap{
			position: absolute;
			bottom: 15px;
			right: 46%;
		}
		.img_nav {
		  cursor: pointer;
		  height: 7px;
		  width: 15px;
		  margin: 0 2px;
		  background-color: white;
		  border-radius: 2px;
		  display: inline-block;
		  transition: background-color 0.6s ease;
		}

		.active, .img_nav:hover {
		  background-color: #717171;
		}

		/* Fading animation */
		.fade {
		  -webkit-animation-name: fade;
		  -webkit-animation-duration: 1.5s;
		  animation-name: fade;
		  animation-duration: 1.5s;
		}

		@-webkit-keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}

		@keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}

		/* On smaller screens, decrease text size */
		@media only screen and (max-width: 300px) {
		  .prev, .next,.text {font-size: 11px}
		}

		/* 베스트 상품 */
		.main_product{
			margin: 115px 0 50px;
		}
		.title h2{
			font-size: 20px;
			color: #333;
			text-align: center;
			margin:0 0 70px;
		}
		.product_list{
			display: table;
			width: 100%;
			min-width: 756px;
			margin: -20px 0 0;
		}
		.product_list > li{
			display: inline-block;
			width: 25%;
			color: #757575;
		}
		.product_list > li:hover .product_button{
			visibility: visible;
		}
		.product_img{
			position: relative;
			margin: 0 7px 25px;
			text-align: center;
		}
		.product_img a img{
			max-width: 100%;
			box-sizing: border-box;
		}
		.product_ex{
			margin: 0 auto;
			padding: 0 13px;
			font-size: 13px;
			line-height: 18px; 
		}
		.product_name{
			/*display: block;*/
			border-bottom: 1px solid #ddd;
			padding-bottom: 7px;
			margin-bottom: 10px;
			height: 44px;
			color: #555555;
			display: flex;
			align-items: flex-end;
		}
		.product_name span{
			
		}
		.product_ex > ul{
			font-family: 'Nanum Gothic', sans-serif;
		}
		.normalprice{
			font-size: 12px;
			text-decoration: line-through;
		}
		.discount{
			font-size: 13px;
			font-weight: bold;
		}
		.product_button{
			margin: 0 0 15px;
			height: 35px;
			visibility: hidden;
		}
		.product_icon{
			margin: 10px 0 4px;
		}
		.product_icon i{
			font-size: 18px;
			color: #dddddd;
		}

		/* review */
		.main_review{
			padding-bottom: 44px;
		}
		.review_wrap{
			border-bottom: 1px solid #dadada;
			position: relative;
		}
		.review_list{
			width: 1185px;
			
			margin: 0 auto;
		}
		.review_one{
			cursor: pointer;
			float: left;
			width: 215px;
			border: 1px solid #e5e5e5;
			padding: 0;
			margin: 0 10px 50px 10px;
			box-shadow: 0 3px 3px #fafafa;
			
		}
		.li_photo{
			/* height: 100%; */
			border-bottom: 1px solid #f3f3f3;
			overflow: hidden;
		}
		.li_photo img{
			width: 215px;
		}
		.li_text{
			height: 32px;
			padding: 12px 2px 15px 2px;
			margin: 0 10px;
			border-bottom: 1px solid #f3f3f3;
		}
		.li_text div:first-child{
			display: block;
			font-size: 12px;
			padding-bottom: 5px;
			color: black;
			overflow: hidden;
		}
		.review_name{
			font-size: 11px;
			color: #c4c4c4;
		}
	</style>
</head>
<body>
 <div id="main_wrap">
 	<div id="main_container">
 		<div class="main_contain">
 			<div class="main_contain_nav">
 				<div class="slideshow_container">
					<div class="mySlides fade">
					  <img src="${path}/resources/img/dfewfesdf.png" style="width:100%">
					</div>
					<div class="mySlides fade">
					  <img src="${path}/resources/img/dogtent.png" style="width:100%">
					</div>
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
					<div style="text-align:center" class="img_nav_wrap">
					  <span class="img_nav" onclick="currentSlide(1)"></span>
					  <span class="img_nav" onclick="currentSlide(2)"></span> 
					</div>
				</div>
 			</div>
 		
	 		<div class="main_product">
	 			<div class="title">
	 				<h2><b>BEST PRODUCT</b></h2>
	 			</div>
	 			<ul class="product_list">
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/homeone.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>오요요 포근포근 텐트</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">39,000원</span></li>
	 							<li><span class="discount">29,500원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/foodone.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>ANF 6FREE 플러스 소고기 연어 5.6kg</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">45,000원</span></li>
	 							<li><span class="discount">38,000원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/foodthree.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>네츄럴코어 강아지용 미트스틱 20P</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">12,000원</span></li>
	 							<li><span class="discount">8,900원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/foodtwo.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>프레스키 터키츄 칠면조힘줄 하드링 M</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">5,500원</span></li>
	 							<li><span class="discount">4,500원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/pillone.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>풀무원 아미오 헬씨믹스 트릿 눈물 눈물자국 100g</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">45,000원</span></li>
	 							<li><span class="discount">38,000원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/playone.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>브리더 캐릭터 장난감 문어</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">3,000원</span></li>
	 							<li><span class="discount">2,500원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/playtwo.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>쥬쥬베 노즈워크 트릿볼 핑크</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">8,500원</span></li>
	 							<li><span class="discount">4,500원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 				<li class="product_one">
	 					<div class="product_img">
	 						<a href="#"><img src="${path}/resources/img/product/houseone.png"></a>
	 					</div>
	 					<div class="product_ex">
	 						<strong class="product_name">
	 							<a href="#"><span>페로가토 구름 원형 강아지 방석 (색상선택가능) - 중형</span></a>
	 						</strong>
	 						<ul>
	 							<li><span class="normalprice">27,000원</span></li>
	 							<li><span class="discount">21,900원</span></li>
	 						</ul>
	 						<div class="product_button">
	 							<div class="product_icon">
	 								<span><i class="fas fa-shopping-cart"></i></span>
	 								<span><i class="fas fa-heart"></i></span>
	 							</div>
	 						</div>	
	 					</div>
	 				</li>
	 			</ul>
	 		</div>
	 		<div class="main_review">
	 			<div class="rewiew_wrap">
	 				<ul class="review_list">
	 					<li class="review_one">
	 						<div>
		 						<div class="li_photo">
		 							<ul>
		 								<li><img src="${path}/resources/img/reviewPhoto/dog-3875108_1920.jpg"></li>
		 							</ul>
		 						</div>
		 						<div class="li_text">
		 							<div>강아지가 입맛이 까다로운데 기호성이 좋아서 엄청 잘먹네요!</div>
		 							<div class="review_name">이**</div>
		 						</div>
		 					</div>
		 					<div></div>
	 					</li>
	 				</ul>
	 			</div>
	 		</div>
 		</div>
 	</div>
 </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var slideIndex = 0;
	showSlides(slideIndex);

	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("img_nav");
	   console.log(slides.length);
	  if (n < 0) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1} 
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	  setTimeout(showSlides, 5000);
	}
</script>
</html>