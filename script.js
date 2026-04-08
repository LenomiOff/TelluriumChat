function loadVideo() {
    const url = document.getElementById('urlInput').value;
    const videoId = url.split('v=')[1];
    if (!videoId) return alert("URL invalide !");
    
    document.getElementById('player').innerHTML = `
        <iframe src="https://www.youtube.com/embed/${videoId}"
        allow="autoplay; encrypted-media" allowfullscreen></iframe>
    `;
}
