import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Material App",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _text1 = TextEditingController(text: "");
  String _text2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Programa para mostrar fibonacci según posición ingresada"),
      ),
      body: Column(
        children:[
          Container(padding: EdgeInsets.all(20), child: TextField(
            controller: _text1,
            decoration: InputDecoration(
              hintText: "Posición Fibonacci",
              hintStyle: TextStyle(fontSize: 25, color: Colors.black12),
            ),
          )),
          ElevatedButton(
            onPressed: calcularFibonacci,
            child: Text("Fibonacci"),
          ),
          Container(padding: EdgeInsets.all(20), child: Text(_text2, style: TextStyle(fontSize: 25, color: Colors.orange),
          ),
          ),
        ],
      ),
    );
  }

  void calcularFibonacci() {
    int posicion = int.tryParse(_text1.text) ?? 0;
    int num1 = 0;
    int num2 = 1;
    int sum = 0;
    for (int i = 0; i < posicion; i++) {
      if (i <= 1) {
        sum = i;
      } else {
        sum = num1 + num2;
        num1 = num2;
        num2 = sum;
      }
    }
    setState(() {
      _text2 = "En la posición $posicion el Fibonacci es $sum";
    });
  }
}