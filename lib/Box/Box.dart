import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Options {
  String title;
  String symbol;
  double value;

  Options(this.title, this.symbol, this.value);
}

class Box extends StatelessWidget {
  final List<Options> options;

  const Box({Key? key, required this.options}) : super(key: key);

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
        backgroundColor: Color.fromARGB(255, 68, 68, 63),
        body: Transform.translate(
          offset: const Offset(0, -50),
          child: Center(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              double widthCards =
                  ((MediaQuery.of(context).size.width / options.length) -
                      (5 * options.length));
              final option = options[index];
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Do something when component is tapped
                      },
                      child: Container(
                        width: widthCards,
                        height: 100,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 152, 177, 170),
                              width: 3),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                    text: formatCurrency(
                                        option.symbol, option.value),
                                    style: const TextStyle(
                                      fontFamily: 'MontSerrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Color.fromRGBO(2, 174, 129, 1),
                                    ),
                                  ),
                                  // const WidgetSpan(
                                  //   child: SizedBox(width: 100),
                                  // ),
                                )),
                                Center(
                                    child: Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                      text: option.title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'MontSerrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                )),
                              ]),
                        ),
                      ),
                    )
                  ]);
            },
          )),
        ),
      ),
    );
  }
}
