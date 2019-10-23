//npm config set proxy "http://10.100.1.253:3128"
//npm config set https-proxy "http://10.100.1.253:3128"
//npm install express
//navegador: localhost:3000

const express = require('express')

const server = express()

//1º path (caminho)
//2º funcao

server.get('/perfil_animal/:prontuario', function(req, res){
    const prontuario = req.params.prontuario
    res.send('<h1>O prontuário é: ' + prontuario + '</h1>')
})

server.listen(3000);

