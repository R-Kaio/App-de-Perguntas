import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto':
          'há evolucionistas que não conseguem acreditar em um Deus que fez as coisas do nada, mas, pelo contrário, acreditam que todas as coisas surgiram do nada.  Quem disse isso?',
      'respostas': [
        {'texto': 'G.K.Chesterton', 'pontuacao': 10},
        {'texto': 'César Lattes', 'pontuacao': 0},
        {'texto': 'Wolfgang Smith', 'pontuacao': 0},
        {'texto': 'Não sei', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Quem foi o chefe da Alta venda (alta cúpula da Franco maçonaria durante as revoluções na Europa)?',
      'respostas': [
        {'texto': 'Karl Marx', 'pontuacao': 0},
        {'texto': 'Nubius', 'pontuacao': 10},
        {'texto': 'Albert Pike', 'pontuacao': 0},
        {'texto': 'Não sei', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          '"Embora uma arca de Noé perfeita devesse conter duas amostras de cada animal, nunca ninguém sugeriu que devesse conter dois Noés".  Quem disse isso?',
      'respostas': [
        {'texto': 'G.K.Chesterton', 'pontuacao': 10},
        {'texto': 'C.S.Lewis', 'pontuacao': 0},
        {'texto': 'J.R.R.Tolkien', 'pontuacao': 0},
        {'texto': 'Não sei', 'pontuacao': 0},
      ],
    }
  ];

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quantoResponder: _responder,
            )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
