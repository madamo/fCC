require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const dns = require('dns');

//let mongoose = require('mongoose');

//mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });


// Basic Configuration
const port = process.env.PORT || 3000;

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const urls = []

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

app.post('/api/shorturl', (req, res) => {
  console.log(`request url ${req.body.url}`)
  // check if domain name isn't the gitpod instance
  if (!req.body.url.includes("https://3000-freecodecam-boilerplate-zslik6tkaod.ws-us118.gitpod.io/")) {
    dns.lookup(req.body.url, (err, addresses) => {
      if (err || !addresses) {
        res.json({error: "invalid url"})
        console.log("Invalid URL")
      } else {
        const original_url = req.body.url
        let urlObj = { original_url: original_url, short_url: urls.length }
        urls.push(urlObj)
        console.log(urls)
        res.json( urlObj )
      }
    })
  } else {
    const original_url = req.body.url
    let urlObj = { original_url: original_url, short_url: urls.length }
    urls.push(urlObj)
    console.log(urls)
    res.json( urlObj )
  }
  
})

app.get('/api/shorturl/:short_url', (req, res) => {
  let shortURL = req.params.short_url
  console.log(`shortURL: ${shortURL}`)
  let redirectURL = urls.find((obj) => obj.short_url == shortURL)
  if (redirectURL) {
    console.log(`Redirecting to ${redirectURL["original_url"]}`)
    res.redirect(redirectURL["original_url"])
  } else {
    res.json({error: "url not found"})
  }
  
})

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});

/*

1. You should provide your own project, not the example URL.
Waiting: 2. You can POST a URL to /api/shorturl and get a JSON response with original_url and short_url properties. Here's an example: { original_url : 'https://freeCodeCamp.org', short_url : 1}
Waiting: 3. When you visit /api/shorturl/<short_url>, you will be redirected to the original URL.
Waiting: 4. If you pass an invalid URL that doesn't follow the valid http://www.example.com format, the JSON response will contain { error: 'invalid url' }

*/