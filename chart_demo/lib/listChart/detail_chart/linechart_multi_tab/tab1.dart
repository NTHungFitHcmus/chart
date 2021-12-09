import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;
import 'dart:math';

class LinechartMultiTab1 extends StatefulWidget {
  const LinechartMultiTab1({ Key? key }) : super(key: key);

  @override
  _LinechartMultiTab1State createState() => _LinechartMultiTab1State();
}

class _LinechartMultiTab1State extends State<LinechartMultiTab1> {
  List<charts.Series>? seriesList;
  bool? animate = false;
  static List? selectedDatum = [];
  static String? unit = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        charts.SeriesLegend(
          position: charts.BehaviorPosition.top,
          horizontalFirst: false,
          desiredMaxRows: 2,
          cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
        ),
        charts.SelectNearest(
          eventTrigger: charts.SelectionTrigger.tapAndDrag
        ),
        charts.LinePointHighlighter(
          symbolRenderer: CustomCircleSymbolRenderer(size: size),
        ),
        
      ],
      selectionModels:[
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: (charts.SelectionModel model) {
            if (model.hasDatumSelection) {
              selectedDatum = [];
              model.selectedDatum.forEach((charts.SeriesDatum datumPair) {
                selectedDatum!.add({
                  'color': datumPair.series.colorFn!(0),
                  'text': '${datumPair.datum.time}: ${datumPair.datum.sales}'
                });
              });
            }
          }
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

    final data2 = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 10),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 15),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 80),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 60),
      new TimeSeriesSales(new DateTime(2017, 10, 15), 50),
      new TimeSeriesSales(new DateTime(2017, 10, 19), 50),
      new TimeSeriesSales(new DateTime(2017, 10, 26), 50),
      new TimeSeriesSales(new DateTime(2017, 11, 3), 50),
      new TimeSeriesSales(new DateTime(2017, 11, 10), 50),
      new TimeSeriesSales(new DateTime(2017, 11, 15), 50),
      new TimeSeriesSales(new DateTime(2017, 11, 19), 50),
      new TimeSeriesSales(new DateTime(2017, 11, 26), 50),
      new TimeSeriesSales(new DateTime(2017, 12, 3), 50),
      new TimeSeriesSales(new DateTime(2017, 12, 10), 50),
      new TimeSeriesSales(new DateTime(2017, 12, 15), 50),
      new TimeSeriesSales(new DateTime(2017, 12, 19), 50),
      new TimeSeriesSales(new DateTime(2017, 12, 26), 50),
      new TimeSeriesSales(new DateTime(2018, 1, 3), 80),
      new TimeSeriesSales(new DateTime(2018, 1, 10), 80),
      new TimeSeriesSales(new DateTime(2018, 1, 15), 75),
      new TimeSeriesSales(new DateTime(2018, 1, 19), 80),
      new TimeSeriesSales(new DateTime(2018, 1, 26), 80),
      new TimeSeriesSales(new DateTime(2018, 2, 3), 80),
      new TimeSeriesSales(new DateTime(2018, 2, 10), 80),
      new TimeSeriesSales(new DateTime(2018, 2, 15), 80),
      new TimeSeriesSales(new DateTime(2018, 2, 19), 80),
      new TimeSeriesSales(new DateTime(2018, 2, 26), 80),
      new TimeSeriesSales(new DateTime(2018, 3, 3), 80),
      new TimeSeriesSales(new DateTime(2018, 3, 10), 80),
      new TimeSeriesSales(new DateTime(2018, 3, 15), 80),
      new TimeSeriesSales(new DateTime(2018, 3, 19), 80),
      new TimeSeriesSales(new DateTime(2018, 3, 26), 80),
      new TimeSeriesSales(new DateTime(2018, 4, 3), 80),
      new TimeSeriesSales(new DateTime(2018, 4, 10), 80),
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
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Marketing',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data2,
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
  final size;

  CustomCircleSymbolRenderer({ this.size });

  @override
  void paint(charts.ChartCanvas canvas, Rectangle bounds, {
    List<int>? dashPattern,
    charts.Color? fillColor,
    charts.FillPatternType? fillPattern,
    charts.Color? strokeColor,
    double? strokeWidthPx
  }) {
    super.paint(
      canvas,
      bounds,
      dashPattern: dashPattern,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidthPx: strokeWidthPx
    );

    List tooltips = _LinechartMultiTab1State.selectedDatum!;
    String unit = _LinechartMultiTab1State.unit!;
    if (tooltips != null && tooltips.length > 0) {
      num tipTextLen = (tooltips[0]['text'] + unit).length;
      num rectWidth = bounds.width + tipTextLen * 8.3;
      num rectHeight = bounds.height + 20 + (tooltips.length - 1) * 18;
      num left = bounds.left > (size?.width ?? 300) / 2
        ? (bounds.left > size?.width / 4 ? bounds.left - rectWidth : bounds.left - rectWidth / 2)
        : bounds.left - 40;

      canvas.drawRect(
        Rectangle(left, 0, rectWidth, rectHeight),
        fill: charts.Color.fromHex(code: '#666666')
      );

      for (int i = 0; i < tooltips.length; i++) {
        canvas.drawPoint(
          point: Point(left.round() + 8, (i + 1) * 15),
          radius: 3,
          fill: tooltips[i]['color'],
          stroke: charts.Color.white,
          strokeWidthPx: 1,
        );
        style.TextStyle textStyle = style.TextStyle();
        textStyle.color = charts.Color.white;
        textStyle.fontSize = 13;
        canvas.drawText(TextElement(tooltips[i]['text'] + unit, style: textStyle), left.round() + 15, i * 15 + 8);
      }
    }
  }
}