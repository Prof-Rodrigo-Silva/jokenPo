import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("image/padrao.png");
  var _mensagem = "Escolha Um Opção Abaixo";
  int _vitoria = 0, _derrota = 0, _empate = 0;

   void _opcaoSelecionada(String escolhaUsuario){

     var opcoes = ["pedra", "papel", "tesoura"];
     var numero = Random().nextInt(opcoes.length);
     var escolhaApp = opcoes[numero];

     switch(escolhaApp){
       case "pedra":
         setState(() {
           this._imagemApp = AssetImage("image/pedra.png");
         });
         break;
       case "papel":
         setState(() {
           this._imagemApp = AssetImage("image/papel.png");
         });
         break;
       case "tesoura":
         setState(() {
           this._imagemApp = AssetImage("image/tesoura.png");
         });
         break;
     }

     if((escolhaUsuario == "pedra" && escolhaApp =="tesoura") ||
            (escolhaUsuario == "tesoura" && escolhaApp =="papel") ||
            (escolhaUsuario == "papel" && escolhaApp =="pedra"))
     {
       _vitoria += 1;
       setState(() {
         this._mensagem = "Você Ganhou!!!!";
       });
     }else if((escolhaApp == "pedra" && escolhaUsuario =="tesoura") ||
         (escolhaApp == "tesoura" && escolhaUsuario =="papel") ||
         (escolhaApp == "papel" && escolhaUsuario =="pedra"))
     {
       _derrota += 1;
       setState(() {
         this._mensagem = "Você Pedeu!!!!";
       });
     }else{
       _empate += 1;
       setState(() {
         this._mensagem = "Empate!!!!";
       });
     }

  }
  void _zerarJogo(){
     setState(() {
       _vitoria = 0; _empate = 0; _derrota = 0;
       _imagemApp = AssetImage("image/padrao.png");
       _mensagem = "Escolha Um Opção Abaixo";
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap:()=> _opcaoSelecionada("pedra"),
                child: Image.asset("image/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel"),
                child: Image.asset("image/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("tesoura"),
                child: Image.asset("image/tesoura.png", height: 100,),
              ),
              /*Image.asset("image/pedra.png", height: 100,),
              Image.asset("image/papel.png", height: 100,),
              Image.asset("image/tesoura.png", height: 100,),*/
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Vitórias: ${_vitoria}",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              )),
              Text(
                  "Derrotas: ${_derrota}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  )),
              Text(
                  "Empates: ${_empate}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),),
          RaisedButton(
            child: Text(
              "Zerar Jogo",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
            color: Colors.blue,
            onPressed: _zerarJogo,
          )
        ],
      ),
    );
  }
}
