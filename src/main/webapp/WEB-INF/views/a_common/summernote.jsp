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
			// 모달의 summernote 후 사진 모달창 정상 작동 되게 하기, 아래의 2개 true로 추가.
		dialogsInBody: true,			// 대화 상자는 bodySummernote가 아닌 곳에 배치 할 수 있음 
		dialogsFade: true,				// 기본적으로 대화 상자는 페이딩 효과없이 표시되고 숨겨짐. 이걸 켜야됨.
			// --
		// placeholder: ''				//placeholder 설정
		/* toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ], */
		callbacks: {					// 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			}
		}
	});
	
	/**
	* 이미지 파일 업로드
	* 업로드 페이지에 아래의 스크립트 추가 후 folderRoot만 저장될 폴더명으로 바꿔준다.
	* 혹시, datepicker를 사용 하면 common.min.js가 script추가 되어있다면 주석처리.
	*      주석처리하여도 datepicker는 제대로 작동함.
	*	   summernote와 충돌하기떄문.
	*/
	/* function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		folderRoot = "lecture"
		data.append("folderRoot", folderRoot);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile.cm",
			contentType : false,
			processData : false,
			success : function(data) {
					console.log("url확인 : " + data.url);
	            	//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote('insertImage', "${ contextPath }/resources/" + data.url);
				}
			})\;
		} */
</script>

</body>
</html>