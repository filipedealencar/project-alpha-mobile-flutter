import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await loadFont();
}

Future<void> loadFont() async {
  await rootBundle
      .load('fonts/montserrat/Montserrat-Italic-VariableFont_wght.ttf');
  await rootBundle.load('fonts/montserrat/Montserrat-VariableFont_wght.ttf');
}

class Header extends StatelessWidget {
  final double salaryReceived;
  final int? remainingDay;
  final double? extraIncome;
  const Header(
      {Key? key,
      required this.salaryReceived,
      this.extraIncome,
      this.remainingDay})
      : super(key: key);

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
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(3, 155, 145, 1),
              Color.fromRGBO(16, 158, 144, 0.8),
              Color.fromRGBO(2, 174, 120, 0.6),
            ],
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Salário Recebido',
                        style: TextStyle(
                          fontFamily: 'MontSerrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 25),
                      ),
                      TextSpan(
                        text: formatCurrency("+", salaryReceived),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'MontSerrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: extraIncome != null
                    ? Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Renda Extra',
                              style: TextStyle(
                                fontFamily: 'MontSerrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(width: 60),
                            ),
                            TextSpan(
                              text: formatCurrency("+", extraIncome ?? 0),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'MontSerrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'R\$',
                    style: const TextStyle(
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: formatCurrency(
                            "", salaryReceived + (extraIncome ?? 0)),
                        style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'MontSerrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                  child: remainingDay != null
                      ? (Text.rich(TextSpan(
                          text:
                              'Faltam $remainingDay dias para o próximo pagamento',
                          style: const TextStyle(
                            fontFamily: 'MontSerrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 9.5,
                            color: Colors.white,
                          ),
                        )))
                      : null)
            ]),
      ),
    ));
    ;
  }
}
