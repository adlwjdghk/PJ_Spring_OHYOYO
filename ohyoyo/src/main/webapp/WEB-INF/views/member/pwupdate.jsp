<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>ohyoyo 오요요</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/e2a7455480.js" crossorigin="anonymous"></script>
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
		font-family: 'Nanum Gothic Coding', monospace;
		text-align: center;
	}
	.pwupdate_msg{
		width: 100%;
		text-align: center;
		margin-bottom: 15px;
	}
	.pwupdate_msg > h2{
		display: inline;
		font-size: 13px;
		border-bottom: 1px solid #dadada;
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
	.int_pass{
		padding-right: 40px;
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
	.overlap{
		border-bottom: 1px solid transparent;
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
	.highlight{
		color: #f24443;			
	}

</style>
</head>
<body>
	<div class="wrap">
		<header>
			<div class="header">
				<h1 class="ohyoyo_join"><a href="#" class="o_join">
					Edit
				</a></h1>
			</div>
			<div class="pwupdate_msg">
				<h2>주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</h2>
			</div>
		</header>
		<section>
			<!-- <form name="frm_member" action="/${path}/member/pwupdate" method="POST"> -->
			<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
				<div class="contaioner">
					<div class="join_content">
						<div class="row_group">
							<div class="join_row">
								<h3 class="join_title">
									<label for="upw">현재 비밀번호<span class="highlight">*</span></label>
								</h3>
								<span class="ps_box int_pass">
									<input type="password" id="nowpw" class="int" placeholder="비밀번호 입력">
									<span class="step_url"><span class="pw_lock"></span></span>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="upw"> 수정할 비밀번호<span class="highlight">*</span></label>
								</h3>
								<span class="ps_box int_pass ps_focus overlap">
									<input type="password" id="upw" name="pw" class="int" placeholder="수정할 비밀번호 입력 (8자이상)" readonly>
									<span class="step_url"><span class="pw_lock"></span></span>
								</span>
								<span class="ps_box int_pass ps_focus">
									<input type="password" id="urpw" name="urpw" class="int" placeholder="비밀번호 재확인" readonly>
									<span class="step_url"><span class="repw_lock"></span></span>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
						</div>						
						<div class="btn_double_area">
							<span><button type="button" id="btn_join" class="btn_type">비밀번호 수정</button></span>
						</div>
					</div>
				</div>
			</form:form>
		</section>	
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	// $(document).ready(function(){ 이랑 같음
	$(function(){
		$('.join_err_msg:eq(1)').css('visibility','visible')
		  						.text('현재 비밀번호를 먼저 적어주세요.')
		  						.css('color','#f24443');
		
		// 비밀번호가 유효한지 체크하는 값
		var pwFlag = false;
		// 유효성체크여부를 통과했는지 알려주는 값
		var checkArr = new Array(2).fill(false);
		// 유효성체크 모두 통과 or 불통여부를 알려주는 변수 최종결정권자
		var checkAll = true;
		
		// 현재비밀번호 유효성체크
		$('#nowpw').keyup(function(){ 
			var nowpw = $(this).val();
			// console.log("입력값: "+nowpw);
			var result = joinValidate.checkNowpw(nowpw);
			// console.log("code: "+result.code);
			
			ckDesign(result.code, result.desc, 0, 0);
			
			if(result.code == 100){
				checkArr[0] = true;
				$('.int:eq(0)').attr('readonly','true');
				$('.int:eq(1)').removeAttr('readonly');
				$('.int:eq(2)').removeAttr('readonly');	 
			} else {
				checkArr[0] = false;
			}
			printCheckArr(checkArr);
		});
		
		// 비밀번호 유효성 체크
		$('#upw').keyup(function(){
			var nowpw = $.trim($('#nowpw').val());
			var pw = $.trim($(this).val());
			var rpw = $('#urpw').val().trim();

			var result = joinValidate.checkPw(nowpw, pw, rpw);
			
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
			printCheckArr(checkArr);
		});

		// 비밀번호 재확인 유효성 체크
		$('#urpw').keyup(function(){
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			
			ckDesign(result.code, result.desc, 2, 1);
			
			if(result.code == 10){
				checkArr[1] = true;
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
			printCheckArr(checkArr);
		});
		
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
				$('.btn_type').addClass('btn_agree');
				$('.btn_type').css('cursor','pointer');
			} else{
				$('.btn_type').removeClass('btn_agree');
				$('.btn_type').css('cursor','no-drop');
			}
		}
		
		// 수정하기 버튼 클릭!
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
				$('#frm_member').submit();
			} else{
				console.log(invalidAll);
				alert('값을 모두 입력해주세요.');
				
			}
		});
	});
	
	function ckDesign(code, desc, line, msg){
		if(code == 0 || code == 10 || code == 100){ //통과o
			$('.ps_box:eq('+line+')').css('border','1px solid #dadada');
			$('.join_err_msg:eq('+msg+')').css('visibility','visible')
			  							  .text(desc)
	         							  .css('color','#3885ca');
			return true;
		} else { // 통과x
			$('.ps_box:eq('+line+')').css('border','1px solid #f24443');
			// 테두리 색상변경
			$('.join_err_msg:eq('+msg+')').css('visibility','visible')
								   .text(desc)
								   .css('color','#f24443');
			// 에러메세지 출력
			return false;
		}
	}
	
	// 개발시 사용: 유효성체크 전체 여부를 출력해주는 함수 (true, false)
	function printCheckArr(checkArr){
		for(var i=0; i < checkArr.length; i++){
			console.log(i+'번지 '+checkArr[i]);	
		}
	}
</script>
</html>