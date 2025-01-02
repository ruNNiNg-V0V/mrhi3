function getPosters(simplifiedArray) {
    const container = document.querySelector('.swiper-wrapper');
    let rnumList = simplifiedArray.map(item => item.rnum);
    let movieCdList = simplifiedArray.map(item => item.movieCd);
    let movieList = simplifiedArray.map(item => item.movieNm);
    let promises = [];

    for (let i = 0; i < movieList.length; i++) {
        const div = document.createElement('div');
        div.className = 'swiper-slide';
        div.id = 'poster' + i;
        div.setAttribute('data-title', movieList[i]);
        container.appendChild(div);

        const url = "https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=";
        promises.push(
            axios.get(url + encodeURIComponent(movieList[i]))
                .then(response => {
                    const json = response.data;
                    if (json.results && json.results.length > 0) {
                        console.log(json);
                        $('#poster' + i).html(
                            `<p><strong>${rnumList[i]}관</strong></p>
                        		<form id="movieForm${i}" action="movieInfo.do" method="POST">
                        			<input type="hidden" name="rnum" value="${rnumList[i]}">
                        			<input type="hidden" name="movieCd" value="${movieCdList[i]}">
                        			<input type="hidden" name="movieNm" value="${encodeURIComponent(movieList[i])}">
                        			<a href="javascript:void(0);" onclick="submitForm('movieForm${i}')">
                        				<img src="http://image.tmdb.org/t/p/w500/${json.results[0].poster_path}" class="img-responsive" data-title="${movieList[i]}">
                        			</a>
                        		</form>
                            <p><strong>${movieList[i]}</strong></p>`
                        );
                    } else {
                        return axios.get(`https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=goonies`);
                    }
                })
                .then(response => {
                    if (response) {
                        const json = response.data;
                        console.log(json);
                        $('#poster' + i).html(`<div class="alert"><p>We're afraid nothing was found for that search.</p></div><p>Perhaps you were looking for The Goonies?</p><img id="thePoster" src="http://image.tmdb.org/t/p/w500/${json.results[0].poster_path}" class="img-responsive" />`);
                    }
                })
                .catch(error => {
                    console.error(`Error fetching poster for ${movieList[i]}:`, error);
                })
        );
    }

    Promise.all(promises).then(() => {
        console.log('All movie poster requests have been completed.');
        // mouseover 이벤트 추가
        let lastEventTime = 0;
        const eventDelay = 3000; // 이벤트 비활성화 시간 (밀리초)

        const slides = document.querySelectorAll('.swiper-slide');
        slides.forEach(slide => {
            slide.addEventListener('mouseover', function() {
                const currentTime = new Date().getTime();
                if (currentTime - lastEventTime > eventDelay) {
                    lastEventTime = currentTime;
                    const title = this.getAttribute('data-title');
                    getTrailer(title)
                }
            });
        });
    });
}

function submitForm(formId) {
    document.getElementById(formId).submit();
}
