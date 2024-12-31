function getTrailer(movieTitle) {
    const apiKey = 'AIzaSyASxAvEDFjwOdAeUEk_JgYzk0Z_uUjdpns'; // YouTube Data
																// API 키
    
    if (!movieTitle) {
        alert('Please enter a movie title.');
        return;
    }

    const url = `https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=${encodeURIComponent(movieTitle + ' trailer')}&type=video&key=${apiKey}`;
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.items && data.items.length > 0) {
                const trailerId = data.items[0].id.videoId;
                const trailerContainer = document.getElementById('trailer');
                trailerContainer.innerHTML = `<iframe class="trailer-iframe" src="https://www.youtube.com/embed/${trailerId}" frameborder="0" allowfullscreen></iframe>`;
            } else {
                alert('Trailer not found');
            }
        })
        .catch(error => {
            console.error('Error fetching trailer:', error);
            alert('Error fetching trailer. Please try again later.');
        });
}
