import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'model.dart';

Future<void> loadFont() async {
  await rootBundle
      .load('fonts/montserrat/Montserrat-Italic-VariableFont_wght.ttf');
  await rootBundle.load('fonts/montserrat/Montserrat-VariableFont_wght.ttf');
}

Color getRandomColor() {
  Random random = Random();
  int r = random.nextInt(256);
  int g = random.nextInt(256);
  int b = random.nextInt(256);
  return Color.fromARGB(255, r, g, b);
}

class ListChart {
  String icon;
  String title;
  Color color;
  double value;

  ListChart(this.icon, this.title, this.color, this.value);
}

Color myRandomColor = getRandomColor();

class DoughnutDefaultState extends StatelessWidget {
  const DoughnutDefaultState({Key? key, required this.options})
      : super(key: key);
  final List<ListChart> options;

  @override
  Widget build(BuildContext context) {
    List<ChartSampleData> incomesValues = options
        .map((chart) => ChartSampleData(
            x: chart.title,
            y: chart.value,
            text: chart.title,
            pointColor: chart.color))
        .toList();

    double newValues = 0;

    for (var i = 0; i < incomesValues.length; i++) {
      newValues += incomesValues[i].y!;
    }

    formatCurrency(String symbol, double currency) {
      return NumberFormat.currency(
        symbol: symbol,
        locale: "pt_BR",
        decimalDigits: 2,
      ).format(currency);
    }

    return Scaffold(
      body: Transform.translate(
        offset: const Offset(0, -70),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  alignment: AlignmentDirectional.topStart,
                  child: const Text(
                    'Gastos total',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromRGBO(96, 152, 255, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        fontFamily: "MontSerrat"),
                  ),
                ),
                SfCircularChart(
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget: Text(
                        formatCurrency("R\$", newValues),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: "MontSerrat"),
                      ),
                    )
                  ],
                  legend: Legend(
                      isVisible: false,
                      overflowMode: LegendItemOverflowMode.wrap),
                  series: _getElevationDoughnutSeries(incomesValues),
                ),
                ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final option = options[index];
                      return Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: option.color,
                                        ),
                                        child: Text(
                                          option.icon,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      option.title,
                                      style: const TextStyle(
                                        fontFamily: 'MontSerrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Text(
                                    formatCurrency("R\$", option.value),
                                    style: const TextStyle(
                                      fontFamily: 'MontSerrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: index != options.length - 1
                                  ? const Divider()
                                  : null),
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getElevationDoughnutSeries(
      List<ChartSampleData> list) {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          innerRadius: '65%',
          // radius: '100%',
          dataSource: list,
          animationDuration: 1,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor)
    ];
  }
}
