<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>게시판 글쓰기</title>

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
						
							<form id="frm" name="frm" enctype="multipart/form-data">
								<table  class="table table-inverse">
									<tbody>
										<tr>
											<th scope="row">글제목</th>
											<td><input type="text" name="TITLE" /></td>
										</tr>
										<tr>
											<th scope="row">작성자</th>
											<td><input type="text" name="NAME" /></td>
										</tr>
										<tr>
											<th scope="row">비밀번호</th>
											<td><input type="password" name="PASSWORD" /></td>
										</tr>
										<tr>
											<th scope="row">글내용</th>
											<td><textarea name="CONTENTS" rows="3" cols="30"></textarea></td>
										</tr>
										<tr>
											<th scope="row">파일첨부</th>
											<td>
												<div id="fileDiv">
													<p><input  style="float:left" type="file" id="file" name="file_0">
													<a href="#this" class="btn btn-primary btn-sm" id="delete" name="delete">삭제</a>
													</p>
												</div>
											</td>
										</tr>
									</tbody>
								</table>


								<br /> <br />
								<a href="#this" class="btn btn-primary btn-lg flex-item" id="addFile">파일추가</a>
								<a href="#this" class="btn btn-default btn-lg" id="write">글쓰기</a>
								<a href="#this" class="btn btn-default btn-lg" id="list">목록</a>

							</form>
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
		$(document)
				.ready(
						function() {
							$("#list").on("click", function(e) {
								e.preventDefault();
								fn_openBoardList();
							});

							$("#write").on("click", function(e) {
								e.preventDefault();
								fn_insertBoard();
							});

							$("#addFile").on("click", function(e) {
								e.preventDefault();
								fn_addFile();
							});

							$("a[name='delete']").on("click", function(e) {
								e.preventDefault();
								fn_deleteFile($(this));
							});

							function fn_openBoardList() {
								var comSubmit = new ComSubmit();
								comSubmit.setUrl("<c:url value='listBoard' />");
								comSubmit.submit();
							}

							function fn_insertBoard() {
								var comSubmit = new ComSubmit("frm");
								comSubmit.setUrl("<c:url value='insertBoard' />");
								comSubmit.submit();
							}
						
							function fn_addFile() {
								var str = "<br/><p><input style='float:left'  type='file' name='file_"
										+ (gfv_count++)
										+ "'><a href='#this' class='btn btn-primary btn-sm' name='delete'>삭제</a></p>";
								$("#fileDiv").append(str);
								$("a[name='delete']").on("click", function(e) { //삭제 버튼
									e.preventDefault();
									fn_deleteFile($(this));
								});
							}

							function fn_deleteFile(obj) { 
								obj.parent().remove();
							}

						});
	</script>
</body>
</html>