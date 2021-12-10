import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;
import 'dart:math';

class PiechartTab1 extends StatefulWidget {
  const PiechartTab1({ Key? key }) : super(key: key);

  @override
  _PiechartTab1State createState() => _PiechartTab1State();
}

class _PiechartTab1State extends State<PiechartTab1> {
  List<charts.Series>? seriesList;
  bool? animate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: new charts.PieChart<int>(
        _createSampleData(),
        animate: true,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 60,
          arcRendererDecorators: [new charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.inside,
          )],
        ),
        behaviors: [
          // new charts.PanAndZoomBehavior(),
        //   new charts.DatumLegend(
        //     // Positions for "start" and "end" will be left and right respectively
        //     // for widgets with a build context that has directionality ltr.
        //     // For rtl, "start" and "end" will be right and left respectively.
        //     // Since this example has directionality of ltr, the legend is
        //     // positioned on the right side of the chart.
        //     position: charts.BehaviorPosition.end,
        //     // By default, if the position of the chart is on the left or right of
        //     // the chart, [horizontalFirst] is set to false. This means that the
        //     // legend entries will grow as new rows first instead of a new column.
        //     horizontalFirst: true,
        //     // This defines the padding around each legend entry.
        //     cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
        //     // Set [showMeasures] to true to display measures in series legend.
        //     showMeasures: false,
        //     // Configure the measure value to be shown by default in the legend.
        //     legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
        //     // Optionally provide a measure formatter to format the measure value.
        //     // If none is specified the value is formatted as a decimal.
        //     measureFormatter: (num? value) {
        //       return value == null ? '-' : '${value}k';
        //     },
        //   ),
        ],
        selectionModels:[
          charts.SelectionModelConfig(
            changedListener: (model) {
              if(model.hasDatumSelection){
                print(model.selectedSeries[0].measureFn(model.selectedDatum[0].index));
              }
            }
          ),
        ],
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 2000),
      new LinearSales(1, 575),
      new LinearSales(2, 825),
      new LinearSales(3, 5),
      new LinearSales(4, 25),
      new LinearSales(5, 5),
      new LinearSales(6, 5),
      new LinearSales(7, 90),
      new LinearSales(8, 75),
      new LinearSales(9, 25),
      new LinearSales(10, 45),
      new LinearSales(11, 65),
      new LinearSales(12, 80),
      new LinearSales(13, 75),
      new LinearSales(14, 35),
      new LinearSales(15, 55),
      new LinearSales(16, 59),
      new LinearSales(17, 95),
      new LinearSales(18, 85),
      new LinearSales(19, 60),
      new LinearSales(20, 50),
      new LinearSales(21, 40),
      new LinearSales(22, 30),
      new LinearSales(23, 75),
      new LinearSales(24, 20),
      new LinearSales(25, 15),
      new LinearSales(26, 5),
      new LinearSales(27, 100),
      new LinearSales(28, 75),
      new LinearSales(29, 25),
      new LinearSales(30, 5),
      new LinearSales(31, 5),
      new LinearSales(32, 100),
      new LinearSales(33, 75),
      new LinearSales(34, 25),
      new LinearSales(35, 5),
      new LinearSales(36, 5),
      new LinearSales(37, 100),
      new LinearSales(38, 75),
      new LinearSales(39, 25),
      new LinearSales(40, 5),
      new LinearSales(41, 5),
      new LinearSales(42, 100),
      new LinearSales(43, 75),
      new LinearSales(44, 25),
      new LinearSales(45, 5),
      new LinearSales(46, 5),
      new LinearSales(47, 100),
      new LinearSales(48, 75),
      new LinearSales(49, 25),
    ];
    // print((16777215~/50).toRadixString(16));
    final color = List<String>.generate(
      50,
      (int index) {
        String value = (16777215~/50*data[index].year).toRadixString(16).toUpperCase();
        int lengthString = value.length;
        for (int i =0; i < 6-lengthString; i++) value = '0' + value;
        return value;
      }
    );

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        colorFn: (datum, index) => charts.Color.fromHex(code: '#'+ color[index!]),
        labelAccessorFn: (LinearSales row, _) => '${row.sales}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
// int touchedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: Card(
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             const SizedBox(
//               height: 18,
//             ),
//             Expanded(
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: PieChart(
//                   PieChartData(
//                       pieTouchData: PieTouchData(touchCallback:
//                           (FlTouchEvent event, pieTouchResponse) {
//                         setState(() {
//                           if (!event.isInterestedForInteractions ||
//                               pieTouchResponse == null ||
//                               pieTouchResponse.touchedSection == null) {
//                             touchedIndex = -1;
//                             return;
//                           }
//                           touchedIndex = pieTouchResponse
//                               .touchedSection!.touchedSectionIndex;
//                         });
//                       }),
//                       borderData: FlBorderData(
//                         show: false,
//                       ),
//                       sectionsSpace: 0,
//                       centerSpaceRadius: 40,
//                       sections: showingSections()),
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const <Widget>[
//                 Indicator(
//                   color: Color(0xff0293ee),
//                   text: 'First',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Indicator(
//                   color: Color(0xfff8b250),
//                   text: 'Second',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Indicator(
//                   color: Color(0xff845bef),
//                   text: 'Third',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Indicator(
//                   color: Color(0xff13d38e),
//                   text: 'Fourth',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               width: 28,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<PieChartSectionData> showingSections() {
//     return List.generate(50, (i) {
//       final isTouched = i == touchedIndex;
//       final fontSize = isTouched ? 25.0 : 16.0;
//       final radius = isTouched ? 60.0 : 50.0;
//       switch (i % 4) {
//         case 0:
//           return PieChartSectionData(
//             color: const Color(0xff0293ee),
//             value: 40,
//             title: '40%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: const Color(0xfff8b250),
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 2:
//           return PieChartSectionData(
//             color: const Color(0xff845bef),
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 3:
//           return PieChartSectionData(
//             color: const Color(0xff13d38e),
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         default:
//           throw Error();
//       }
//     });
//   }
// }

// class Indicator extends StatelessWidget {
//   final Color color;
//   final String text;
//   final bool isSquare;
//   final double size;
//   final Color textColor;

//   const Indicator({
//     Key? key,
//     required this.color,
//     required this.text,
//     required this.isSquare,
//     this.size = 16,
//     this.textColor = const Color(0xff505050),
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Container(
//           width: size,
//           height: size,
//           decoration: BoxDecoration(
//             shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
//             color: color,
//           ),
//         ),
//         const SizedBox(
//           width: 4,
//         ),
//         Text(
//           text,
//           style: TextStyle(
//               fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
//         )
//       ],
//     );
//   }
// }