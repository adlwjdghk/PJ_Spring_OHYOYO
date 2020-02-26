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
			margin: 65px auto 0;
			background-color: white;
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
		.main_product1{
			margin: 115px 0 50px;
		}
		.main_pdt_title h2{
			font-size: 20px;
			color: #333;
			text-align: center;
			margin:0 0 70px;
		}
		.main_product_list{
			display: table;
			width: 100%;
			min-width: 756px;
			margin: -20px 0 0;
		}
		.main_product_list > li{
			display: inline-block;
			width: 25%;
			color: #757575;
		}
		.main_product_list > li:hover .main_product_button{
			visibility: visible;
		}
		.main_product_list > li:hover .main_product_img img{
			opacity: 0.5;
		}
		.main_product_img{
			position: relative;
			margin: 0 7px 25px;
			text-align: center;
		}
		.main_product_img a img{
			max-width: 100%;
			box-sizing: border-box;
		}
		.main_product_ex{
			margin: 0 auto;
			padding: 0 13px;
			font-size: 13px;
			line-height: 18px; 
		}
		.main_product_name{
			/*display: block;*/
			border-bottom: 1px solid #ddd;
			padding-bottom: 7px;
			margin-bottom: 10px;
			height: 44px;
			color: #555555;
			display: flex;
			align-items: flex-end;
		}
		.main_product_name span{
			
		}
		.main_product_ex > ul{
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
		.main_product_button{
			margin: 0 0 15px;
			height: 35px;
			visibility: hidden;
		}
		.main_product_icon{
			margin: 10px 0 4px;
		}
		.main_product_icon i{
			font-size: 18px;
			color: #dddddd;
			padding-right: 2px;
		}
		.main_product_icon i:hover{
			font-size: 18px;
			color: #888888;
		}
	</style>
</head>
<body>
<!-- 만드는 위치가 달라짐  -->
<%@ include file="include/modal.jsp" %> 
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
 		
	 		<div class="main_product main_product1">
	 			<div class="main_pdt_title">
	 				<h2><b>BEST PRODUCT</b></h2>
	 			</div>
	 			<ul class="main_product_list">
	 				<c:forEach items="${BestPdt}" var="pdt">
		 				<li class="main_product_one">
		 					<div class="main_product_img">
		 						<a href="#"><img src="${path}/resources/img/product/${pdt.p_img}"></a>
		 					</div>
		 					<div class="main_product_ex">
		 						<strong class="main_product_name">
		 							<a href="#"><span>${pdt.pname}</span></a>
		 						</strong>
		 						<ul>
		 							<li>
		 								<span class="normalprice">
		 									<fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.sale_price}"/>원
		 								</span>
		 							</li>
		 							<li>
		 								<span class="discount">
		 									<fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.price}"/>원
		 								</span>
		 							</li>
		 						</ul>
		 						<div class="main_product_button">
		 							<div class="main_product_icon">
		 								<span><i class="fas fa-shopping-cart"></i></span>
		 								<span><i class="fas fa-heart"></i></span>
		 							</div>
		 						</div>	
		 					</div>
		 				</li>
	 				</c:forEach>
	 			</ul>
	 		</div>
	 		<div class="main_product">
	 			<div class="main_pdt_title">
	 				<h2><b>NEW PRODUCT</b></h2>
	 			</div>
	 			<ul class="main_product_list">
	 				<c:forEach items="${NewPdt}" var="npdt">
		 				<li class="main_product_one">
		 					<div class="main_product_img">
		 						<a href="#"><img src="${path}/resources/img/product/${npdt.p_img}"></a>
		 					</div>
		 					<div class="main_product_ex">
		 						<strong class="main_product_name">
		 							<a href="#"><span>${npdt.pname}</span></a>
		 						</strong>
		 						<ul>
		 							<li>
		 								<span class="normalprice">
		 									<fmt:formatNumber type="number" maxFractionDigits="3" value="${npdt.sale_price}"/>원
		 								</span>
		 							</li>
		 							<li>
		 								<span class="discount">
		 									<fmt:formatNumber type="number" maxFractionDigits="3" value="${npdt.price}"/>원
		 								</span>
		 							</li>
		 						</ul>
		 						<div class="main_product_button">
		 							<div class="main_product_icon">
		 								<span><i class="fas fa-shopping-cart"></i></span>
		 								<span><i class="fas fa-heart"></i></span>
		 							</div>
		 						</div>	
		 					</div>
		 				</li>
	 				</c:forEach>
	 			</ul>
	 		</div>
 		</div>
 	</div>
 </div>
</body>
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