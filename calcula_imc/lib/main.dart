import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    home: Home(),  
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person, size: 120, color: Colors.green),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Altura (cm)',
              labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.green,fontSize: 25)),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Peso (kg)',
              labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.green,fontSize: 25)),
          RaisedButton(
            onPressed: (){},
            child: Text('Calcular',style: TextStyle(color: Colors.white, fontSize: 25)),
            )
        ],
      ),
    );
  }
}