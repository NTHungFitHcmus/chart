import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;
import 'dart:math';

class MixchartTab1 extends StatefulWidget {
  const MixchartTab1({ Key? key }) : super(key: key);

  @override
  _MixchartTab1State createState() => _MixchartTab1State();
}

class _MixchartTab1State extends State<MixchartTab1> {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  List<charts.Series>? seriesList;
  bool? animate = false;

  @override
  Widget build(BuildContext context) {
    return new charts.OrdinalComboChart(
      _createSampleData(),
      animate: animate,
      // Configure the default renderer as a bar renderer.
      defaultRenderer: new charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.grouped),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
      secondaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
      domainAxis:
          //new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
          new charts.OrdinalAxisSpec(
            // renderSpec: new charts.NoneRenderSpec(),
            // renderSpec: new charts.SmallTickRendererSpec(

            //   // Tick and Label styling here.
            //   labelStyle: new charts.TextStyleSpec(
            //       fontSize: 18, // size in Pts.
            //       color: charts.MaterialPalette.black),

            //   // Change the line colors to match text color.
            //   lineStyle: new charts.LineStyleSpec(
            //       color: charts.MaterialPalette.black)),
            viewport: new charts.OrdinalViewport('', 10),
          // charts.OrdinalAxisSpec(
          //     renderSpec: charts.SmallTickRendererSpec(labelRotation: 0),
       ),
      // Custom renderer configuration for the line series. This will be used for
      // any series that does not define a rendererIdKey.
      customSeriesRenderers: [
        new charts.LineRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customLine')
      ],
      behaviors: [
        new charts.SeriesLegend(),
        // new charts.SlidingViewport(),
        new charts.PanAndZoomBehavior(),
      ],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('1', 5),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 100),
      new OrdinalSales('4', 75),
      new OrdinalSales('5', 80),
      new OrdinalSales('6', 5),
      new OrdinalSales('7', 25),
      new OrdinalSales('8', 100),
      new OrdinalSales('9', 75),
      new OrdinalSales('10', 80),
      new OrdinalSales('11', 5),
      new OrdinalSales('12', 25),
      new OrdinalSales('13', 100),
      new OrdinalSales('14', 75),
      new OrdinalSales('15', 80),
      new OrdinalSales('16', 5),
      new OrdinalSales('17', 25),
      new OrdinalSales('18', 100),
      new OrdinalSales('19', 75),
      new OrdinalSales('20', 80),
      new OrdinalSales('21', 5),
      new OrdinalSales('22', 25),
      new OrdinalSales('23', 100),
      new OrdinalSales('24', 75),
      new OrdinalSales('25', 80),
      new OrdinalSales('26', 5),
      new OrdinalSales('27', 25),
      new OrdinalSales('28', 100),
      new OrdinalSales('29', 75),
      new OrdinalSales('30', 80),
      new OrdinalSales('31', 5),
      new OrdinalSales('32', 25),
      new OrdinalSales('33', 100),
      new OrdinalSales('34', 75),
      new OrdinalSales('35', 80),
      new OrdinalSales('36', 5),
      new OrdinalSales('37', 25),
      new OrdinalSales('38', 100),
      new OrdinalSales('39', 75),
      new OrdinalSales('40', 80),
      new OrdinalSales('41', 5),
      new OrdinalSales('42', 25),
      new OrdinalSales('43', 100),
      new OrdinalSales('44', 75),
      new OrdinalSales('45', 80),
      new OrdinalSales('46', 5),
      new OrdinalSales('47', 25),
      new OrdinalSales('48', 100),
      new OrdinalSales('49', 75),
      new OrdinalSales('50', 80),
    ];

    final tableSalesData = [
      new OrdinalSales('1', 5),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 100),
      new OrdinalSales('4', 75),
      new OrdinalSales('5', 80),
      new OrdinalSales('6', 5),
      new OrdinalSales('7', 25),
      new OrdinalSales('8', 100),
      new OrdinalSales('9', 75),
      new OrdinalSales('10', 80),
      new OrdinalSales('11', 5),
      new OrdinalSales('12', 25),
      new OrdinalSales('13', 100),
      new OrdinalSales('14', 75),
      new OrdinalSales('15', 80),
      new OrdinalSales('16', 5),
      new OrdinalSales('17', 25),
      new OrdinalSales('18', 100),
      new OrdinalSales('19', 75),
      new OrdinalSales('20', 80),
      new OrdinalSales('21', 5),
      new OrdinalSales('22', 25),
      new OrdinalSales('23', 100),
      new OrdinalSales('24', 75),
      new OrdinalSales('25', 80),
      new OrdinalSales('26', 5),
      new OrdinalSales('27', 25),
      new OrdinalSales('28', 100),
      new OrdinalSales('29', 75),
      new OrdinalSales('30', 80),
      new OrdinalSales('31', 5),
      new OrdinalSales('32', 25),
      new OrdinalSales('33', 100),
      new OrdinalSales('34', 75),
      new OrdinalSales('35', 80),
      new OrdinalSales('36', 5),
      new OrdinalSales('37', 25),
      new OrdinalSales('38', 100),
      new OrdinalSales('39', 75),
      new OrdinalSales('40', 80),
      new OrdinalSales('41', 5),
      new OrdinalSales('42', 25),
      new OrdinalSales('43', 100),
      new OrdinalSales('44', 75),
      new OrdinalSales('45', 80),
      new OrdinalSales('46', 5),
      new OrdinalSales('47', 25),
      new OrdinalSales('48', 100),
      new OrdinalSales('49', 75),
      new OrdinalSales('50', 80),
    ];

    final mobileSalesData = [
      new OrdinalSales('1', 6),
      new OrdinalSales('2', 5),
      new OrdinalSales('3', 8),
      new OrdinalSales('4', 11),
      new OrdinalSales('5', 15),
      new OrdinalSales('6', 10),
      new OrdinalSales('7', 12),
      new OrdinalSales('8', 18),
      new OrdinalSales('9', 18),
      new OrdinalSales('10', 20),
      new OrdinalSales('11', 6),
      new OrdinalSales('12', 5),
      new OrdinalSales('13', 8),
      new OrdinalSales('14', 11),
      new OrdinalSales('15', 15),
      new OrdinalSales('16', 10),
      new OrdinalSales('17', 12),
      new OrdinalSales('18', 18),
      new OrdinalSales('19', 18),
      new OrdinalSales('20', 20),
      new OrdinalSales('21', 6),
      new OrdinalSales('22', 5),
      new OrdinalSales('23', 8),
      new OrdinalSales('24', 11),
      new OrdinalSales('25', 15),
      new OrdinalSales('26', 10),
      new OrdinalSales('27', 12),
      new OrdinalSales('28', 18),
      new OrdinalSales('29', 18),
      new OrdinalSales('30', 20),
      new OrdinalSales('31', 6),
      new OrdinalSales('32', 5),
      new OrdinalSales('33', 8),
      new OrdinalSales('34', 11),
      new OrdinalSales('35', 15),
      new OrdinalSales('36', 10),
      new OrdinalSales('37', 12),
      new OrdinalSales('38', 18),
      new OrdinalSales('39', 18),
      new OrdinalSales('40', 20),
      new OrdinalSales('41', 6),
      new OrdinalSales('42', 5),
      new OrdinalSales('43', 8),
      new OrdinalSales('44', 11),
      new OrdinalSales('45', 15),
      new OrdinalSales('46', 10),
      new OrdinalSales('47', 12),
      new OrdinalSales('48', 18),
      new OrdinalSales('49', 18),
      new OrdinalSales('50', 20),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Desktop',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData),
      new charts.Series<OrdinalSales, String>(
          id: 'Tablet',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesData),
      new charts.Series<OrdinalSales, String>(
          id: 'Mobile ',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          strokeWidthPxFn: (OrdinalSales sales, _) => 3,
          data: mobileSalesData)
        // Configure our custom line renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customLine')
        ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}