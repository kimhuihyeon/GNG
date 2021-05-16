<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/GNG/css/myinfo.css">
   <div class="account-privacy">
      <form method="post" action="/GNG/myinfo">
      <input type="hidden" name="MEMBER_ID" value="${myinfo.MEMBER_ID }"/>
      <input type="hidden" name="MEMBER_ZIPCODE" value="${myinfo.MEMBER_ZIPCODE }">
      <input type="hidden" name="MEMBER_ADDRESS1" value="${myinfo.MEMBER_ADDRESS1 }">
      <!-- account-nav//end -->
      <section class="input-horizontal list-horizontal section box-shadow">
         <div class="tit-join">
            <h3>회원 정보</h3>
         </div>
         <!-- heading-title//end -->
<table class="person-tb">
<tbody>
   <tr class="id">
      <th class="item-label col-lg-3 col-md-4" style="height: 27px;">
         <label for="mi">
            <span class="cc" style="color: red;">*</span><strong> 아이디</strong>
         </label>
      </th>
      <td class="tb-l pl-6">
            <b>${sessionScope.MEMBER_ID}</b>
      </td>
   </tr>
   <tr class="password">
      <th class="item-label col-lg-3 col-md-4" style="height: 32px;">
         <label for="input-password">
            <span style="color: red;">*</span><strong> 비밀번호 변경</strong>
         </label>
      </th>
      <td class="tb-l pl-6">
         <input type="password" id="input-password" class="pass" value="" name="MEMBER_PASSWORD"  label="비밀번호" required oninput="checkPwd()">
      </td>
   </tr>
   <tr class="password check">
      <th class="item-label col-lg-3 col-md-4" style="height: 34px;">
         <label for="input-password-check">
            <span style="color: red;">*</span><strong> 비밀번호 변경 확인</strong>
         </label>
      </th>
    <td class="tb-l pl-6">
         <input type="password" id="input-password-check" value="" class="pass" name="password_confirm"  label="비밀번호" required oninput="checkPwd()">
           
       <p class="alert alert-positive"></p>
      </td>
   </tr>
   <tr class="name">
      <th class="item-label col-lg-3 col-md-4" style="height: 27px;">
         <label for="input-name">
            <strong style="margin-left: 7px;"> 이름</strong>
         </label>
      </th>
          <td class="tb-l pl-6">
         <b>${sessionScope.MEMBER_NAME }</b>
      </td>
   </tr>
   <tr class="birth input-placeholder">
      <th class="item-label col-lg-3 col-md-4" style="height: 27px;">
         <label for="input-birth01">
            <strong style="margin-left: 7px;">  생년월일</strong>
         </label>
      </th>
          <td class="tb-l pl-6">
         <div class="input-box">
               <b>${myinfo.MEMBER_JUMIN }</b>
         </div>
      </td>
   </tr>
   <tr class="cell-phone">
      <th class="item-label col-lg-3 col-md-4" style="height: 32px;">
         <label for="input-cell-phone01">
            <span style="color: red;">*</span><strong> 핸드폰</strong>
         </label>
      </th>
          <td class="tb-l pl-6">
         <div class="input-box">
            <input type="text" name="MEMBER_PHONE" id="input-cell-phone01" class="MS_input_txt" label="휴대폰" value="${myinfo.MEMBER_PHONE }"  maxlength="11" required="">
         </div>
         
      </td>
   </tr>
   <tr class="mail">
      <th class="item-label col-lg-3 col-md-4" style="height: 32px;">
         <label for="input-mail">
            <span style="color: red;">*</span><strong> 이메일</strong>
         </label>
      </th>
          <td class="tb-l pl-6" style="height: 60px;">
    
            <input type="text" name="MEMBER_EMAIL1"  label="이메일"  class="MS_input_txt" value="${myinfo.MEMBER_EMAIL1}" size="10" maxlength="20">
            <span style="margin-right: 5px;">@</span>
            <input type="text" name="MEMBER_EMAIL2" id="email2"  class="MS_input_txt" label="이메일"  value="${myinfo.MEMBER_EMAIL2}" size="10" maxlength="20">
               <select name="auto_email" class="auto_mail">
                  <option  value="">직접입력
                  </option><option value="naver.com">네이버
                  </option><option value="daum.net">한메일
                  </option><option value="gmail.com">지메일
                  </option><option value="nate.com">네이트
                  </option><option value="yahoo.co.kr">야후
                  </option><option value="chol.com">천리안
                  </option><option value="korea.com">코리아닷컴
               </option></select>
     
         
         <!--<div class="checkbox c02">-->
            <!--<label>-->
               <!--<input type="checkbox" name="ismail" value='o' checked>-->
               <!--<span class="icon icon-checkbox"></span>-->
               <!--<span class="checkbox-label">이벤트, 혜택에 개한 소식 받기</span>-->
            <!--</label>-->
         <!--</div>-->
      </td>
   </tr>
   <tr class="address">
      <th class="item-label col-lg-3 col-md-4">
         <span style="color: red;">*</span><strong> 주소</strong>
      </th>
          <td class="tb-l pl-6">
         <div class="input-box">
         <input type="text" id="sample6_postcode" name="MEMBER_ZIPCODE" disabled="disabled" class="MS_input_txt" label="우편번호" value="${myinfo.MEMBER_ZIPCODE }" readonly="" maxlength="6" required=""  style="margin-bottom: 3px;">
            <span style="margin-bottom: 3px;" class="button button-dimmed" onclick="sample6_execDaumPostcode()">주소 찾기</span>
         </div>
         <input type="text" id="sample6_address"  name="MEMBER_ADDRESS1" label="주소" class="MS_input_txt" disabled="disabled" value="${myinfo.MEMBER_ADDRESS1}" size="35" readonly="" required="">
         <input type="text" id="sample6_address2"  name="MEMBER_ADDRESS2" class="MS_input_txt" value="${myinfo.MEMBER_ADDRESS2}" label="주소" size="35" required="">
      </td>
   </tr>
<!--    <tr class="physical input-placeholder">
      <div class="item-label col-lg-3 col-md-4">
         <label for="input-physical01">
            <strong>* 키/몸무게</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <div class="input-box">
            <div class="item">
               <input type="text" id="input-physical01" class="xx-control" name="height" value="" maxlength="3" placeholder="cm" required="">
            </div>
            <div class="item">
               <input type="text" id="input-physical02" class="xx-control" name="weight" value="" maxlength="3" placeholder="kg" required="">
            </div>
         </div>
      </div>
   </li> -->
   </tbody>
</table>
<!--
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1484723365148/170118.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

<!--
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1495012223804/170517.js"></script>
<script>
$(".auto_mail").change(function() {
   $('#email2').val($(this).val());
});

</script>
         <div class="section-foot">
            <button type="submit" class="aaaa">
               <span class="button-label">수정하기</span>
            </button>
         </div>
      </section>
      </form>

      <!-- input-horizontal//end -->
  
         <div class="tit-join">
            <h3>도움이 필요하세요?</h3>
         </div>
         <!-- heading-title//end -->
         <div class="section-body guide-list">
            <div>
               <strong>회원을 탈퇴(계정 영구 삭제)하고 싶어요</strong>
               <ul>
                  <li>GNG은 회원님의 의지에 따라 언제든 탈퇴가 가능합니다. 아래 내용을 반드시 숙지 후 탈퇴를 진행해 주시기 바랍니다.</li>
                  <li>관리자의 승인 후 탈퇴처리가 완료됩니다.</li>
                  <li>회원 탈퇴시 적립금 및 쿠폰, 회원 등급은 모두 삭제되며, 캐시가 남아있는 경우 탈퇴가 승인되지 않을 수 있습니다.</li>
                  <li>회원탈퇴 후 일주일간 재가입이 제한되며, 재가입시 사용하던 아이디로는 가입이 불가능합니다.</li>
                  <li>고객님의 개인정보는 탈퇴 승인 시점부터 1개월동안 보존되며, 이후 영구 삭제처리됩니다.</li>
                  <li><span>위의 내용을 숙지하였으며, 회원탈퇴를 원하실 경우 <a class="withdraw" target="modal" href="/GNG/memberDelete/form" data-label="회원 탈퇴 신청" data-size="sm">여기를 클릭</a>해주세요</span></li>
               												
               </ul>
            </div>
         </div>
         <!-- guide-list//end -->

   </div>
<script>

$(".account-individual-list tr.brief").click(function(){
   $(this).next().toggle();
});

function checkPwd() {
      
    var inputed = $('#input-password').val();
    var reinputed = $('#input-password-check').val();
    
    if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        $(".alert").removeClass("alert-positive").addClass("alert-negative").html("<span class='icon icon-negative-orange'></span> 비밀번호를 입력해주세요");
    }
    else if (inputed == reinputed) {
        $(".alert").removeClass("alert-negative").addClass("alert-positive").html("<span class='icon icon-positive-skyblue'></span> 동일한 비밀번호입니다");
    } else if (inputed != reinputed) {
        $(".alert").removeClass("alert-positive").addClass("alert-negative").html("<span class='icon icon-negative-orange'></span> 비밀번호가 동일하지 않습니다");
    }
};
</script>
   