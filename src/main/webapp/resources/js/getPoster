$(document).ready(function () {

    const container = document.querySelector('.container');

    let movieList = ["모아나 2", "위키드", "히든페이스",
        "글래디에이터 Ⅱ", "청설", "나의 히어로 아카데미아 더 무비: 유어 넥스트",
        "1승", "오늘 밤, 세계에서 이 사랑이 사라진다 해도", "베놈: 라스트 댄스",
        "대가족"]
    let i = 0;

    for (let i = 0; i < movieList.length; i++) {
        const div = document.createElement('div');
        div.className = 'poster' + i;
        container.appendChild(div);
        let film = movieList[i];
        $.getJSON("https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=" + film + "&callback=?", function (json) {
            if (json != "Nothing found.") {
                console.log(json);
                $('.poster' + i).html('<p>Your search found: <strong>' + json.results[0].title + '</strong></p><img src=\"http://image.tmdb.org/t/p/w500/' + json.results[0].poster_path + '\" class=\"img-responsive\" >');
            } else {
                $.getJSON("https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=goonies&callback=?", function (json) {
                    console.log(json);
                    $('.poster' + i).html('<div class="alert"><p>We\'re afraid nothing was found for that search.</p></div><p>Perhaps you were looking for The Goonies?</p><img id="thePoster" src="http://image.tmdb.org/t/p/w500/' + json[0].poster_path + ' class="img-responsive" />');
                });
            }
        });
    }
})