import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Contador de Pessoas - App01:curso',
//    debugShowCheckedModeBanner: false,
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _msg = 'Pode Entrar';

  void _addPeople(int delta) {
    if (_people > 14) {}
    setState(() {
      _people += delta;
      if (_people > 20) {
        _msg = 'Entrar mais ninguém!';
      }
      if (_people < 0) {
        _msg = 'É alma que tem aqui É?!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/restaurante.jpg',
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_people',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      '+1',
                      style: TextStyle(color: Colors.red, fontSize: 40),
                    ),
                    onPressed: () {
                      _addPeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      '-1',
                      style: TextStyle(color: Colors.red, fontSize: 40),
                    ),
                    onPressed: () {
                      _addPeople(-1);
                    },
                  ),
                )
              ],
            ),
            Text(
              '$_msg',
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
