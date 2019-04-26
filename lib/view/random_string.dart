import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomString extends StatefulWidget {
  RandomString({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RandomWord createState() => _RandomWord();
}

class _RandomWord extends State<RandomString> {
  String word = 'Initial word';

  randomWord() {
    setState(() {
      word = new WordPair.random().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('$word'),
            RaisedButton(
              child: Text('random'),
              onPressed: randomWord,
            )
          ],
        ),
      ),
    );
  }
  
}