<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>게시판 답글</title>

</head>

<body>
	<div class="wrapper">
		<form id="frm">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>답글쓰기</caption>

			<div class="wrapper">
				<table border="1" align="center" class="table">
					<input type="hidden" id="BOARD_IDX" name="BOARD_IDX" value="${map.BOARD_IDX}">
					<tr class="row header">
						<td class="cell">글제목</td>
						<td class="cell"><input type="text" name="TITLE" /></td>
					</tr>
					<tr class="row header">
						<td class="cell">작성자</td>
						<td class="cell"><input type="text" name="NAME" /></td>
					</tr>
					<tr class="row header">
						<td class="cell">비밀번호</td>
						<td class="cell"><input type="password" name="PASSWORD" /></td>
					</tr>
					<tr class="row header">
						<td class="cell">글내용</td>
						<td class="cell"><textarea name="CONTENTS" rows="3" cols="30"></textarea></td>
					</tr>
				</table>
				
				
				<a href="#this" class="btn" id="reple">답글쓰기</a>
				<a href="#this" class="btn" id="list">목록</a>
		</form>
		<%@ include file="/WEB-INF/include/include-body.jspf"%>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#list").on("click", function(e) {
					e.preventDefault();
					fn_openBoardList();
				});

				$("#reple").on("click", function(e) {
					e.preventDefault();
					fn_repleBoard();
				});

				function fn_openBoardList() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='listBoard' />");
					comSubmit.submit();
				}

				function fn_repleBoard() {
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='repleBoardConfirm' />");
					comSubmit.submit();
				}

			});
		</script>




	</div>
</body>
</html>