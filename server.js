const express = require('express');
const fetch = require('node-fetch');
const app = express();
const PORT = 3000;

app.get('/video', async (req, res) => {
    const url = req.query.url;
    // Ici tu peux faire fetch côté serveur pour "proxy" YouTube
    res.redirect(url);
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
