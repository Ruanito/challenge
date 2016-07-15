exports.index = function(req, res){
  db.query("SELECT * FROM city LIMIT 10", function(err, rows){
    if(err)
      throw err;
    res.send(rows);
  });
  //es.send('Ruanito');
}

exports.list = function(req, res){
  db.query("SELECT * FROM city WHERE city LIKE '" + req.params.name + "%' LIMIT 10", function(err, rows){
    if(err)
      throw err;
    res.send(rows);
  });
}