// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles/glass.dart';

class Options {
  String title;
  String symbol;
  double value;

  Options(this.title, this.symbol, this.value);
}

class Cards extends StatelessWidget {
  final List<Options> options;

  const Cards({Key? key, required this.options}) : super(key: key);

  formatCurrency(String symbol, double currency) {
    return NumberFormat.currency(
      symbol: symbol,
      locale: "pt_BR",
      decimalDigits: 2,
    ).format(currency);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final option = options[index];
            final widthScreen =
                (MediaQuery.of(context).size.width - 40) / options.length;
            return SizedBox(
              width: widthScreen,
              height: 100.0,
              child: GlassMorphism(
                start: 0.1,
                end: 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: formatCurrency(option.symbol, option.value),
                        style: const TextStyle(
                          fontFamily: 'MontSerrat',
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: option.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'MontSerrat',
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ),
            );
          },
        ),
      ),
    );
  }
}
