function getMovieInfo(movieCd) {
    const apiUrl = `http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=d83057e4f4bb87a5ec398b4d59ab1863&movieCd=${movieCd}`;

    axios.get(apiUrl)
        .then(response => {
            const jsonData = response.data;
            console.log(jsonData);
            
            const movieInfoResult = jsonData.movieInfoResult;
            const movieInfo = movieInfoResult.movieInfo;
            
            // details 
            const movieNm = movieInfo.movieNm; // 영화 제목
            const prdtYear = movieInfo.prdtYear; // 영화 제작 연도
            const showTm = movieInfo.showTm; // 상영 시간
            const directors = movieInfo.directors.map(director => director.peopleNm).join(", "); // 영화 감독 (comma-separated)
            const actors = movieInfo.actors.map(actor => actor.peopleNm).join(", "); // 주연 정보 (comma-separated)
            const companys = movieInfo.companys.map(company => company.companyNm).join(", "); // 영화사 (comma-separated)
            const audits = movieInfo.audits.map(audit => audit.watchGradeNm).join(", "); // 영화 등급 (comma-separated)

            //fetching
            document.querySelector('.details h1').textContent = `영화 제목: ${movieNm}`;
            document.querySelector('.details p:nth-child(2)').textContent = `제작 연도: ${prdtYear}`;
            document.querySelector('.details p:nth-child(3)').textContent = `상영 시간: ${showTm}분`;
            document.querySelector('.details p:nth-child(4)').textContent = `감독: ${directors}`;
            document.querySelector('.details p:nth-child(5)').textContent = `주연: ${actors}`;
            document.querySelector('.details p:nth-child(6)').textContent = `영화사: ${companys}`;
            document.querySelector('.details p:nth-child(7)').textContent = `영화 등급: ${audits}`;
            getThePoster(movieNm);
        })
        .catch(error => {
            console.error('Error fetching data:', error);
            if (error.response) {
                console.error("Response Status:", error.response.status);
                console.error("Response Data:", error.response.data);
            }
        });
}
