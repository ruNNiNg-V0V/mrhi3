document.addEventListener('DOMContentLoaded', function() {
	function updateInquiry() {
		const title = document.querySelector('input[name="title"]').value;
		const content = document.querySelector('textarea[name="content"]').value;
		const category = document.getElementById('category').value; // 서버에서 받은 카테고리 값 사용
		const seq = document.getElementById('seq').value; // 서버에서 받은 seq 값 사용
		
		if (!title || !content) {
			console.error("One or more input elements are null.");
			return;
		}
		
		const url = "updateInquiry.do?title=" + title + "&category=" + category + "&content=" + content + "&seq=" + seq;
		
		console.log('inquiry.js: '+url); // URL 값을 출력하여 확인
		confirmBtn('수정하시겠습니까?', url);
	}
	
	// "글수정" 버튼 클릭 이벤트 핸들러 연결
	const buttons = document.querySelectorAll('.qnaBoardBtn');
	buttons.forEach(function(button) {
		if (button.textContent.includes("글수정")) {
			button.addEventListener('click', updateInquiry);
		}
	});
});

function confirmBtn(message, action) {
    showCustomConfirm(message, false, function(result) {
        if (result) {
            console.log('true console');
            window.location.href = action;
        } else {
            console.log('false canceled');
        }
    });
}
