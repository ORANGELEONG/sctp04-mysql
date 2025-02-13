const express = require ('express');
const app = express();
const hbs = require('hbs');


app.get('/', function(req,res){
    res.send("hello world");
})

app.get('/about-us', function(req,res){
    res.render("about-us");
});

