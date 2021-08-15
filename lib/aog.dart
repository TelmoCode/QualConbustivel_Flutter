import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aog extends StatefulWidget {
  const Aog({Key? key}) : super(key: key);
  @override
  _AogState createState() => _AogState();
}

class _AogState extends State<Aog> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = '';

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    // ignore: unnecessary_null_comparison
    if (precoGasolina == null || precoAlcool == null) {
      setState(() {
        _textoResultado = " Digite corretamente todos os campos ";
      });
    } else if ((precoAlcool / precoGasolina) < 0.70) {
      setState(() {
        _textoResultado = " A relação ficou abaixo de 0.70 melhor usar Alcool ";
      });
    } else {
      setState(() {
        _textoResultado =
            " A relação ficou acima de 0.70 melhor usar Gasolina ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alcool ou Gasolina"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset('images/logo.png')),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Escolha qual o melhor combustivel para seu automovel',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço do Alcool, Ex. 3.50"),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço da Gasolina, Ex. 4.50"),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    hoverColor: Colors.blueGrey,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Calcular',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: _calcular,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
