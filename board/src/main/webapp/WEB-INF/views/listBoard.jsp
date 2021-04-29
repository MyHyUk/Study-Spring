<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>게시글 목록</title>
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
						<div class="panel-heading">BOARD LIST</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%" id="boardList" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline">
								<thead>
									<tr>
										<th>글번호</th>
										<th>글제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(list) > 0}">
											<c:forEach items="${list }" var="row">
												<tr>
													<th scope="row">${row.BOARD_IDX }</th>
													<td>
													<a href="#" name="TITLE">${row.TITLE }</a>
													<input type="hidden" id="BOARD_IDX" name="BOARD_IDX" value="${row.BOARD_IDX }">
													</td>
													<td>${row.CREA_ID}</td>
													<td>${row.CREA_DTM }</td>
													<td>${row.HIT_CNT }</td>
												</tr>

											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5">조회된 결과가 없음</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<a href="#this" class="btn" id="write">글쓰기</a>

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
	


	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script type="text/javascript">
    $(document).ready(function() {
        $('#boardList').DataTable({
        	 "lengthMenu": [ [3, 5, 10, -1], [3, 5, 10, 'All']],
        	 responsive: true
        });
    });

    
    $(document).ready(function(){
            $("#write").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openBoardWrite();
            });
             
            $("a[name='TITLE']").on("click", function(e){ //제목
                e.preventDefault();
                fn_openBoardDetail($(this));
                
            });
        });
         
         
        function fn_openBoardWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/writeBoard' />");
            comSubmit.submit();
        }
         
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/infoBoard' />");
            comSubmit.addParam("BOARD_IDX", obj.parent().find("#BOARD_IDX").val());
            comSubmit.submit();
        }
        
        
    </script>
    



</body>
</html>