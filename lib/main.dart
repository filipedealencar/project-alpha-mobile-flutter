import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/Box.dart';
import 'package:flutter_application_1/Header/header.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 300,
            child: Center(
                child: Header(
              salaryReceived: 2500.66,
            )),
          ),
          SizedBox(
            height: 300,
            child: Center(
                child: Box(
              options: [
                Options("Total gasto no mês", "R\$", 2700),
                Options("Saldo do mês atual", "R\$", 2700),
                Options("Valor da renda total", "R\$", 2700),
              ],
            )),
          ),
        ],
      )),
    ));
  }
}
