<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<c:if test="${fn:length(mapCheck) == 0}">
	<script language="javascript">
		alert("비밀번호가 틀렸습니다.");
		location.href = "${HOME}/board/listBoard";
	</script>
</c:if>

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
							<form id="frm" enctype="multipart/form-data">
								<table class="table table-inverse">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									<caption>게시글 수정</caption>
									<tbody>
										<tr>
											<th scope="row">글 번호</th>
											<td class="cell">
											${map.BOARD_IDX}
											<input type="hidden" id="BOARD_IDX" name="BOARD_IDX" value="${map.BOARD_IDX }">
											</td>
											<th scope="row">조회수</th>
											<td class="cell">${map.HIT_CNT }</td>
										</tr>
										<tr>
											<th scope="row">작성자</th>
											<td class="cell">${map.CREA_ID }</td>
											<th scope="row">작성시간</th>
											<td class="cell">${map.CREA_DTM }</td>
										</tr>
										<tr>
											<th scope="row">제목</th>
											<td class="cell" colspan="3"><input type="text"
												id="TITLE" name="TITLE" class="wdp_90" value="${map.TITLE }" /></td>
										</tr>
										<tr>
											<td colspan="4" class="view_text"><textarea rows="20"
													cols="100" title="내용" id="CONTENTS" name="CONTENTS">${map.CONTENTS }</textarea>
											</td>
										</tr>
										<tr>
											<th scope="row">첨부파일</th>
											<td colspan="3">
												<div id="fileDiv">
													<c:forEach var="row" items="${list }" varStatus="var">
														<p>
															<input type="hidden" id="IDX" name="IDX_${var.index }" value="${row.IDX }"/>
															<a href="#this" id="name_${var.index }" name="name_${var.index }">
															${row.ORIGINAL_FILE_NAME }
															</a>
															<input type="file" id="file_${var.index }" name="file_${var.index }"/>
															(${row.FILE_SIZE }kb)
															<a href="#this" class="btn" id="delete_${var.index }"name="delete_${var.index }">
															삭제
															</a>
														</p>
													</c:forEach>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</form>

							<a href="#this" class="btn btn-primary btn-lg flex-item" id="addFile">파일 추가</a>
							<a href="#this" class="btn btn-default btn-lg" id="list">목록으로</a>
							<a href="#this" class="btn btn-default btn-lg" id="update">저장하기</a>
							<a href="#this" class="btn btn-default btn-lg" id="delete">삭제하기</a>
							
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
		var gfv_count = '${fn:length(list)+1}';
		$(document).ready(function() {
			$("#list").on("click", function(e) {
				e.preventDefault();
				fn_openBoardList();
			});

			$("#update").on("click", function(e) {
				e.preventDefault();
				fn_updateBoard();
			});

			$("#delete").on("click", function(e) {
				e.preventDefault();
				fn_deleteBoard();
			});

			$("#addFile").on("click", function(e) {
				e.preventDefault();
				fn_addFile();
			});
			$("a[name^='delete']").on("click", function(e) {
				e.preventDefault();
				fn_deleteFile($(this));
			});

		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='listBoard' />");
			comSubmit.submit();
		}

		function fn_updateBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='updateBoardConfirm' />");
			comSubmit.submit();
		}

		function fn_deleteBoard() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='deleteBoard' />");
			comSubmit.addParam("BOARD_IDX", $("#BOARD_IDX").val());
			comSubmit.submit();

		}
		function fn_addFile() {
			var str = "<p>" + "<input type='file' id='file_" + (gfv_count)
					+ "' name='file_" + (gfv_count) + "'>"
					+ "<a href='#this' class='btn' id='delete_" + (gfv_count)
					+ "' name='delete_" + (gfv_count) + "'>삭제</a>" + "</p>";
			$("#fileDiv").append(str);
			$("#delete_" + (gfv_count++)).on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}

		function fn_deleteFile(obj) {
			obj.parent().remove();
		}
	</script>
</body>
</html>
