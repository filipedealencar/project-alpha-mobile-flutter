import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/Box.dart';
import 'package:flutter_application_1/Header/header.dart';

import 'Charts/charts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 300,
                  child: Center(
                      child: Header(
                    mainIcome: 2900,
                    extraIncome: 750,
                    remainingDay: 8,
                  )),
                ),
                SizedBox(
                  height: 150,
                  child: Center(
                      child: Box(
                    options: [
                      Options("Total gasto no mês", "R\$", 0000),
                      Options("Saldo do mês atual", "R\$", 0000),
                      Options("Valor da renda total", "R\$", 0000),
                    ],
                  )),
                ),
                SizedBox(
                    height: 510,
                    child: SizedBox(
                        height: double.infinity,
                        child: DoughnutDefaultState(
                          options: [
                            ListChart("1", "Cartão Nubank",
                                Color.fromARGB(255, 161, 3, 161), 335),
                            ListChart("2", "Cartão Mercado Pago",
                                Color.fromARGB(255, 20, 193, 236), 229),
                            ListChart("3", "Cartão Inter",
                                Color.fromARGB(255, 255, 115, 0), 1200),
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
