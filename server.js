'use strict';
var express = require('express');

var app = express();
app.set('port', process.env.PORT || 3000);
app.engine('html', require('ejs').renderFile)

app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res, next) {
  res.render('index.html');
});

var server = app.listen(app.get('port'), function() {
  var host = server.address().address;
  var port = server.address().port;
  console.log('Listening at http://%s:%s', host, port);
});
