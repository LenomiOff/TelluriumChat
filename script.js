function loadVideo() {
    const url = document.getElementById('urlInput').value;
    const videoId = url.split('v=')[1];
    if (!videoId) return alert("URL invalide !");
    
    document.getElementById('player').innerHTML = `
        <iframe width="560" height="315"
        src="https://www.youtube.com/embed/${videoId}"
        frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
        </iframe>
    `;
}
