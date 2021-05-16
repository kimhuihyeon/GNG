<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/GNG/css/memberDelete.css">
<div class="modal-body"><form name="frm" method="post">

<input type="hidden" name="check_find" value="i">
<div class="modal-search-privacy">
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="area-name active"><a href="#search-id" aria-controls="home" role="tab" data-toggle="tab" onclick="check_find('i')" aria-expanded="true">
		<h5>아이디 찾기</h5></a></li>
		<li role="presentation" class="street-address"><a href="#search-password" aria-controls="profile" role="tab" data-toggle="tab" onclick="check_find('p')" aria-expanded="false">
		<h5>비밀번호 찾기</h5></a></li>
	</ul>
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="search-id">
			<div class="section-body list-horizontal">
<!-- section-body list-horizontal -->
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<strong>이름</strong>
					</div>
					<div class="item-contents hasCol col-xs-24 col-md-18">
						<div class="col-xs-20 col-lg-20 form-inline">
							<input type="text" class="form-control" name="idname" size="28">
						</div>
					</div>
				</div>
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<strong>이메일</strong>
					</div>
					<div class="item-contents hasCol col-xs-24 col-md-18">
						<!-- <div class="col-xs-24 col-sm-18 multy"> -->
						<div class="col-xs-20 col-lg-20 form-inline">
							<input name="idemail1" id="idemail1" class="form-control" size="12" type="text"> @ 
							<input name="idemail2" id="idemail2" class="form-control" size="9" type="text">
							<!-- <span class="col-xs-8"><input type="text" class="xx-control" name="hp2"></span> -->
							<!-- <span class="col-xs-8"><input type="text" class="xx-control" id="pcm-mobile" name="hp1"></span>
							<span class="col-xs-8"><input type="text" class="xx-control" name="hp2"></span>
							<span class="col-xs-8"><input type="text" class="xx-control" name="hp3"></span> -->
						</div>
					</div>
				</div>
				<!-- list-item//end -->
			</div>
		</div>
		<!-- search-id//end -->
		<div role="tabpanel" class="tab-pane" id="search-password">
			<div class="section-body list-horizontal">
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<strong>이름</strong>
					</div>
					<div class="item-contents hasCol col-xs-24 col-md-18">
						<div class="col-xs-20 col-lg-20 form-inline">
							<input type="text" class="form-control" name="pwname" size="28">
						</div>
					</div>
				</div>
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<strong>아이디</strong>
					</div>
					<div class="item-contents hasCol col-xs-24 col-md-18">
						<div class="col-xs-20 col-lg-20 form-inline">
							<input type="text" class="form-control" name="mem_id" size="28">
						</div>
					</div>
				</div>
				<!-- list-item//end -->
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<label for="pcm-mobile"><strong>이메일</strong></label>
					</div>
						<div class="item-contents hasCol col-xs-24 col-md-18">
							<div class="col-xs-20 col-lg-20 form-inline">	
								<input name="pwemail1" id="pwemail1" class="form-control" size="12" type="text"> @ 
								<input name="pwemail2" id="pwemail2" class="form-control" size="9" type="text">
							</div>
						</div>
						<div class="text-primary col-xs-24">
							<p>초기화된 비밀번호를 이메일로 발송해 드립니다.</p>
						</div>
					</div>
				</div>
				<!-- list-item//end -->
			</div>
		</div>
	</div>
	<!-- tab-content//end -->
</div>
<div class="modal-button">
<button type="button" class="oto_bb" onclick="javascript:popup_nice_open()">
	<!-- <a href="javascript:popup_nice_open();" class="oto_aaa"> -->
	<span class="button-label">확인</span>
	</button>
	<button class="btn-close">
		<span class="button-label">취소</span>
	</button>
</div>
</form>
<!-- 본인인증 스크립트 -->
<script>
function check_find(a){
	document.frm.check_find.value = a;
}

function popup_nice_open(){
	var f = document.frm;
	var check_find = f.check_find.value;
	var idname = f.idname.value;
	var pwname = f.pwname.value;
	var mid = f.mem_id.value;
	var idemail = f.idemail1.value+"@"+f.idemail2.value;
	var pwemail = f.pwemail1.value+"@"+f.pwemail2.value;
	console.log("로그 내용1"+pwemail);
	if(check_find == 'i'){//아이디찾기일때
		var mode = "find_id_chk";
		console.log("로그 내용2"+idemail);
		$.ajax({
	        type: "POST",
	        url: "/GNG/login/find",
	        data: ({mode:mode,idemail:idemail,idname:idname,check_find:check_find}),
	        //contentType: "text/plain; charset=euc-kr",
	        success: function(data) {
	        	console.log(data);
	        	if(data != 0){
	        		alert("가입하신 아이디는 "+ data +" 입니다.");
	        	}else{
	        		alert("해당정보로 가입된 아이디가 없습니다.");
	        		
	        		
	        		//window.open("loginForm","_self").close();
	        		//opener.open('about:blank','_self').close();
	        		
	        	}
/* 	        	
	        	if(data != null)    {
	            	/* console.log("로그 내용2"+data); 
	            } */
	        },
	        error: function(e){
	         alert('error' + e);
	        }
	    });		
		self.close();
		close();
	}else if(check_find == 'p'){//패스워드찾기일떄
		console.log("로그 내용2"+pwemail);
		var mode = "find_pw_chk";
		$.ajax({
	        type: "POST",
	        url: "/GNG/login/find",
	        data: ({mode:mode,pwemail:pwemail,mid:mid,pwname:pwname,check_find:check_find}),
	        //contentType: "text/plain; charset=euc-kr",
	        success: function(data) {
	        	if(data != 0){
	        		alert("가입하신 이메일로 비밀번호를 보냈습니다.");
	        	}else{
	        		alert("일치하는 정보가 없습니다.");
	        	}
/* 	        	
	        	if(data != null)    {
	            	/* console.log("로그 내용2"+data); 
	            } */
	        },
	        error: function(e){
	         alert('error' + e);
	        }
	    });		
		self.close();
	}
}

function g_popup_niceid(){
	window.open('', 'popup', 'width=500, height=461, toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top=0,left=0');
	document.frm_main.action = "https://check.namecheck.co.kr/checkplus_new_model4/checkplus.cb";
	document.frm_main.target = "popup";
	document.frm_main.submit();
}
</script>

<!-- 본인인증 폼 -->
<form method="post" name="frm_main">
	<input type="hidden" name="m" value="checkplusSerivce"><!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="AgAFRzMwNzKAP/czugK5kt4kdwRnvdhzfiiA/nfTLwLixOBbKZuKipkiil7zKj2i4x96LW8q8XsFYoWxaOQZwuFufJpnjKjzXCBDLlAY8CJfGAtZZ1OL1aXqXL1U8VSwmHpkmVPD0xyk+dSH7GWoQOqOTtNKsMI4241EMnidZRleNkDquB4TUaWRKx0ADSam+ucN0juq2ZGm9/HMy75R5v6NlwNdl4clwyrNT+ALRN374tYT/Lpgunn6HpcqSicfD3KXwTJOzaiguxgipRLVAYABlc8zr/ACpksJobTdej4Q8lLg1XHES2d5zjBCY5xccS9KnOspkS0UiyPUahMc9KZZflEjgQYow4zmok1K0GD13FCZzAGrulDTZvCtFNV+1MSGF+7TibjIbO/SF4Y9TzlHyix5X5UB31iPGf/INEE7aPjHDmoSkA=="><!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="param_r1">
	<input type="hidden" name="param_r2">
	<input type="hidden" name="param_r3">
</form>

<!-- 아이핀 스크립트 -->

<script type="text/javascript">
window.name ="Parent_window"; // 아이핀 모듈에서 참조하기 때문에 이렇게 함
function popup_ipin(){
	window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_ipin.target = "popupIPIN2";
	document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
	document.form_ipin.submit();
}
</script>

<!-- 아이핀 폼 -->
<form name="form_ipin" method="post">
	<input type="hidden" name="m" value="pubmain"><!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="enc_data" value=""><!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다. 해당 파라미터는 추가하실 수 없습니다. -->
    <input type="hidden" name="param_r1" value="">
    <input type="hidden" name="param_r2">
    <input type="hidden" name="param_r3">
</form>

<!-- 가상주민번호 서비스 팝업 페이지에서 사용자가 인증을 받으면 암호화된 사용자 정보는 해당 팝업창으로 받게됩니다.
	 따라서 부모 페이지로 이동하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="vnoform" method="post">
	<input type="hidden" name="enc_data"><!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
	<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다. 해당 파라미터는 추가하실 수 없습니다. -->
	<input type="hidden" name="param_r1" value="">
	<input type="hidden" name="param_r2" value="">
	<input type="hidden" name="param_r3" value="findchk">
</form></div>
<div class="modal-foot">
		</div>