import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _mensagem = "Informe seus dados.";
  TextEditingController fieldPeso = new TextEditingController();
  TextEditingController fieldAltura = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    this.fieldPeso.text = "";
    this.fieldAltura.text = "";
    setState(() {
      this._mensagem = "Informe seus dados.";
      this._formKey = GlobalKey<FormState>();
    });
  }

  void _calcularImc() {
    double altura = (double.parse(this.fieldAltura.text) / 100);
    double peso = double.parse(this.fieldPeso.text);

    double imc = (peso / (altura * altura));
    // print(double.parse(altura));
    // debugPrint('text');
    setState(() {
      if (imc < 18.5) {
        this._mensagem =
            "IMC: ${imc.toStringAsFixed(2)}, Classificação: MAGREZA";
      } else if (imc >= 18.5 && imc <= 24.9) {
        this._mensagem =
            "IMC: ${imc.toStringAsFixed(2)}, Classificação: SAUDÀVEL";
      } else if (imc >= 25 && imc <= 29.9) {
        this._mensagem =
            "IMC: ${imc.toStringAsFixed(2)}, Classificação: SOBREPESO";
      } else if (imc >= 30 && imc <= 34.9) {
        this._mensagem =
            "IMC: ${imc.toStringAsFixed(2)}, Classificação: OBESIDADE GRAU I";
      } else if (imc >= 35 && imc <= 39.9) {
        this._mensagem =
            "IMC: ${imc.toStringAsFixed(2)}, Classificação: OBESIDADE GRAU II";
      } else if (imc > 40) {
        this._mensagem =
            "IMC: ${imc.toStringAsFixed(2)}, Classificação: OBESIDADE GRAU III";
      }
    });
  }

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
              onPressed: _resetFields,
            )
          ],
        ),
        body: SingleChildScrollView(
            // padding: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person, size: 220, color: Colors.green),
                  TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu altura!";
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Altura (cm)',
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.green, fontSize: 25),
                      controller: this.fieldAltura),
                  TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu peso!";
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Peso (kg)',
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.green, fontSize: 25),
                      controller: this.fieldPeso),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _calcularImc();
                        }
                      },
                      child: Text('Calcular',
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                      color: Colors.green,
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  Text(
                    '$_mensagem',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )));
  }
}
