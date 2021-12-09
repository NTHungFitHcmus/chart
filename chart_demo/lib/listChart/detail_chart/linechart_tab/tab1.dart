import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;
import 'dart:math';

class LinechartTab1 extends StatefulWidget {
  const LinechartTab1({ Key? key }) : super(key: key);

  @override
  _LinechartTab1State createState() => _LinechartTab1State();
}

class _LinechartTab1State extends State<LinechartTab1> {
  List<charts.Series>? seriesList;
  bool? animate = false;

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      _createSampleData(),
      animate: true,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      domainAxis: new charts.DateTimeAxisSpec(
          viewport: charts.DateTimeExtents(start: DateTime(2017, 9, 19), end: DateTime(2017, 10, 19))
      ),
      behaviors: [
        // new charts.SeriesLegend(),
        // new charts.SlidingViewport(),
        new charts.PanAndZoomBehavior(),
        new charts.LinePointHighlighter(
          symbolRenderer: CustomCircleSymbolRenderer()  // add this line in behaviours
        ),
      ],
      selectionModels:[
        charts.SelectionModelConfig(
          changedListener: (model) {
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return alert(model.selectedSeries[0].domainFn(model.selectedDatum[0].index) + ' '
            //        + model.selectedSeries[0].domainFn(model.selectedDatum[1].index).toString());
            //   },
            // );
            if(model.hasDatumSelection){
              String value = model.selectedSeries[0].domainFn(model.selectedDatum[0].index).toUtc().toString() + '---'
                  + model.selectedSeries[0].measureFn(model.selectedDatum[0].index).toString();
              CustomCircleSymbolRenderer.value = value;
            }
          },
        ),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
      new TimeSeriesSales(new DateTime(2017, 10, 15), 75),
      new TimeSeriesSales(new DateTime(2017, 10, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 11, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 11, 10), 75),
      new TimeSeriesSales(new DateTime(2017, 11, 15), 75),
      new TimeSeriesSales(new DateTime(2017, 11, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 11, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 12, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 12, 10), 75),
      new TimeSeriesSales(new DateTime(2017, 12, 15), 75),
      new TimeSeriesSales(new DateTime(2017, 12, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 12, 26), 25),
      new TimeSeriesSales(new DateTime(2018, 1, 3), 100),
      new TimeSeriesSales(new DateTime(2018, 1, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 1, 15), 75),
      new TimeSeriesSales(new DateTime(2018, 1, 19), 5),
      new TimeSeriesSales(new DateTime(2018, 1, 26), 25),
      new TimeSeriesSales(new DateTime(2018, 2, 3), 100),
      new TimeSeriesSales(new DateTime(2018, 2, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 2, 15), 75),
      new TimeSeriesSales(new DateTime(2018, 2, 19), 5),
      new TimeSeriesSales(new DateTime(2018, 2, 26), 25),
      new TimeSeriesSales(new DateTime(2018, 3, 3), 100),
      new TimeSeriesSales(new DateTime(2018, 3, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 3, 15), 75),
      new TimeSeriesSales(new DateTime(2018, 3, 19), 5),
      new TimeSeriesSales(new DateTime(2018, 3, 26), 25),
      new TimeSeriesSales(new DateTime(2018, 4, 3), 100),
      new TimeSeriesSales(new DateTime(2018, 4, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 4, 15), 75),
      new TimeSeriesSales(new DateTime(2018, 4, 19), 5),
      new TimeSeriesSales(new DateTime(2018, 4, 26), 25),
      new TimeSeriesSales(new DateTime(2018, 5, 3), 100),
      new TimeSeriesSales(new DateTime(2018, 5, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 5, 15), 75),
      new TimeSeriesSales(new DateTime(2018, 5, 19), 5),
      new TimeSeriesSales(new DateTime(2018, 5, 26), 25),
      new TimeSeriesSales(new DateTime(2018, 6, 3), 100),
      new TimeSeriesSales(new DateTime(2018, 6, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 6, 15), 75),
      new TimeSeriesSales(new DateTime(2018, 6, 19), 5),
      new TimeSeriesSales(new DateTime(2018, 6, 26), 25),
      new TimeSeriesSales(new DateTime(2018, 7, 3), 100),
      new TimeSeriesSales(new DateTime(2018, 7, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 7, 15), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class CustomCircleSymbolRenderer extends charts.CircleSymbolRenderer {
  static String? value;
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int>? dashPattern, charts.Color? fillColor, charts.FillPatternType? fillPattern, charts.Color? strokeColor, double? strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
      Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10, bounds.height + 10),
      fill: charts.Color.white
    );
    var textStyle = style.TextStyle();
    textStyle.color = charts.Color.black;
    textStyle.fontSize = 15;
    canvas.drawText(
      TextElement("$value", style: textStyle),
        (bounds.left).round(),
        (bounds.top - 28).round()
    );
  }
}