
import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App " + escolhaApp);
    print("Escolha do Usuario " + escolhaUsuario);

    switch( escolhaApp ){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //Validação do ganhador
    //Usuário Ganhador
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou  :)";
      });
    }else if(   //App Ganhador
          (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
          (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel")
    ){
      setState(() {
        this._mensagem = "Você perdeu  :(";
      });
    }else{    //Empate
      setState(() {
        this._mensagem = "Empatamos!!!";
      });
    }


    //print("Opção Selecionada: " + escolheUsuario); TAMBÉM SERVE ASSIM
    //print("Opção Selecionada: $escolheUsuario");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagem
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolhe do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Image(image: this._imagemApp,),
          // GestureDetector(
          //   onTap: () { print("ImagemClicada");},
          //   //onDoubleTap: () { print("DOIS CLIQUES NA IMAGEM");},
          //   //onLongPress: () { print("clique longo");},
          //   child: Image.asset("images/padrao.png"),
          // ),
          Padding(
            padding: EdgeInsets.only(top: 64, bottom: 32),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra") ,
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel") ,
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura") ,
                child: Image.asset("images/tesoura.png", height: 100,),
              ),

            // Image.asset("images/pedra.png", height: 100,),
            // Image.asset("images/papel.png", height: 100,),
            // Image.asset("images/tesoura.png", height: 100,),
            ]
          )
        ],
      ),
    );
  }
}
