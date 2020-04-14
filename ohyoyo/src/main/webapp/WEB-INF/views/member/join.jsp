<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp" %> 
<%@ include file="../include/modal.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
	/* Header */
	.wrap{
		width: 768px;
		margin: 60px auto;
	}
	.header{
		padding: 62px 0 0;
		position: relative;
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
		text-align: center;
	}
	
	/* container */
	.join_content{
		width: 460px;
		margin: 0 auto;
	}
	.row_group{
		overflow : hidden;
		width: 100%;
	}
	.join_title{
		margin: 19px 0 8px;
		font-size: 14px;
		font-weight: 700;
		color: black;
	}
	.join_row input{
		outline: none;
	}
	.ps_box:hover {
		border: 1px solid #999;
	}
	.ps_box input:hover{
		border: none;
	}
	.ps_box{
		display: flex;
		align-items: center;
		position: relative;
		width: 100%;
		height: 51px;
		border: 1px solid #dadada;
		padding: 10px 14px 10px 14px;
		background: #fff;
		vertical-align: top;
	}
	.email_hidden_box{
		display: none;
	}
	.int_pass{
		padding-right: 40px;
	}
	.overlap{
		border-bottom: 1px solid transparent;
	}
	.join_row::last-of-type{
		border: 1px solid #dadada;
	}
	.int{
		display: block;
		position: relative;
		width: 100%;
		height: 29px;
		padding-right: 25px;
		line-height: 29px;
		border: none;
		background: #fff;
		font-size: 15px;
		z-index: 10;
	}
	.step_url{
		position: absolute;
		right: 13px;
		font-size: 15px;
		color: #8e8e8e;
	}
	.join_err_msg{
		display: inline-block;
		margin: 9px 0 -2px;
		font-size: 12px;
		line-height: 14px;
		color: red;
		height: 15px;
		visibility: hidden;
	}
	.pw_lock{
		background: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
		background-repeat: no-repeat;
		background-size: 125px 75px;
		cursor: pointer;
		width: 24px;
		height: 24px;
		display: inline-block;
	}
	.repw_lock{
		background: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
		background-repeat: no-repeat;
		background-size: 125px 75px;
		cursor: pointer;
		width: 24px;
		height: 24px;
		display: inline-block;
		background-position: -27px 0;
	}
	.sel{
		background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
		background-size: 20px 8px;
		width: 100%;
		height: 29px;
		font-size: 15px;
		line-height: 18px;
		color: #000;
		border: none;
		-webkit-appearance: none;
		outline: none;
	}
	.sel_box, .sel_box *{
		cursor: pointer;
	}
	.choice{
		font-size: 12px;
		font-weight: 400;
		color: #8e8e8e;
	}
	.btn_double_area{
		margin: 30px 0 9px;
	}
	.btn_type{
		display: block;
		width: 100%;
		padding: 21px 0 17px;
		font-size: 20px;
		font-weight: 700;
		text-align: center;
		cursor: no-drop;
		border-radius: 4px;
		border: none;
		outline: none;
	}
	.email_box{
		display: flex;
		align-items: center;
	}
	.email_id{
		width: 80%;
	}
	
	.nbsp{
		width: 20px;
		display: inline-block;
	}
	.addr_poc_button{
		width: 103px;
		height: 51px;
		font-size: 14px;
		font-weight: 700;
		color: black;
		background-color: white;
		cursor: pointer;
		border-color: transparent;
		border: 1px solid #dadada;
		outline: none;
		border-bottom: transparent;
		border-left: transparent;
	}
	.addr_poc_button:hover{
		border: 1px solid #999;
		right:1px;
    	z-index: 10;
	}
	.postcode{
		display: flex;
		justify-content: space-around;
	}
	.highlight{
		color: #f24443;			
	}
	.ps_box_name{
		position: relative;
	}
	.name_cnt_box{
		position: absolute;
		right: 12px;
   		z-index: 10;
	}
	/* loadingbar */
	#back{
		position: fixed;
		z-index: 1200;
		background-color: rgba(0,0,0,0.4);
		overflow: auto;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		display: none;
		align-items: center;
		justify-content: center;
	}
	.loading_img{
		animation: ani_loading 1.5s infinite linear;
		font-size: 70px;
		color: #f46665;
	}
	@keyframes ani_loading{
		from{-webkit-transform: rotate(0deg);}
		to{-webkit-transform: rotate(359deg);}
	}

</style>
</head>
<body>
	<div class="wrap">
		<header><div class="header">
			<h1 class="ohyoyo_join"><a href="#" class="o_join">
				<!-- <img src="../../img/logo_onlyy.png"> -->
				join
			</a></h1>
		</div></header>
		<section>
			 <!-- <form id="frm_member" name="frm_member" action="${path}/member/join" method="POST"> -->
			 <!-- Spring form태그 form:form -->
			 <!-- form:form 태그는 method를 생략하면 defalut는 POST -->
			 <!-- action을 생략하면 왔던(기존의) url을 그대로 넣어줌  -->
			 <form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
				<div class="contaioner">
					<div class="join_content">
						<div class="row_group">
							<div class="join_row">
								<h3 class="join_title">
									<label for="uid">아이디<span class="highlight">*</span></label>
								</h3>
								<span class="ps_box int_id">
									<input type="text" id="uid" name="id" class="int id_input" placeholder="아이디 입력" value="${user.id}">
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="upw">비밀번호<span class="highlight">*</span></label>
								</h3>
								<span class="ps_box int_pass overlap">
									<input type="password" id="upw" name="pw" class="int" placeholder="비밀번호 입력 (8자이상)">
									<span class="step_url"><span class="pw_lock"></span></span>
								</span>
								<span class="ps_box int_pass">
									<input type="password" id="urpw" name="urpw" class="int" placeholder="비밀번호 재확인">
									<span class="step_url"><span class="repw_lock"></span></span>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
						</div>
						<div class="row_group">
							<div class="join_row">
								<h3 class="join_title">
									<label for="uname">이름<span class="highlight">*</span></label>
								</h3>
								<span class="ps_box ps_box_name">
									<input type="text" id="uname" name="name" class="int" value="${user.name}"> 
									<span class="name_cnt_box"><span id="name_cnt">0</span>/20</span>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="uemail">이메일<span class="highlight">*</span></label>
								</h3>
								<span class="ps_box email_hidden_box">
									<input type="text" class="int" name="email" id="emailAll" value="${user.email}">
								</span>
								<div class="email_box">
									<span class="ps_box email_id overlap">
										<input type="text" class="int" id="uemail" name="uemail" placeholder="ID">
									</span>
									<span class="nbsp" ></span>
									<span class="bulr">@</span>
									<span class="nbsp"></span>
									<span class="ps_box overlap">
										<input type="text" class="int" id="email_url" placeholder="Email 선택" readonly="readonly">
									</span>
								</div>
								<div class="email_box">
									<span class="ps_box sel_box">
										<select class="sel" id="selmail">
											<option value="" selected="selected">Email 선택</option>
											<option value="directVal">직접입력</option>
											<option value="naver.com">naver.com (네이버)</option>
											<option value="daum.net">daum.net (다음)</option>
											<option value="gmail.com">gmail.com (구글)</option>
											<option value="nate.com">nate.com (네이트)</option>
										</select>
									</span>
								</div>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
	
							<div class="join_row">
								<h3 class="join_title">
									<label for="uphone">휴대전화<span class="highlight">*</span></label>
								</h3>
								<span class="ps_box">
									<input type="tel" id="uphone" name="phone" class="int" placeholder="-없이 입력  예) 01012341234" value="${user.phone}">
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="sample6_detailAddress">주소<span class="highlight">*</span></label>
								</h3>
								<div class="addr_wrap">
									<div class="postcode">
										<span class="ps_box addr_poc overlap">
											<input type="text" id="sample6_postcode" name="postcode" class="int addr_only" placeholder="우편번호" readonly value="${user.postcode}">
										</span>
										<input type="button" class="addr_poc_button" id="btn_post" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									</div>
									<span class="ps_box overlap">
										<input type="text" id="sample6_address" name="addr1" class="int addr_only" placeholder="주소" readonly value="${user.addr1}">
									</span>
									<span class="ps_box">
										<input type="text" id="sample6_detailAddress" name="addr2" class="int" placeholder="상세주소" value="${user.addr2}">
										<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
									</span>
								</div>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
							
						</div>
						<div class="btn_double_area">
							<span><button type="button" id="btn_join" class="btn_type">가입하기</button></span>
						</div>
					</div>
				</div>
			</form:form>
			<!--</form>-->
		</section>	
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/daum_post.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// alert('${uri}');
		$('#selmail').change(function() {

			var url = $(this).val();
			if(url !='directVal'){
				$('#email_url').val(url)
							   .prop('readonly',true);
			} else{
				$('#email_url').val('')
							   .removeAttr('readonly')
							   .focus();		
			}
		});
	});
		
	$(function(){
		// 비밀번호가 유효한 값인지 체크해주는 Flag값
		// default값 false
		var pwFlag = false;

		// 유효성체크 여부를 알려주는 배열
		var checkArr = new Array(6).fill(false);
		// 코드의 재사용을 줄이기 위해서 따로 함수로 빼서 이용함
		// printCheckArr(checkArr);

		// 유효성체크 모두 통과 or 불통여부를 알려주는 변수 최종결정권자
		var checkAll = true;
		
		//alert('user: '+ '${user}');
		
		if('${user}' !=''){
			// 회원정보수정 디자인 변경
			//  버튼 텍스트가 수정하기
			$('#btn_join').text('수정하기');
			//  비밀번호, 비밀번호 재설정 제거
			$('.join_row:eq(1)').css('display','none');
			//  id에 readonly효과를 줘서 입력이 불가능 
			// id=#id 를 제거해서 우리가 입력한 유효성체크동작 불가능
			$('.int:eq(0)').attr('readonly', 'true').removeAttr('id');
			// 수정시 회원이메일을 받아오는 input태그를 바꾸는 작업
			$('.email_hidden_box').css('display','block');
			$('.email_box').css('display','none');
			// id칸 색깔바꾸기
			$('.int_id').css('background-color','#ffe6dc');
			$('.id_input').css('background-color','#ffe6dc');
			
			var name = '${user.name}';
			var email = '${user.email}'; 
			var phone = '${user.phone}';
			var postcode = '${user.postcode}';
			var addr1 = '${user.addr1}';
			var addr2 = '${user.addr2}';
			// name작성시 숫자올리도록
			$('#name_cnt').text(name.length);
			ckName(name);
			ckEmail(email);
			ckPhone(phone);
			ckAddr(postcode, addr2);
			checkArr[0] = true;
			checkArr[1] = true;
			ckColorBtn();
			printCheckArr(checkArr);
		}
		
		function ckDesign(code, desc, line, msg){
			if(code == 0 || code == 10){ //통과o
				$('.ps_box:eq('+line+')').css('border','1px solid #dadada');
				$('.join_err_msg:eq('+msg+')').css('visibility','hidden');
				return true;
			} else { // 통과x
				$('.ps_box:eq('+line+')').css('border','1px solid #f24443');
				// 테두리 색생변경
				$('.join_err_msg:eq('+msg+')').css('visibility','visible')
									   .text(desc)
									   .css('color','#f24443');
				// 에러메세지 출력
				return false;
			}
		}
		
		// id 유효성체크
		$('#uid').keyup(function(){
			// 사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
			var id = $(this).val().trim();  // 사용자가 입력한 값
			//validation.js의 checkId로 유효성체크를 실행후 결과를 result에 담음 (code, desc)
			var result = joinValidate.checkId(id);
			console.log('id>>>>> '+result.code+","+result.desc);

			if(result.code == 0){
				checkArr[0] = true;
			} else {
				checkArr[0] = false;
			}
			// printCheckArr(checkArr); 확인용도

			// 유효성체크 결과로 테두리색과 err 메세지를 출력하는 함수 실행
			ckDesign(result.code, result.desc, 0, 0);
		});	

		// 비밀번호 유효성 체크
		$('#upw').keyup(function(){
			// 1. 사용자가 입력한 값 받기
			// .trim() 의 또다른 사용방법
			var pw = $.trim($(this).val());
			var rpw = $('#urpw').val().trim();
			// console.log(pw);
			// console.log(rpw);

			// 2. 유효성 체크하기
			var result = joinValidate.checkPw('', pw, rpw);
			// '' 비밀번호변경과 같이 validation.js를 사용하기위해
			// console.log(result.code+","+result.desc);
			
			// 3. 체크결과에 따라 디자인 하기
			ckDesign(result.code, result.desc, 1, 1);
			
			if(result.code == 0 || result.code == 10 || result.code == 6){
				pwFlag = true;
			} else{
				pwFlag = false;
			}
			if(result.code == 10){
				checkArr[1] = true;
				$('.ps_box:eq(2)').css('border','1px solid #dadada');
				$('.join_err_msg:eq(1)').css('visibility','visible')
				 					    .text('입력한 비밀번호가 일치합니다.')
									    .css('color','#3885ca');
			} else {
				checkArr[1] = false;
			}
			// printCheckArr(checkArr);
		});

		// 비밀번호 재확인 유효성 체크
		$('#urpw').keyup(function(){
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			console.log(result.code+","+result.desc);

			ckDesign(result.code, result.desc, 2, 1);
			
			if(result.code == 10){
				checkArr[1] = true;
				console.log(checkArr[1]);
				$('.ps_box:eq(1)').css('border','1px solid #dadada');
				$('.join_err_msg:eq(1)').css('visibility','visible')
				 					    .text('입력한 비밀번호가 일치합니다.')
									    .css('color','#3885ca');
			} else if(result.code == 6){
				checkArr[1] = false;
				$('.ps_box:eq(1)').css('border','1px solid #dadada');
			} else {
				checkArr[1] = false;
			}
			// printCheckArr(checkArr);
		});

		// 이름 유효성체크
		$('#uname').keyup(function(){
			var name = $(this).val().trim();
			// console.log(name); // 꼭 확인하고 넘어가기
			$('#name_cnt').text(name.length);
			ckName(name);
		});
		
		function ckName(name) {
			var result = joinValidate.checkName(name);
			ckDesign(result.code, result.desc, 3, 2);
			
			if(result.code == 0){
				checkArr[2] = true;
			} else {
				checkArr[2] = false;
			}
			// printCheckArr(checkArr);
		}
		     
		// 이메일 유효성체크
		// email id값을 입력하면 url도 확인해서 필수정보입니다 출력하는 함수
		$('#uemail').keyup(function(){
			var e_id = $(this).val().trim();
			var url = $('#selmail').val().trim();

			if(url == '' || url.length == 0){
				var result = joinValidate.checkEmail(url);
				ckDesign(result.code, result.desc, 6,3);
			} else if(e_id == '' || e_id.length == 0){
				var result = joinValidate.checkEmail(url);
				ckDesign(result.code, result.desc, 5,3);
			} else if(url == 'directVal'){
				url = $('#email_url').val().trim();
				var email = e_id +'@'+ url;
				console.log(email);
				var result = joinValidate.checkEmail(email);
				if(result.code == 0){
					checkArr[3] = true;
				} else {
					checkArr[3] = false;
				}
				// printCheckArr(checkArr);
				ckDesign(result.code, result.desc, 5, 3);
				ckDesign(result.code, result.desc, 6, 3);
			} else {
				$('.ps_box:eq(5)').css('border','1px solid #dadada');
				var email = e_id +'@'+ url;
				console.log(email);
				var result = joinValidate.checkEmail(email);
				if(result.code == 0){
					checkArr[3] = true;
				} else {
					checkArr[3] = false;
				}
				// printCheckArr(checkArr);

				ckDesign(result.code, result.desc, 5, 3);
			}
			
		});
		// email url을 선택하면 직접입력 확인해서 유효성 체크하는 함수
		$('#selmail').change(function(){
			var e_id = $('#uemail').val().trim();
			var url = $(this).val().trim();
			if(url == '' || url.length == 0){
				var result = joinValidate.checkEmail(url);
				ckDesign(result.code, result.desc, 6,3);
			} else if(url == 'directVal'){
				if(e_id == '' || e_id.length == 0){
					var result = joinValidate.checkEmail(e_id);
					ckDesign(result.code, result.desc, 5,3);
				} else {
					$('.ps_box:eq(5)').css('border','1px solid #dadada');
					url = $('#email_url').val().trim();
					var email = e_id +'@'+ url;
					console.log(email);
					var result = joinValidate.checkEmail(email);
					if(result.code == 0){
						checkArr[3] = true;
					} else {
						checkArr[3] = false;
					}
					// printCheckArr(checkArr);

					ckDesign(result.code, result.desc, 6, 3);
				}
			} else {
				$('.ps_box:eq(5)').css('border','1px solid #dadada');
				$('.ps_box:eq(6)').css('border','1px solid #dadada');
				var email = e_id +'@'+ url;
				var result = joinValidate.checkEmail(email);
				if(result.code == 0){
					checkArr[3] = true;
				} else {
					checkArr[3] = false;
				}
				// printCheckArr(checkArr);

				ckDesign(result.code, result.desc, 5, 3);
			}
			
		});
		$('#email_url').keyup(function(){
			var e_id = $('#uemail').val().trim();
			var url = $(this).val().trim();

			if(e_id == '' || e_id.length == 0){
				var result = joinValidate.checkEmail(e_id);
				ckDesign(result.code, result.desc, 5,3);
			} else {
				$('.ps_box:eq(5)').css('border','1px solid #dadada');
				var email = e_id +'@'+ url;
				console.log(email);
				var result = joinValidate.checkEmail(email);
				if(result.code == 0){
					checkArr[3] = true;
				} else {
					checkArr[3] = false;
				}
				// printCheckArr(checkArr);

				ckDesign(result.code, result.desc, 6, 3);
			}
			
		});
		// 회원정보수정의 이메일
		$('#emailAll').keyup(function(){
			var email= $.trim($(this).val());
			ckEmail(email);
		});
		
		function ckEmail(email){
			var result = joinValidate.checkEmail(email);
			ckDesign(result.code, result.desc, 4, 3);
			
			if(result.code == 0){
				checkArr[3] = true;
			} else {
				checkArr[3] = false;
			}
		}

		// 전화번호 유효성체크
		$('#uphone').keyup(function(){
			var phone = $(this).val().trim();
			console.log(phone); 
			ckPhone(phone);
		});
		
		function ckPhone(phone){
			var result = joinValidate.checkPhone(phone);
			ckDesign(result.code, result.desc, 8, 4);
			
			if(result.code == 0){
				checkArr[4] = true;
			} else {
				checkArr[4] = false;
			}
			// printCheckArr(checkArr);
		}
		

		// 주소 이벤트
		// 사용자가 주소를 직접 적는 걸 막고 우편번호찾기 버튼으로 주소찾게 하기위해서
		$('.addr_only').click(function(){
			// 사용자가 우편번호 또는 주소 input을 클릭했을때!
			$('#btn_post').click();
		});
		// 주소를 적지않고 상세주소를 적으러 왔을때 먼저 주소를 적게 하기위해 우편번호찾기 버튼을 누르게함
		$('#sample6_detailAddress').focus(function(){
			var postcode = $('#sample6_postcode').val();
			if(postcode == '' || postcode == 0){
				$('#btn_post').click();
			}
		});
		// 주소 유효성체크
		$('#sample6_detailAddress').keyup(function(){
			var addr2 = $.trim($(this).val()); // 상세주소
			var postcode = $('#sample6_postcode').val(); // 우편번호
			console.log(addr2+','+postcode);
			ckAddr(postcode, addr2);
		});
		
		function ckAddr(postcode, addr2){
			var result = joinValidate.checkAddr(addr2, postcode);
			if(result.code == 3){ // 우편번호&주소x
				checkArr[5] = false;
				ckDesign(result.code, result.desc, 9,5);
			} else if(result.code == 0){ // 성공
				checkArr[5] = true;
				ckDesign(result.code, result.desc, 11,5);
			} else { // 상세주소 통과x한 모든경우
				checkArr[5] = false;
				ckDesign(result.code, result.desc, 11,5);
			}
			printCheckArr(checkArr);
			
		}

		// 버튼 활성화!
		$('.int').keyup(function(){
			ckColorBtn();
		});
		
		function ckColorBtn(){
			var checkAll = true;
			for(var i = 0; i < checkArr.length; i++){
				if(!checkArr[i]){
					checkAll = false;
				}
			}
			if(checkAll){
				$('.btn_type').addClass('btn-agree');
				$('.btn_type').css('cursor','pointer');
			} else{
				$('.btn_type').removeClass('btn-agree');
				$('.btn_type').css('cursor','no-drop');
			}
		}
		
		// 회원가입 버튼 클릭!
		$('#btn_join').click(function(){
			var invalidAll = true;
			for(var i=0; i < checkArr.length; i++){
				if(!checkArr[i]){
					invalidAll = false;
					$('.join_err_msg:eq('+i+')').css('visibility','visible')
								   .css('color','#f24443');
				} 
			}
			printCheckArr(checkArr);
			if(invalidAll){
				FunLoadingBarStart(); // 로딩바생성
				
				var email = $('#emailAll').val();
				
				if(email == '' || email.length == 0){
					var id= $('#uemail').val();
					var url= $('#email_url').val();
					$('#emailAll').val(id+'@'+url);
				}
				
				// alert('회원가입성공');
				
				// submit(): form태그 안에 있는 데이터들을 서버단으로 전송하세요
				// action: 목적지(MemberController '/join')
				// method: 방법( POST 숨겨서)
				$('#frm_member').submit();
				
			} else{
				console.log(invalidAll);
				alert('값을 모두 입력해주세요.');
				
			}
		});

	});
	
	// 개발시 사용: 유효성체크 전체 여부를 출력해주는 함수 (true, false)
	function printCheckArr(checkArr){
		for(var i=0; i < checkArr.length; i++){
			console.log(i+'번지 '+checkArr[i]);	
		}
	}
	// 로딩바 출력
	function FunLoadingBarStart(){
		var loadingBarImage = ''; // 가운데 띄워줄 이미지
		loadingBarImage += "<div id='back'>";
		loadingBarImage += "<div id='loadingBar'>";
		loadingBarImage += "<i class='fas fa-bone loading_img'></i>";
		loadingBarImage += "</div></div>";
		$('body').append(loadingBarImage);
		$('#back').css('display', 'flex');
		$('#loadingImg').show();
	}
	// 로딩바 제거 , 지금은 필요없음 나중에?
	function FunLoadingBarEnd(){
		$('#back, #loadingBar').hide();
		$('#back, #loadingBar').remove();
	}
	
</script>
</html>