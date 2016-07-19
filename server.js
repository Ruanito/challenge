var express = require('express');
var mysql = require('mysql');
var app = express();

var city = require('./routes/city');

db = mysql.createConnection({
  host  : 'localhost',
  user  : 'root',
  password : '',
  database : ''
});

db.connect();

app.listen(3000, function () {
  console.log('Server running on port:3000');
});


app.get('/city/', city.index);
app.get('/city/:name', city.autocomplete);