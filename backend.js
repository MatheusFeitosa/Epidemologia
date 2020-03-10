var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.sendFile(__dirname+'/formulario.html');

});

app.post('/',function(req, res){
    console.log("foi")
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

const sqlite3 = require('sqlite3').verbose();

var file = "Epidemologia.db";
var db = new sqlite3.Database(file);
db.all(`SELECT cpf FROM paciente`, function(err, rows) {
        rows.forEach(function (row) {
            console.log(row.cpf);
        })
});	
db.close();

