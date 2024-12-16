function getPoster(movieList) {
    const container = document.querySelector('.container');
    let promises = [];
    for (let i = 0; i < movieList.length; i++) {
        const div = document.createElement('div');
        div.className = 'poster' + i;
        container.appendChild(div);
        
        promises.push(
            axios.get('https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=' + encodeURIComponent(movieList[i]))
                .then(response => {
                    const json = response.data;
                    if (json.results && json.results.length > 0) {
                        console.log(json);
                        $('.poster' + i).html(`<p>Your search found: <strong>${json.results[0].title}</strong></p><img src="http://image.tmdb.org/t/p/w500/${json.results[0].poster_path}" class="img-responsive" >`);
                    } else {
                        return axios.get(`https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=goonies`);
                    }
                })
                // 찾은 결과가 없는 경우 대신 요청되는 포스터
                .then(response => {
                    if (response) {
                        const json = response.data;
                        console.log(json);
                        $('.poster' + i).html(`<div class="alert"><p>We're afraid nothing was found for that search.</p></div><p>Perhaps you were looking for The Goonies?</p><img id="thePoster" src="http://image.tmdb.org/t/p/w500/${json.results[0].poster_path}" class="img-responsive" />`);
                    }
                })
                .catch(error => {
                    console.error(`Error fetching poster for ${movieList[i]}:`, error);
                })
        );
    }
    
    Promise.all(promises).then(() => {
        console.log('All movie poster requests have been completed.');
    });
}
