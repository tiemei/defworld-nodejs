var express = require('express');
var flickr = require('./flickr_auth');
var app = express();

app.get('/tools/flickrAuth', function(req, res){
  flickr.auth(res);
});

app.get('/tools/flickrCb', function(req, res) {
  console.log(req.originalUrl);
  var oauth_token = req.query.oauth_token
  var oauth_verifier = req.query.oauth_verifier
  res.set('Content-Type', 'text/html');
  res.send('<h3>flickr auth sucess!</h3><br />' + "oauth_token=" + oauth_token +
           '<br />oauth_verifier=' + oauth_verifier + "<br /><a href=\"/\">back to defworld.com</a>");  
});
app.listen(3000);
