function confirmBtn(action, message) {
        if (confirm(message)) {
            window.location.href = action;
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        function updateInquiry() {
            const titleInput = document.querySelector('input[name="title"]').value;
            const contentInput = document.querySelector('textarea[name="content"]').value;

            if (!titleInput || !contentInput) {
                console.error("One or more input elements are null.");
                return;
            }

            const category = document.getElementById('category').value; // 서버에서 받은 카테고리 값 사용
            const seq = document.getElementById('seq').value; // 서버에서 받은 seq 값 사용
            const url = "updateInquiry.do?title=" + titleInput + "&category=" + category + "&content=" + contentInput + "&seq=" + seq;

            console.log(url); // URL 값을 출력하여 확인
            confirmBtn(url, '수정하시겠습니까?');
        }

        // "글수정" 버튼 클릭 이벤트 핸들러 연결
        const buttons = document.querySelectorAll('.qnaBoardBtn');
        buttons.forEach(function(button) {
            if (button.textContent.includes("글수정")) {
                button.addEventListener('click', updateInquiry);
            }
        });
    });
