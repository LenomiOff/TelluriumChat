const grid = document.getElementById("videoGrid");
const playerPage = document.getElementById("playerPage");
const home = document.getElementById("home");
const player = document.getElementById("videoPlayer");

// Fonction pour afficher vidéos (via recherche YouTube simple)
async function fetchVideos(query) {
  grid.innerHTML = "Chargement...";

  // ⚠️ Pas API officielle → on utilise un endpoint public non garanti
  const url = `https://ytsearch.vercel.app/api?q=${query}`;

  try {
    const res = await fetch(url);
    const data = await res.json();

    grid.innerHTML = "";

    data.videos.slice(0, 20).forEach(video => {
      const div = document.createElement("div");
      div.className = "video";

      div.innerHTML = `
        <img src="${video.thumbnail}">
        <p>${video.title}</p>
      `;

      div.onclick = () => playVideo(video.id);
      grid.appendChild(div);
    });

  } catch (e) {
    grid.innerHTML = "Erreur de chargement.";
  }
}

// Lecture vidéo
function playVideo(id) {
  home.classList.add("hidden");
  playerPage.classList.remove("hidden");
  player.src = `https://www.youtube.com/embed/${id}`;
}

// Retour
function goBack() {
  playerPage.classList.add("hidden");
  home.classList.remove("hidden");
  player.src = "";
}

// Recherche
function searchVideos() {
  const query = document.getElementById("searchInput").value;
  fetchVideos(query);
}

// Page d’accueil (vidéos récentes simulées)
fetchVideos("actualité");
