var selectedTime = null;
var selectedSeat = null;

function showTab(tabName, event) {
    var tabContents = document.querySelectorAll('.tab-content');
    for(var i = 0; i < tabContents.length; i++) {
        tabContents[i].classList.remove('active');
    }
    
    var tabs = document.querySelectorAll('.tab');
    for(var i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove('active');
    }
    
    document.getElementById(tabName + 'Tab').classList.add('active');
    event.target.classList.add('active');
    
    if(tabName === 'confirm') {
        const movieTitle = document.querySelector('.movie-header h2').textContent.trim();
        const posterContainer = document.querySelector('.movie-info');
        if (posterContainer) {
            posterContainer.innerHTML = '';
            getThePoster(movieTitle);
        }
    }
}

function enableSeatSelection() {
    const seatInputs = document.querySelectorAll('input[name="seat"]');
    seatInputs.forEach((seat) => {
        seat.disabled = false;
    });
}

function selectSeat(seatNum, event) {
    // 시간 선택 여부 체크
    if (!selectedTime) {
        alert('상영시간을 선택해주세요.');
        // 체크박스 선택 방지
        event.preventDefault();
        event.stopPropagation();
        return false;
    }
    
    // 좌석 요소 찾기
    var seatElement = document.querySelector(`input[value="${seatNum}"]`);
    var seatLabel = seatElement.closest('.seat');
    
    // 모든 좌석 선택 해제
    document.querySelectorAll('.seat').forEach(seat => {
        seat.classList.remove('selected');
        seat.querySelector('input').checked = false;
    });
    
    // 선택한 좌석 활성화
    seatLabel.classList.add('selected');
    seatElement.checked = true;
    selectedSeat = seatNum;
    
    // 선택 정보 업데이트
    document.getElementById('selectedSeat').value = seatNum;
    document.getElementById('selectedCount').textContent = '1';
    
    return false;
}


function checkOnlyOne(element) {
    const checkboxes = document.getElementsByName("screenTime");
    checkboxes.forEach((cb) => {
        cb.checked = false;
    });
    element.checked = true;
    
    // 선택된 시간 저장
    selectedTime = element.value;
    document.getElementById('selectedTime').value = selectedTime;
    document.getElementById('selectedTimeDisplay').textContent = selectedTime;
    
 // 좌석 선택 활성화 - 모든 좌석의 disabled 속성 제거
    const seatInputs = document.querySelectorAll('input[name="seat"]');
    seatInputs.forEach((seat) => {
        seat.disabled = false;
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
