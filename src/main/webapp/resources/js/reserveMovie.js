var selectedTime = null;
var selectedSeat = null;

function showTab(tabName, event) {
    // 예매확인 탭 선택 시 검증
    if(tabName === 'confirm') {
        if(!selectedTime || !selectedSeat) {
            alert('시간과 좌석을 먼저 선택해주세요.');
            return false;
        }
        
        const movieTitle = document.querySelector('.movie-header h2').textContent.trim();
        const posterContainer = document.querySelector('.movie-info');
        if (posterContainer) {
            posterContainer.innerHTML = '';
            getThePoster(movieTitle);
        }
    }
    
    // 기존 탭 전환 로직
    var tabContents = document.querySelectorAll('.tab-content');
    var tabs = document.querySelectorAll('.tab');
    
    tabContents.forEach(content => content.classList.remove('active'));
    tabs.forEach(tab => tab.classList.remove('active'));
    
    document.getElementById(tabName + 'Tab').classList.add('active');
    
    if(event) {
        event.target.classList.add('active');
    } else {
        document.getElementById('selectTabBtn').classList.add('active');
    }
}

// 예매확인 탭 버튼 클릭 이벤트 수정
document.getElementById('confirmTabBtn').addEventListener('click', function(event) {
    if(!selectedTime || !selectedSeat) {
        event.preventDefault();
        alert('시간과 좌석을 먼저 선택해주세요.');
        return false;
    }
});



function enableSeatSelection() {
    const seatInputs = document.querySelectorAll('input[name="seat"]');
    seatInputs.forEach((seat) => {
        seat.disabled = false;
    });
}

function selectSeat(seatNum, event) {
    event = event || window.event;
    
    if (!selectedTime) {
        alert('상영시간을 먼저 선택해주세요.');
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }
        return false;
    }
    
    // disabled 상태인 좌석 클릭 시에도 알림 표시
    var seatElement = document.querySelector(`input[name="seat"][value="${seatNum}"]`);
    if (!seatElement || seatElement.disabled)  {
    	return false;
    }
    
    // 이전에 선택된 모든 좌석의 선택 해제
    document.querySelectorAll('.seat').forEach(seat => {
        seat.classList.remove('selected');
        seat.querySelector('input').checked = false;
    });
    
    // 현재 좌석 선택
    seatElement.checked = true;
    seatElement.parentElement.classList.add('selected');
    selectedSeat = seatNum;
    
    // 선택된 좌석 정보 업데이트
    document.getElementById('selectedSeat').value = seatNum;
    document.getElementById('selectedCount').textContent = '1';
    
    // 예매확인 탭 업데이트
    const row = seatNum.charAt(0);
    const number = seatNum.slice(1);
    document.getElementById('selectedSeatDisplay').textContent = seatNum;
    document.getElementById('ticketNumber').textContent = `${window.ticketPrefix}${seatNum}`;
    
    return false;
}


function checkOnlyOne(element) {
    const checkboxes = document.getElementsByName("screenTime");
    checkboxes.forEach((cb) => {
        cb.checked = false;
    });
    element.checked = true;
    
    // 시간 선택 저장
selectedTime = element.value;
    
    // 상영 날짜와 시간으로 prefix 생성
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    
    // 상영관 번호 가져오기
    const rnum = document.querySelector('.movie-header h3').textContent.replace('관', '');
    
    // 예매번호 prefix 생성 및 업데이트
    window.ticketPrefix = `${year}${month}${day}${selectedTime.replace(':', '')}${rnum}`;
    
    // 예매확인 탭 업데이트
    document.getElementById('ticketNumber').textContent = window.ticketPrefix;
    document.getElementById('selectedTimeDisplay').textContent = `${year}-${month}-${day} ${selectedTime}`;
    
    // 좌석 활성화
    const seatInputs = document.querySelectorAll('input[name="seat"]');
    seatInputs.forEach((seat) => {
        seat.disabled = false;
        seat.parentElement.style.cursor = 'pointer';
        seat.parentElement.classList.remove('disabled');
    });
}


function validateReservation() {
    if (!selectedTime) {
        alert('상영시간을 선택해주세요.');
        return false;
    }
    if (!selectedSeat) {
        alert('좌석을 선택해주세요.');
        return false;
    }
    return true;
}

function resetSelection() {
    selectedTime = null;
    selectedSeat = null;
    document.getElementById('selectedTime').value = '';
    document.getElementById('selectedSeat').value = '';
    document.getElementById('selectedCount').textContent = '0';
    
    const timeCheckboxes = document.getElementsByName("screenTime");
    timeCheckboxes.forEach((cb) => {
        cb.checked = false;
    });
    
    const seatInputs = document.querySelectorAll('input[name="seat"]');
    seatInputs.forEach((seat) => {
        seat.checked = false;
        seat.disabled = true;
        seat.parentElement.classList.remove('selected');
    });
}

function validateAndSetTicket() {
    if (!validateReservation()) {
        return false;
    }
    
    // 상영 날짜와 시간 가져오기
    const screeningDate = document.getElementById('selectedTimeDisplay').textContent.split(' ')[0];
    const screeningTime = selectedTime;  // 선택된 상영 시간
    
    // 상영관 번호와 좌석 정보 가져오기
    const rnum = document.querySelector('.movie-header h3').textContent.replace('관', '');
    const selectedSeat = document.getElementById('selectedSeat').value;
    
    // 티켓 코드 생성 (상영날짜 + 상영시간 + 상영관번호 + 좌석번호)
    const ticketCode = `${screeningDate.replace(/-/g, '')}${screeningTime.replace(':', '')}${rnum}${selectedSeat}`;
    document.getElementById('tcode').value = ticketCode;
    
    // 상영 시간 정보 업데이트
    document.getElementById('selectedTime').value = `${screeningDate} ${screeningTime}`;
    
    return true;
}

// 확정버튼으로 예매
function submitReservation() {
    if (!validateReservation()) {
        return false;
    }
    
    // 폼 데이터 설정
    document.getElementById('tcode').value = document.getElementById('ticketNumber').textContent;
    document.getElementById('selectedTime').value = document.getElementById('selectedTimeDisplay').textContent;
    document.getElementById('selectedSeat').value = document.getElementById('selectedSeatDisplay').textContent.split('(')[0];
    
    // 폼 제출
    document.getElementById('ticketForm').submit();
}

function moveToConfirmTab() {
    if (!validateReservation()) {
        return false;
    }
    
    // 예매확인 탭으로 전환
    showTab('confirm', null);
    
    // 예매확인 탭 버튼 활성화
    document.getElementById('confirmTabBtn').classList.add('active');
    document.getElementById('selectTabBtn').classList.remove('active');
    
    // 포스터 업데이트
    const movieTitle = document.querySelector('.movie-header h2').textContent.trim();
    const posterContainer = document.querySelector('.movie-info');
    if (posterContainer) {
        posterContainer.innerHTML = '';
        getThePoster(movieTitle);
    }
}





