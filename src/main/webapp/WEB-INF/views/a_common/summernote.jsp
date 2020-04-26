<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="${contextPath}/resources/js/plugins/summernote/summernote-ko-KR.js"></script>
<style>
	.note-toolbar{
		padding: 5px !important;
    	background-color: rgb(247, 239, 193) !important; 
	}
	.note-editable{
		background-color: rgb(255, 255, 224) !important;
	}
	.note-btn{
		background-color: rgb(255, 255, 224) !important;
	}
</style>
</head>
<body>
	<!-- <textarea id="summernote" style="resize: none"></textarea> -->
<script>
	$('#summernote').summernote({
		height: 400,                 	// 에디터 높이
		minHeight: null,             	// 최소 높이  
		maxHeight: null,             	// 최대 높이
		focus: true,                 	// 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		// placeholder: ''				//placeholder 설정
	});
</script>

</body>
</html>