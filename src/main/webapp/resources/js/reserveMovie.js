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
    event = event || window.event;
    
    if (!selectedTime) {
        alert('상영시간을 선택해주세요.');
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }
        return false;
    }
    
    var seatElement = document.querySelector(`input[name="seat"][value="${seatNum}"]`);
    if (!seatElement || seatElement.disabled) return false;
    
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
    if (window.ticketPrefix) {
        const ticketNumber = `${window.ticketPrefix}${seatNum}`;
        document.getElementById('ticketNumber').textContent = ticketNumber;
        document.getElementById('selectedSeatDisplay').textContent = `${seatNum}`;
    }
    
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
    
    // 현재 날짜와 시간 생성
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    
    // 상영관 번호 가져오기
    const rnum = document.querySelector('.movie-header h3').textContent.replace('관', '');
    
    // 예매번호 prefix 생성 (YYYYMMDDHHMMRR 형식)
    window.ticketPrefix = `${year}${month}${day}${hours}${minutes}${rnum.padStart(2, '0')}`;
    
    document.getElementById('selectedTime').value = selectedTime;
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
    
    // 현재 시간 (예매 시간) 생성
    const now = new Date();
    const bookingHours = String(now.getHours()).padStart(2, '0');
    const bookingMinutes = String(now.getMinutes()).padStart(2, '0');
    
    // 상영 날짜와 시간 (2024-12-31 형식)
    const screeningDate = document.getElementById('selectedTimeDisplay').textContent.split(' ')[0];
    const screeningTime = selectedTime;  // 선택된 상영 시간
    
    // 상영관 번호와 좌석 정보 가져오기
    const rnum = document.querySelector('.movie-header h3').textContent.replace('관', '');
    const selectedSeat = document.getElementById('selectedSeat').value;
    
    // 티켓 코드 생성 (상영날짜 + 현재시간 + 상영관번호 + 좌석번호)
    const ticketCode = `${screeningDate.replace(/-/g, '')}${bookingHours}${bookingMinutes}${rnum}${selectedSeat}`;
    document.getElementById('tcode').value = ticketCode;
    
    // 상영 시간 정보 업데이트 (날짜와 시간 모두 포함)
    document.getElementById('selectedTime').value = `${screeningDate} ${screeningTime}`;
    
    return true;
}



