exports.index = function(req, res){
  db.query("SELECT * FROM city LIMIT 10", function(err, rows){
    if(err)
      throw err;
    res.send(rows);
  });
}

exports.autocomplete = function(req, res){
  db.query("SELECT city FROM city WHERE city LIKE '" + req.params.name + "%' LIMIT 10", function(err, rows){
    if(err)
      throw err;
    res.send(rows);
  });
}