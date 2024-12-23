function getThePoster(title) {
    const container = document.querySelector('.movie-info');
    const div = document.createElement('div');
    div.className = 'poster';
    container.appendChild(div);
    const url = "https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query="
    axios.get(url+ encodeURIComponent(title))
        .then(response => {
            const json = response.data;
            if (json.results && json.results.length > 0) {
                console.log(json);
                const img = json.results[0].poster_path;
                if(img != null){
                    div.innerHTML = `<img src="http://image.tmdb.org/t/p/w500/${img}" class="img-responsive" >`; 
                }
            } else {
                return axios.get(`https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=goonies`);
            }
        })
        // 찾은 결과가 없는 경우 대신 요청되는 포스터
        .then(response => {
            if (response) {
                const json = response.data;
                console.log(json);
                div.innerHTML = `<div class="alert"><p>We're afraid nothing was found for that search.</p></div><p>Perhaps you were looking for The Goonies?</p><img id="thePoster" src="http://image.tmdb.org/t/p/w500/${json.results[0].poster_path}" class="img-responsive" />`;
            }
        })
        .catch(error => {
            console.error(`Error fetching poster for ${title}:`, url+ encodeURIComponent(title));
        })
}
