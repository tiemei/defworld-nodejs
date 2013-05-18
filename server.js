var express = require('express');
var flickr = require('./flickr_auth');
var app = express();

app.get('/tools/flickrAuth', function(req, res){
  flickr.auth(res);
});

app.get('/tools/flickrCb', function(req, res) {
  res.send('hello world');  
});
app.listen(3000);
