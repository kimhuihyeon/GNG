<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script type="text/javascript">
	function joinValidation(frm) {
		if (frm.NOTIFY_TITLE.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} else if (frm.NOTIFY_CONTENT.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		}
		alert("수정되었습니다.")
	}

	$('.searchOption').val($('.searchOptionVal').val());

	var onList = function() {
		location.href = 'adminNotifyList';
	};
</script>
</head>
<!-- 메뉴 시작 -->
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">게시글 수정</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">공지사항 수정 페이지입니다.</div>
		<div class="panel-body">
			<form:form id="adminNotifyDetail" action="adminNotifyModify"
				method="post" name="joinform" onsubmit="return joinValidation(this)"
				enctype="multipart/form-data">
				<input type="hidden" id="NOTIFY_NUMBER" name="NOTIFY_NUMBER"
					value="${notifyDetail.NOTIFY_NUMBER}">
				<div class="form-group">
					<label>제목</label> <input type="text" class="form-control"
						id="NOTIFY_TITLE" name="NOTIFY_TITLE"
						value="${notifyDetail.NOTIFY_TITLE}" style="width: 500px;" />
				</div>
				<div class="form-group">
					<label>내용</label> <input type="text" class="form-control"
						id="NOTIFY_CONTENT" name="NOTIFY_CONTENT"
						value="${notifyDetail.NOTIFY_CONTENT}" style="width: 500px;" /> <br />
					기존 이미지 : <img
						src="/MODA/file/noticeFile/NOTIFY_${notifyDetail.NOTIFY_NUMBER}.jpg"
						width="60" height="60" alt=""
						onerror="this.src='/MODA/file/noimg_130.gif'" /> <br />
					<br /> <input type="file" id="NOTIFY_IMAGE" name="NOTIFY_IMAGE"
						style="width: initial;" /> <input type="hidden"
						name="ORIGINAL_NOTIFY" value="${notifyDetail.NOTIFY_IMAGE }">
				</div>
				<div class="form-group">
					<label>등록일자</label>
					<fmt:formatDate value="${notifyDetail.NOTIFY_REGDATE}"
						pattern="YYYY.MM.dd" />
				</div>
				<button type="submit" class="btn btn-success">수정</button>
				<button type="reset" class="btn btn-success">초기화</button>
				<button type="button" onclick="onList()" id="faqList"
					class="btn btn-success">목록</button>
			</form:form>
		</div>
	</div>
</div>
