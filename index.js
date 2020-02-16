//npm config set proxy "http://10.100.1.253:3128"
//npm config set https-proxy "http://10.100.1.253:3128"
//npm install express
//npm install express-handlebars

const express = require('express');
const handlebars = require('express-handlebars');
const path = require('path');
const bodyParser = require('body-parser');

const mysql = require('mysql');

const conexao = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password : '', 
    database: 'petinder'
});
  
module.exports = conexao;

const server = express();
server.use(bodyParser());

server.use(express.static(path.join(__dirname, '/public')));
server.engine('handlebars', handlebars({defaultLayout: 'main'}));
server.set('view engine', 'handlebars');

server.get(`/`, function(req,res){
    res.render('login');
});

server.get(`/editar_usuario`, function(req,res){
    res.render('editar_usuario');
});

server.get(`/editar_admin`, function(req,res){
    res.render('editar_admin');
});

server.get(`/chat`, function(req,res){
    res.render('chat');
});

server.get(`/pet_admin`, function(req,res){
    res.render('pet_admin');
});

server.get(`/feed`, function(req,res){
    res.render('feed');
});

server.get(`/editar_animal`, function(req,res){
    res.render('editar_perfil');
});

server.get(`/cadastro_animal`, function(req,res){
    res.render('cadastro_animal');
});

server.get(`/cadastro_usuario`, function(req,res){
    res.render('cadastro_usuario');
});

server.get(`/perfil_animal`, function(req,res){
    res.render('perfil_animal');
});

server.post('/cadastro_usuario', function(req,res){
        const sql = "INSERT INTO USUARIO VALUES(NULL,?,?,?,?,?,?);";
        const dados = [req.body.nome,req.body.email,req.body.animais,req.body.moradia,req.body.senha,req.body.info_adic];
    
        conexao.query(sql, dados, function(error, results, fields) {
            if(error) throw error;
            res.redirect('feed');
        });
        
    });

server.get('/perfil_usuario/:codigo', function(req, res) {
    const codigo = req.params.codigo;
    
    const sql = "SELECT nome, animais, moradia, info_adic FROM USUARIO WHERE cod = ?";
    const dados = [codigo];
    conexao.query(sql, dados, function(error, results, fields) {
        if(error) throw error;
            
        res.render('perfil_usuario', { usuarios: results });
        });
    });

    server.post('/cadastro_admin', function(req,res){
        const sql = "INSERT INTO ADMIN VALUES(NULL,?,?,?);";
        const dados = [req.body.nome,req.body.email, req.body.senha];
    
        conexao.query(sql, dados, function(error, results, fields) {
            if(error) throw error;
            res.redirect('pet_admin');
        });
        
    });

server.get(`/cadastro_admin`, function(req,res){
    res.render('cadastro_admin');
});


server.listen(3000);


