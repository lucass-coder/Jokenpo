
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
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
          GestureDetector(
            onTap: () { print("ImagemClicada");},
            //onDoubleTap: () { print("DOIS CLIQUES NA IMAGEM");},
            //onLongPress: () { print("clique longo");},
            child: Image.asset("images/padrao.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 64, bottom: 32),
            child: Text(
              "Escolhe uma opção abaixo",
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
            Image.asset("images/pedra.png", height: 100,),
            Image.asset("images/papel.png", height: 100,),
            Image.asset("images/tesoura.png", height: 100,),
            ]
          )
        ],
      ),
    );
  }
}
