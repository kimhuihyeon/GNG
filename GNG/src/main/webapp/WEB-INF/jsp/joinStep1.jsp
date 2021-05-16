<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<section class="step-panels">
		<ol>
			<li class="c01 col-xs-24 col-sm-10 selected">
				<div>AUTHENTICATION</div>
			</li>
			<li class="c02 col-xs-7">
				<div>PRIVACY</div>
			</li>
			<li class="c03 col-xs-7">
				<div>WELCOME</div>
			</li>
		</ol>
	</section>
	<div class="register-verify">
		<div class="guide">
			<section>
				<div class="title">
					<span class="pancoat"></span>
					<strong>GNG 회원가입을 위해 본인인증을 시작합니다.</strong>
				</div>
				<p>휴대폰 인증과 이메일 인증중에 원하는 방법을 선택하여 본인인증을 진행할 수 있습니다.<br>
					본본인인증을 위해 입력하신 개인정보는 회원가입을 위해서 확인하는 것이며,<br>
					수집된 정보는 본인인증 외 어떠한 용도로도 사용되거나 팬콧에 저장되지 않으므로 안심하시기 바랍니다.</p>
			</section>
		</div>
		<div class="verify row">
			<section class="col-md-12">
				<div class="box-shadow">
					<div class="section-head left border">
						<h3 class="title">휴대폰 인증</h3>
					</div>
					<div class="section-body">
						<p>핸드폰 인증은 정보를 저장하지 않습니다. 입력하신 핸드폰으로 전송받은 인증 번호를 입력해서 인증을 받는 방법입니다.</p>
						<p>※현재는 서비스를 지원하지 않습니다.</p>
						
					</div>
				</div>
			</section>
			<section class="col-md-12">
				<div class="box-shadow">
					<div class="section-head left border">
						<h3 class="title">이메일 인증</h3>
					</div>
					<div class="section-body">
						<p>이메일 인증은 따로 정보를 저장하지 않습니다. 해당 이메일로 전송받은 인증 번호를 입력해서 인증을 받는 방법입니다.</p>
						<a href="/GNG/joinStep1/modal_email" class="button" target="modal" data-size="sm" data-label="이메일 인증">
							<span class="button-label">이메일 인증</span>
						</a>
					</div>
				</div>
			</section>
		</div>
	</div>

	<script>

function hp_code(){
/* 	var f = document.frm;
	 var hp = f.hp1.value+f.hp2.value+f.hp3.value; 

	if(hp == '') {
		alert("핸드폰 번호를 입력하세요.");
		return false ;
	}
	$.post("ajax",{mode:"sms_code", hp:hp},function(data){	
		
		if(data.result != 'ok') {
			if(data.result == 'dup') 
				alert("이미 가입된 핸드폰입니다.");
			else if(data.result == 'month')
				alert("탈퇴 후 한달이내에 재가입은 불가능합니다. "+data.val+" 이후에 가입하십시요.");
		} else {
			document.frm.code_chk.value = data.val;
			alert("인증번호를 요청하신 핸드폰으로 발송했습니다.");
		}
	}, "json"); */
} 


/* 
 function email_code(){
	
	var f = document.frm;
	var email = f.email1.value+"@"+f.email2.value;

	if(email == '@') {
		alert("이메일을 입력하세요.");
		return false ;
	} else {
		 	/* document.frm.code_chk.value = data.val 
		 	location.href="./joinStep1/modal_email_auth?email="+email;
		  	/* f.action ="./joinStep1/modal_email_auth?email="+email;
		  	f.submit(); 
			alert("인증번호를 요청하신 이메일로 발송했습니다.");
	
		}

}  

/* function email_code(){

	   var f = document.frm;
	   var email = f.email1.value+"@"+f.email2.value;

	   if(email == '@') {
	      alert("이메일을 입력하세요.");
	      console.log("로그 내용1");
	      
	   }/* else {
		   alert("인증번호를 요청하신 이메일로 발송했습니다.");
/*  		   location.href="/SIRORAGI/joinStep1/modal_email_test";  
	      } */
	      /* alert("이새꺄0"); 
	      else{
	   $.post("./joinStep1/modal_email_auth",{mode:"email_code", email:email},function(){
		   alert("이새꺄");
		   console.log("로그 내용12");

	      if(data.authNum != 'ok') {
	    	  alert("이새꺄2");
	    	  console.log("로그 내용"+authNum);
	      } else {
	         alert("인증번호를 요청하신 이메일로 발송했습니다.");
	      }
	   },"json");
	      }
	   
	} */
	
	function email_code(){
		   var f = document.frm;
		   var email = f.email1.value+"@"+f.email2.value;
		   
		 	  if(email == '@') {
			      alert("이메일을 입력하세요.");
			   }else if(f.email1.value=="" || f.email2.value==""){
			      alert("이메일을 정확히 입력하세요.");
			      console.log("로그 내용1");  
			   }else{
		    	  $.ajax({
		    	        type: "POST",
		    	        url: "./joinStep1/modal_email_auth",
		    	        data: ({mode:"email_code", email:email}),
		    	        //contentType: "text/plain; charset=euc-kr",
		    	        success: function(data) {
		    	        	console.log(data);
		    	        	if(data != 0){
		    	        		alert("이미 가입된 이메일입니다.다른이메일을 입력해주세요");
		    	        	}else{
		    	        		alert("인증번호를 요청하신 이메일로 발송했습니다.");
		    	        	}
		    	        	
		    	        	if(data != null)    {
		    	            	console.log("로그 내용2"+data);
		    	            }
		    	        },
		    	        error: function(e){
		    	         alert('error' + e);
		    	        }
		    	    });
		      }
		   
		}

<%-- 	function member_send(){
		var f = document.frm;
 		//var authNum ='authNum';  
		var user_id = '<%request.getParameter("id");%>';

		if(!f.sing_code.value){
			alert("인증번호를 입력해 주세요");
			f.sing_code.focus();
		}else if(f.sing_code.value !=  authNum){
			alert("인증번호가 맞지 않습니다.");

	      return false ;
	   }
	   $.post("ajax",{mode:"email_code", email:email},function(data){   

	      if(data.result != 'ok') {
	         if(data.result == 'dup') 
	            alert("이미 가입된 이메일입니다.");
	         else if(data.result == 'month')
	            alert("탈퇴 후 한달이내에 재가입은 불가능합니다. "+data.val+" 이후에 가입하십시요.");
	      } else {
	         document.frm.code_chk.value = data.val;
	         alert("인증번호를 요청하신 이메일로 발송했습니다.");
	      }
	   }, "json");
	} */

		}else{
			
			alert("인증번호가 맞습니다.");
			f.action = "./joinStep2";
			f.submit(); 
		}
	 } --%>
	
function member_send(){
	var f = document.frm;
	
	 var email = f.email1.value+"@"+f.email2.value;

	 if(email == '@') {
	      alert("이메일을 입력하세요.");
	   }else if(f.email1.value=="" || f.email2.value==""){
	      alert("이메일을 정확히 입력하세요.");
	      console.log("로그 내용1");  
	   }else{
   		$.ajax({
      	 type: "POST",
       	 url: "./joinStep1/modal_email_auth_success",
      	  //data: ({Id:$("#Id").val(), Pwd:$("#Pwd").val()}),
      	  //contentType: "text/plain; charset=euc-kr",
      	  success: function(data) {
        		 /* alert("auth값받음"+data); */
   	     	 console.log("로그 내용1");
           	 if(data != null)    {
            		if(!f.sing_code.value){
        				alert("인증번호를 입력해 주세요");
        				f.sing_code.focus();
        			}else if(f.sing_code.value !=  data){
        				alert("인증번호가 맞지 않습니다.");

        			}else{
        				//alert("인증번호가 맞습니다.");
        				f.action = "./joinStep2";
        				f.submit(); 
        			}
         	   } else {
          	  	alert("data값없음"+data);
          	  	console.log("로그 내용3");
       	     }
     	   },
     	   error: function(e){
     	    alert('error' + e);
   	     }
   	 });
	}
}

 
/* function email_code(){

	var f = document.frm;
	var email = f.email1.value+"@"+f.email2.value;

	if(email == '@') {
		alert("이메일을 입력하세요.");
		return false ;
	}
	
	$.post("ajax",{mode:"email_code", email:email},function(data){	
		if(data.result != 'ok') {
			if(data.result == 'dup') 
				alert("이미 가입된 이메일입니다.");
			else if(data.result == 'month')
				alert("탈퇴 후 한달이내에 재가입은 불가능합니다. "+data.val+" 이후에 가입하십시요.");
		} else {
			document.frm.code_chk.value = data.val;
			alert("인증번호를 요청하신 이메일로 발송했습니다.");
		}
	}, "json");
}


  */

</script>
</div>

