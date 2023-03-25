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
                const SizedBox(
                    height: 450,
                    child: SizedBox(
                        height: double.infinity,
                        child: DoughnutDefaultState(
                            // data: [
                            //   ChartOptions('Shirts', 5),
                            //   ChartOptions('Cardigans', 20),
                            //   ChartOptions('Chiffons', 36),
                            //   ChartOptions('Pants', 10),
                            //   ChartOptions('Heels', 10),
                            //   ChartOptions('Socks', 20),
                            // ],
                            )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
