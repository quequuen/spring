<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/authorPop.css">
</head>
<body>
	<div class="subject_name_warp">
		<span>�۰� ����</span>
	</div>
	<div class="content_wrap">
		<!-- �Խù� ǥ ���� -->
		<div class="author_table_wrap">
			<!-- �Խù� O -->
			<c:if test="${listCheck != 'empty'}">
				<div class="table_exist">
					<table class="author_table">
						<thead>
							<tr>
								<td class="th_column_1">�۰� ��ȣ</td>
								<td class="th_column_2">�۰� �̸�</td>
								<td class="th_column_3">�۰� ����</td>
							</tr>
						</thead>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.authorId}"></c:out></td>
								<td>
								<a class="move" href='<c:out value="${list.authorId}"/>' data-name='<c:out value="${list.authorName}"/>'>
									<c:out value="${list.authorName}"></c:out>
								</a>
								</td>
								<td><c:out value="${list.nationName}"></c:out></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
			<!-- �Խù� x -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">��ϵ� �۰��� �����ϴ�.</div>
			</c:if>

			<!-- �˻� ���� -->
			<div class="search_wrap">
				<form id="searchForm" action="/admin/authorPop" method="get">
					<div class="search_input">
						<input type="text" name="keyword"
							value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
						<input type="hidden" name="pageNum"
							value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
						<button class='btn search_btn'>�� ��</button>
					</div>
				</form>
			</div>

			<!-- ������ �̵� �������̽� ���� -->
			<div class="pageMaker_wrap">

				<ul class="pageMaker">

					<!-- ���� ��ư -->
					<c:if test="${pageMaker.prev}">
						<li class="pageMaker_btn prev"><a
							href="${pageMaker.pageStart - 1}">����</a></li>
					</c:if>

					<!-- ������ ��ȣ -->
					<c:forEach begin="${pageMaker.pageStart}"
						end="${pageMaker.pageEnd}" var="num">
						<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<!-- ���� ��ư -->
					<c:if test="${pageMaker.next}">
						<li class="pageMaker_btn next"><a
							href="${pageMaker.pageEnd + 1 }">����</a></li>
					</c:if>

				</ul>

			</div>

			<form id="moveForm" action="/admin/authorPop" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>


		</div>

	</div>
	<script>

		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');
		
		/* �۰� �˻� ��ư ���� */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
			
			/* �˻� Ű���� ��ȿ�� �˻� */
			if(!searchForm.find("input[name='keyword']").val()){
				alert("Ű���带 �Է��Ͻʽÿ�");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});
		
		
		/* ������ �̵� ��ư */
		$(".pageMaker_btn a").on("click", function(e){
			
			e.preventDefault();
			
			console.log($(this).attr("href"));
			
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			moveForm.submit();
			
		});	
		
		/* �۰� ���� �� �˾�â �ݱ� */
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			let authorId = $(this).attr("href");
			let authorName= $(this).data("name");
			$(opener.document).find("#authorId_input").val(authorId);
			$(opener.document).find("#authorName_input").val(authorName);
			
			window.close();

		});	

	
	</script>
</body>
</html>