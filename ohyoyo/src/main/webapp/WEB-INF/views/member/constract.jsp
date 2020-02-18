<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* Common */
	* { box-sizing: border-box; }
	/* 기본적으로 태그에 margin 또는 padding이 들어가있는 태그들 */
	body, ul, h1, h2, h3, h4, h5, h6 {
		margin: 0; padding: 0;
		font-family: Dotum, 돋움, Helvetica, sans-serif;
		/* 여러 폰트를 해 놓으면 제일 처음 폰트부터 적용되고
			없으면 그 다음 폰트로 넘어가서 적용됨 */
	}
	body{
		background-color: #f9f9f9;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
		color: inherit;
	}
	/* Header */
	.wrap{
		width: 768px;
		margin: 60px auto;
	}
	#header{
		height: 169px;
		padding-top: 62px;
		margin-bottom: 32px;
		position: relative; 
		/*border: 1px solid red;*/
	}
	#container{
		position: relative;
		/*border: 1px solid green;*/
	}
	#footer{
		height: 81px;
		text-align: center;
		padding: 50px 0px 15px 0px;
		/*border: 1px solid blue;*/
	}
	.ohyoyo_join{
		font-size: 2em;
	}
	.o_join{
		display: block;
		width: 310px;
		height: 100px;
		/*background: url('../../img/logo_onlyy.png') -100px -100px;*/
		margin: 0 auto;
		font-size: 60px;
		font-family: 'Nanum Gothic Coding', monospace;
		text-align: center;
	}
	.o_logo img{
		width: 310px;
		height: 112px;
	}

	/* Container */
	.join_content{
		width: 460px;
		margin: 0 auto;
	}
	.terms{
		margin-bottom: 20px;
		background-color: white;
		border: 1px solid #dadada;
		border-radius:1px;
	}
	.terms_span > input{
		position: absolute;
		right: 1px;
		top: 50%;
		width: 22px;
		margin-top: -11px;
		visibility: hidden;
	}
	.terms_p{
		display: block;
		padding: 15px;
		margin: 0px;
		position: relative;
		border-bottom: 1px solid #dadada; 
	}
	.terms_span > label{
		background: url('${path}/resources/img/icons_off.png') 32% 50% no-repeat;
		background-size: 30px 30px;
		display: block;
		line-height: 60px;
		height: 58px;
		top: -1px;
		padding-left: 30px;
		font-size: 25px;
		font-weight: 700;
		text-align: center;
	}
	.terms_span > label:hover{
		cursor: pointer;
	}
	.terms_span{
		position: relative;
		display: block;
		height: 58px;
	}
	.terms_span > input:checked +label{
		background-image: url('${path}/resources/img/icons_on.png');
	}
	.terms_ul{
		padding-bottom: 20px;
	}
	.terms_ul > li{
		display: block;
		padding: 13px 15px 7px;
	}
	.li4_span > label{
		margin: 10px 0 0 30px;
	}
	.ul_li_span{
		position: relative;
		display: block;
		height: 24px;
	}
	.label1{
		height: 24px;
		font-size: 14px;
		font-weight: 700;
		line-height: 24px;
		/*position: absolute;*/
		color: #333;
		top: 0;
		left: 0;
		width: 80%;
	}
	.label2{
		height: 24px;
		line-height: 24px;
		font-size: 12px;
		color: #333;
	}
	.span_only{
		color: #f46665;
		font-size: 12px;
		font-weight: 400;
	}
	.ul_li_span > input{
		visibility: hidden;
		position: absolute;
		right: 1px;
		width: 22px;
		margin-top: -11px;
		top: 50%;
	}
	.ul_li_span > label{
		background: url('${path}/resources/img/icons_off.png') 0.5% 50% no-repeat;
		background-size: 25px 25px;
		display: inline-block;
		padding-left: 35px
	}
	.ul_li_span > label:hover{
		cursor: pointer;
	}
	.ul_li_span > input:checked +label{
		background-image: url('${path}/resources/img/icons_on.png');
	}
	.li_content{
		text-decoration: underline;
		float: right;
		padding-right: 10px;
		font-size: 12px;
		font-weight: 500;
		height: 24px;
		line-height: 24px;		
		cursor: pointer;
		color: #969696;
		/*display: none; */
	}
	.terms_box{
		position: relative;
		box-sizing: border-box;
		height: 88px;
		margin-top: 11px;
		padding: 8px 10px;
		border: 1px solid #f0f0f0;
		background-color: #f7f7f7;
		overflow: auto;
		display: none;
	}
	.li3terms{
		margin-top: 20px;
	}
	.article_title{
		font-size: 12px;
		font-weight: 700;
		line-height: 16px;
		color: #666;
	}
	.article > p {
		display: block;
		font-size: 12px;
		line-height: 16px;
		color: #666;
	}
	.span_select{
		color: #969696;
		font-size: 12px;
		font-weight: 400;
	}
	.err_check_msg{
		height: 24px;
		font-size: 12px;
		line-height:  14px;
		color: red;
		display: block;
	}
	.err_check{
		display: none;
	}
	.btn_double_area{
		margin: 30px -5px 0px;
		overflow: hidden;
		border-radius: 5px;
	}
	.btn_double_area > span{
		display: block;
		float: left;
		width: 50%;
	}
	.btn_type{
		width: auto;
		margin: 0px 5px;
		font-size: 20px;
		font-weight: 600;
		line-height: 61px;
		display: block;
		box-sizing: border-box;
		height: 61px;
		margin-top: 1px;
		text-align: center;
		border-radius: 4px;
	}
	.btn_default{
		color: #333;
		border: 1px solid #e7e7e7;
		background-color: #fff;
	}
	.btn_agree{
		color: #fff;
		border: 1px solid #F7B8B4;
		background-color: #F7B8B4;
	}
	.btn_agree:hover{
		border: 1px solid #f46665;
		background-color: #f46665;
	}
	.group_join{
		margin: 20px 0 65px;
		text-align: center;
		color: #666;
		font-size: 12px;
	}
	.group_join > a{
		text-decoration: underline;
		color: #333;
	}
	/* Footer */
	#footer{
    	padding: 15px 0;
    }
    #footer > ul {
    	margin: 0 auto 9px;
    	text-align: center;
    }
    #footer * {
    	font-size: 12px;
    	line-height: normal;
    	list-style: none;
    	color: #333;
    }
    #footer > ul > li {
    	display: inline;
    	padding: 0 5px 0 7px;
    	border-left: 1px solid #dadada;
    }
    #footer > ul > li a:hover {
    	color: #f46665; 
    	text-decoration: underline;
    }
    #footer ul li:first-child {
    	border-left: 0px!important;
    }
    #addr_logo{
    	width: 68px;
    	height: 19px;
    }
    #address{
    	margin: 0 auto;
    	text-align: center;
    }
    #address *{
    	font-size: bold;
    }
    #address a:hover{
    	color: #f46665;
    	text-decoration: underline;
    }
</style>
</head>
<body>
	<div class="wrap">
		<header>
			<div id="header">
				<h1 class="ohyoyo_join">
					<a href="#" class="o_join">join
						<!-- <img src="../../img/logo_onlyy.png"> -->
					</a>
				</h1>
			</div>
		</header>

		<section>

			<div id="container">
				<form class="join_content" 
					  name="" 
					  action="" 
					  method="">

					<div class="terms">
						<p class="terms_p">
							<span class="terms_span">
								<!-- input버튼 바꾸기
								 label이 핵심 라벨을 누르면 checkbox가 선택됨
								 그래서 라벨에 배경으로 이미지를 주고
								 checkbox는 숨겨놓기 -->
								<input type="checkbox" id="cbox">
								<label for="cbox">
									전체 동의
								</label>
							</span>
						</p>
						<ul class="terms_ul">
							<li class="trems_ul_li1">
								<span class="ul_li_span">
									<input type="checkbox" id="li1box" class="ckbox">
									<label for="li1box" class="label1">
										오요요 이용약관 동의
										<span class="span_only">(필수)</span>
									</label>
									<span class="li_content li1co">내용보기</span>
								</span>
								<div class="terms_box li1terms">
									<div class="article">
										<h3 class="article_title">제 1조(목적)</h3>
										<p>이 약관은 오요요가 운영하는 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.</p>
										<h3 class="article_title">제 2조(정의)</h3>
										<p>① “몰”이란 오요요 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</p>
									</div>
								</div>
							</li>
							<li class="trems_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="li2box" class="ckbox">
									<label for="li2box" class="label1">
										개인정보 수집 및 이용에 대한 안내
										<span class="span_only">(필수)</span>
									</label>
									<span class="li_content li2co">내용보기</span>
								</span>
								<div class="terms_box li2terms">
									<div class="article">
										<p>정보통신망법 규정에 따라 오요요에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
										<h3 class="article_title">1. 수집하는 개인정보</h3>
									</div>
								</div>
							</li>
							<li class="trems_ul_li3">
								<span class="ul_li_span">
									<input type="checkbox" id="li3box" class="ckbox">
									<label for="li3box" class="label1">
										쇼핑정보 수신 동의
										<span class="span_select">(선택)</span>
									</label>
									<span class="li_content li3co">내용보기</span>
								</span>
								
								<span class="ul_li_span li4_span">
									<input type="checkbox" id="li4box" class="ckbox">
									<label for="li4box" class="label2">
										SNS 수신 동의
									</label>
									<input type="checkbox" id="li5box" class="ckbox">
									<label for="li5box" class="label2">
										이메일 수신 동의
									</label>
								</span>
								<div class="terms_box li3terms">
									<div class="article">
										<p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS와 이메일로 받아보실 수 있습니다. <br>
										단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다. <br>
										선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="err_check">
						<span class="err_check_msg">오요요 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>
					<div class="btn_double_area">
						<span><a href="#" class="btn_type btn_default">취소</a></span>
						<span><a href="#" class="btn_type btn_agree">확인</a></span>
					</div>
				</form>
				<div class="group_join">
					간편하게 회원가입 하고 싶으세요? <a href="#">SNS 회원 가입</a>
				</div>
			</div>

		</section>
		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				<div id="address">
					<span>Copyright</span>
					<span>ⓒ</span>
					<span><strong><a href="#">OHYOYO Corp.</a></strong></span>
					<span>All Right Reserved.</span>
				</div>
			</div>
		</footer>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var flog = 'no';
		$('.li1co').click(function(){
			if(flog == 'no'){
				$('.li1terms').css('display','flex');
				flog = 'yes';
			} else {
				$('.li1terms').css('display','none');
				flog ='no';
			}
		});
		$('.li2co').click(function(){
			if(flog == 'no'){
				$('.li2terms').css('display','flex');
				flog = 'yes';
			} else {
				$('.li2terms').css('display','none');
				flog ='no';
			}
		});
		$('.li3co').click(function(){
			if(flog == 'no'){
				$('.li3terms').css('display','flex');
				flog = 'yes';
			} else {
				$('.li3terms').css('display','none');
				flog ='no';
			}
		});
	});
</script>
</html>