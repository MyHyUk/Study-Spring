<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div id="wrapper">

		<%@ include file="/WEB-INF/include/include-navi.jspf"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">BOARD</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">WRITE BOARD</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table class="table table-inverse">
								<tbody>
									<tr>
										<th scope="row">글 번호</th>
										<td>${map.BOARD_IDX}</td>
										<th scope="row">조회수</th>
										<td>${map.HIT_CNT}</td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td>${map.CREA_ID }</td>
										<th scope="row">작성시간</th>
										<td>${map.CREA_DTM }</td>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td colspan="3" class="cell">${map.TITLE }</td>
									</tr>
									<tr>
										<td colspan="4" class="cell">${map.CONTENTS }</td>
									</tr>

									<tr>
										<th scope="row">첨부파일</th>
										<td colspan="3">
										<c:forEach var="row" items="${list }">
										<p>
										<input type="hidden" id="FILE_IDX" name="FILE_IDX" value="${row.FILE_IDX }">
										<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a>
										(${row.FILE_SIZE }KB)
										</p>
										</c:forEach>
										</td>
									</tr>


								</tbody>
							</table>

							<a href="#this" class="btn btn-default btn-lg" id="list">목록으로</a>
							<a href="#this" class="btn btn-default btn-lg" id="update">수정하기</a>
							<a href="#this" class="btn btn-default btn-lg" id="reple">답글달기</a>

							<%@ include file="/WEB-INF/include/include-body.jspf"%>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->


	<%@ include file="/WEB-INF/include/include-scripts.jspf"%>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#update").on("click", function(e) { //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});

			$("#reple").on("click", function(e) { //답글달기 버튼
				e.preventDefault();
				fn_openBoardReple();
			});

			$("a[name='file']").on("click", function(e) { //파일 다운
				e.preventDefault();
				fn_downloadFile($(this));
			});

		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/listBoard' />");
			comSubmit.submit();
		}

		function fn_openBoardUpdate() {

			var pw;
			var input = prompt("비밀번호를 입력하시오.:");
			if (input == null || input == "") {
				pw = "비밀번호를 입력하세요.";
			} else {
				pw = input;
			}

			var board_idx = "${map.BOARD_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/updateBoard' />");
			comSubmit.addParam("BOARD_IDX", board_idx);
			comSubmit.addParam("PASSWORD", pw);
			comSubmit.submit();
		}

		function fn_openBoardReple() {
			var board_idx = "${map.BOARD_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/repleBoard' />");
			comSubmit.addParam("BOARD_IDX", board_idx);
			comSubmit.submit();
		}

		function fn_downloadFile(obj) {
			var file_idx = obj.parent().find("#FILE_IDX").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/downloadFile' />");
			alert(file_idx);
			comSubmit.addParam("FILE_IDX", file_idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>