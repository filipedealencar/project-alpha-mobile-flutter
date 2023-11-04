import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cards/cards.dart';

import 'Charts/Column/default.dart';
import 'IncomeInfo/incomeInfo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(81, 64, 109, 1),
        body: Center(
          child: Column(
            children: [
              const Flexible(
                child: IncomeInfo(
                  mainIcome: 2900,
                  extraIncome: 750,
                  remainingDay: 8,
                ),
              ),
              SizedBox(
                height: heightScreen * 0.15,
                child: Cards(
                  options: [
                    Options("Total gasto no mês", "R\$", 0000),
                    Options("Saldo do mês atual", "R\$", 0000),
                    Options("Valor da renda total", "R\$", 0000),
                  ],
                ),
              ),
              const Flexible(child: ColumnDefault()),
              // Flexible(
              //   child: DoughnutDefaultState(
              //     options: [
              //       ListChart("1", "Cartão Nubank",
              //           const Color.fromARGB(255, 161, 3, 161), 335),
              //       ListChart("2", "Cartão Mercado Pago",
              //           const Color.fromARGB(255, 20, 193, 236), 229),
              //       ListChart("3", "Cartão Inter",
              //           const Color.fromARGB(255, 255, 115, 0), 1200),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

 

// const SizedBox(
//                 height: 310,
//                 child: SizedBox(
//                     height: double.infinity,
//                     child: Center(
//                         child: IncomeInfo(
//                       mainIcome: 2900,
//                       extraIncome: 750,
//                       remainingDay: 8,
//                     ))),
//               ),
//               const SizedBox(
//                 height: 300,
//                 child: ColumnDefault(),
//               ),
//               SizedBox(
//                 height: 150,
//                 child: Center(
//                     child: Cards(
//                   options: [
//                     Options("Total gasto no mês", "R\$", 0000),
//                     Options("Saldo do mês atual", "R\$", 0000),
//                     Options("Valor da renda total", "R\$", 0000),
//                   ],
//                 )),
//               ),
//               SizedBox(
//                 height: 510,
//                 child: SizedBox(
//                   height: double.infinity,
//                   child: DoughnutDefaultState(
//                     options: [
//                       ListChart("1", "Cartão Nubank",
//                           const Color.fromARGB(255, 161, 3, 161), 335),
//                       ListChart("2", "Cartão Mercado Pago",
//                           const Color.fromARGB(255, 20, 193, 236), 229),
//                       ListChart("3", "Cartão Inter",
//                           const Color.fromARGB(255, 255, 115, 0), 1200),
//                     ],
//                   ),
//                 ),
//               ),
