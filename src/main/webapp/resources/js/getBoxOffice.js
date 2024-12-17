let moviesList

function getBoxOfMovies(){

    // 현재 날짜
    let currentDate = new Date();

    // 현재 요일 (0: 일요일, 1: 월요일, ...)
    let currentDay = currentDate.getDay();

    // 지난주 월요일을 계산하기 위해 날짜를 조정
    let daysSinceLastMonday = (currentDay + 6) % 7 + 7; // 지난주의 일수를 더함
    let lastMondayDate = new Date(currentDate);
    lastMondayDate.setDate(currentDate.getDate() - daysSinceLastMonday);

    // yyyyMMdd 형식으로 포맷팅
    let yyyyMMdd = lastMondayDate.toISOString().slice(0, 10).replace(/-/g, '');
    console.log(`지난주 월요일: ${yyyyMMdd}`);

    // 주간 박스오피스
    const apiUrl = 'https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=d83057e4f4bb87a5ec398b4d59ab1863&targetDt='
        +yyyyMMdd+
        '&weekGb=0';

    axios.get(apiUrl)
        .then(response => {
            const jsonData = response.data;
            console.log(jsonData);

            // JSON 객체를 문자열로 변환
            const jsonString = JSON.stringify(jsonData, null, 2); // prettyprint
            console.log('JSON String:', jsonString);

            // jsonData(json)에서 boxOfficeResult(json) 가져오기
            const boxOfficeResult = jsonData.boxOfficeResult;
            console.log(boxOfficeResult);

            // boxOfficeResult(에서) weeklyBoxOfficeList(배열) 가져오기
            const weeklyBoxOfficeList = boxOfficeResult.weeklyBoxOfficeList;
            console.log(weeklyBoxOfficeList);

            // weeklyBoxOfficeList 내의 데이터 정리하기
            const simplifiedArray = weeklyBoxOfficeList.map(item => ({
                rnum: item.rnum,
                movieCd: item.movieCd,
                movieNm: item.movieNm,
            }));
            console.log(simplifiedArray);

            // movieList = simplifiedArray.map(item => item.movieNm);
            // getPoster에서 처리

            getPoster(simplifiedArray)
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

getBoxOfMovies()

