document.addEventListener('DOMContentLoaded', function() {
    const idInput = document.getElementById('id');
    const passwordInput = document.getElementById('pw');
    const passwordConfirmInput = document.getElementById('repw');
    const nameInput = document.getElementById('name');
    const emailInput = document.getElementById('email');
    const phoneInput = document.getElementById('phone');
    const ageCheckbox = document.getElementById('age');
    const signupButton = document.getElementById('submit');
    const idCheckButton = document.getElementById('idCheckButton');
    let isIdChecked = false;

    const idError = document.getElementById('id_check');
    const passwordError = document.getElementById('pw_check');
    const passwordConfirmError = document.getElementById('repw_check');
    const usernameError = document.getElementById('name_check');
    const emailError = document.getElementById('email_check');
    const phoneError = document.getElementById('phone_check');

    // 필드값 잘못 입력 시 오류 메시지 및 빨간색 테두리로 변경됨
    function showError(input, errorElement, message) {
        input.style.border = '1px solid red';
        errorElement.textContent = message;
        errorElement.style.color = 'red';
        checkFormValidity();
    }

    function clearError(input, errorElement) {
        input.style.border = '';
        errorElement.textContent = '';
        checkFormValidity();
    }

 // 아이디 중복확인 함수
    function checkId() {
        let memberId = idInput.value.trim();
        $('.checkIdSpan').remove(); 

        // 아이디를 입력하지 않았다면
        if (memberId === "") {
            showError(idInput, idError, '아이디를 입력해주세요.');
            idInput.focus();
            return;
        }

        $.ajax({
            url: '/member/checkId/' + memberId,
            type: 'GET',
            success: function(data) {
                if (data === true) { // 사용 가능한 아이디
                    clearError(idInput, idError);
                    idError.textContent = '사용 가능한 아이디입니다.';
                    idError.style.color = 'green';
                    isIdChecked = true;
                } else { // 이미 존재하는 아이디
                    showError(idInput, idError, '이미 존재하는 아이디입니다.');
                    isIdChecked = false;
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다.");
            }
        });
    }


    // 회원가입 폼 제출 제한하는 함수
    function submitForm() {
        if (!isIdChecked) {
            alert("아이디 중복체크를 해주세요.");
            idInput.focus();
        } else {
            const memberData = {
                id: idInput.value,
                pw: passwordInput.value,
                email: emailInput.value,
                tel: phoneInput.value,
                name: nameInput.value
            };

            $.ajax({
                url: '/member/register',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(memberData),
                success: function(response) {
                    alert(response);
                    // 성공 시 추가 작업 (예: 페이지 리다이렉션)
                    window.location.href = '/login'; // 로그인 페이지로 리다이렉션
                },
                error: function() {
                    alert('회원가입 실패');
                }
            });
        }
    }

    // 각 입력 필드의 유효성 검사
    idInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            showError(this, idError, '아이디를 입력해주세요.');
        } else if (!/^[a-zA-Z0-9]{4,8}$/.test(this.value)) {
            showError(this, idError, '영문, 숫자 포함 4~8자를 입력해주세요.');
        } else {
            clearError(this, idError);
        }
    });

    // 아이디 중복확인 버튼 클릭 이벤트
    idCheckButton.addEventListener('click', checkId);

    // 비밀번호 오류
    passwordInput.addEventListener('blur', function() {
        if (this.value === '') {
            showError(this, passwordError, '비밀번호를 입력해주세요.');
        } else if (!/^[a-zA-Z0-9]{8,12}$/.test(this.value)) {
            showError(this, passwordError, '영문, 숫자 포함 8~12자를 입력해주세요.');
        } else {
            clearError(this, passwordError);
        }
        checkPasswordMatch();
    });

    // 비밀번호 확인 오류
    passwordConfirmInput.addEventListener('blur', checkPasswordMatch);
    
    function checkPasswordMatch() {
        if (passwordInput.value !== passwordConfirmInput.value) {
            showError(passwordConfirmInput, passwordConfirmError, '비밀번호가 일치하지 않습니다.');
        } else {
            clearError(passwordConfirmInput, passwordConfirmError);
        }
    }

    // 이름 오류
    nameInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            showError(this, usernameError, '이름을 입력해주세요.');
        } else {
            clearError(this, usernameError);
        }
    });

    // 이메일 오류
    emailInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            showError(this, emailError, '이메일을 입력해주세요.');
        } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.value)) {
            showError(this, emailError, '@을 포함하여 다시 작성해주세요.');
        } else {
            clearError(this, emailError);
        }
    });

    // 전화번호 오류 메시지
    phoneInput.addEventListener('blur', function() {
        if (this.value.trim() === '') {
            showError(this, phoneError, '전화번호를 입력해주세요.');
        } else if (!/^\d{3}-\d{3,4}-\d{4}$/.test(this.value)) {
            showError(this, phoneError, '-를 포함한 11자리 숫자를 입력해주세요.');
        } else {
            clearError(this, phoneError);
        }
    });

   // 폼 유효성 체크 및 버튼 활성화/비활성화
   function checkFormValidity() {
       const isValid =
           emailInput.value.trim() !== '' &&
           nameInput.value.trim() !== '' &&
           idInput.value.trim() !== '' &&
           passwordInput.value.length >= 8 &&
           passwordInput.value === passwordConfirmInput.value &&
           /^[a-zA-Z0-9]{4,8}$/.test(idInput.value) &&
           /^\d{3}-\d{3,4}-\d{4}$/.test(phoneInput.value) &&
           ageCheckbox.checked &&
           !emailError.textContent &&
           !usernameError.textContent &&
           !passwordError.textContent &&
           !passwordConfirmError.textContent &&
           !idError.textContent &&
           !phoneError.textContent &&
           isIdChecked;  // 아이디 중복 확인 상태 추가

       signupButton.disabled = !isValid;
   }

   ageCheckbox.addEventListener('change', checkFormValidity);

   // 초기 상태 체크
   checkFormValidity();

   // 가입하기 버튼 클릭 이벤트
   signupButton.addEventListener('click', function(event) {
       event.preventDefault(); // 기본 제출 방지
       submitForm();
   });
});
