import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Melhore!';
    } else if (pontuacao < 19) {
      return 'Você é bom!';
    } else {
      return 'Seja meu amigo!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: Text(
            'Reiniciar?',
          ),
          onPressed: quandoReiniciarQuestionario,
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
        )
      ],
    );
  }
}
