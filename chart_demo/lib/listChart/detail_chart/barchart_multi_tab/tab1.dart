import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;
import 'dart:math';

class BarchartMultiTab1 extends StatefulWidget {
  const BarchartMultiTab1({ Key? key }) : super(key: key);

  @override
  _BarchartMultiTab1State createState() => _BarchartMultiTab1State();
}

class _BarchartMultiTab1State extends State<BarchartMultiTab1> {
  List<charts.Series>? seriesList;
  bool? animate = false;

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _createSampleData(),
      animate: true,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
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
      // primaryMeasureAxis: new charts.NumericAxisSpec(
      //     renderSpec: new charts.GridlineRendererSpec(

      //         // Tick and Label styling here.
      //         labelStyle: new charts.TextStyleSpec(
      //             fontSize: 18, // size in Pts.
      //             color: charts.MaterialPalette.black),

      //         // Change the line colors to match text color.
      //         lineStyle: new charts.LineStyleSpec(
      //             color: charts.MaterialPalette.black))), 
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(
        // Display the measure axis labels below the gridline.
        //
        // 'Before' & 'after' follow the axis value direction.
        // Vertical axes draw 'before' below & 'after' above the tick.
        // Horizontal axes draw 'before' left & 'after' right the tick.
        labelAnchor: charts.TickLabelAnchor.before,

        // Left justify the text in the axis.
        //
        // Note: outside means that the secondary measure axis would right
        // justify.
        labelJustification: charts.TickLabelJustification.outside,
      )),
      behaviors: [
        new charts.SeriesLegend(),
        // new charts.SlidingViewport(),
        new charts.InitialHintBehavior(maxHintTranslate: 4.0),
        new charts.PanAndZoomBehavior(),
        // new charts.LinePointHighlighter(
        //   symbolRenderer: CustomCircleSymbolRenderer()  // add this line in behaviours
        // )
      ],
      selectionModels:[
        charts.SelectionModelConfig(
          changedListener: (model) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert(model.selectedSeries[0].domainFn(model.selectedDatum[0].index) + ' '
                   + model.selectedSeries[0].domainFn(model.selectedDatum[1].index).toString());
              },
            );
      //       // showtool(
      //       //   context: context,
      //       //   builder: (context){
      //       //     return Tooltip(message: model.selectedSeries[0].domainFn(model.selectedDatum[0].index) + ' '
      //       //       + model.selectedSeries[0].measureFn(model.selectedDatum[0].index).toString());
      //       //   }
      //       // );
      //       // if(model.hasDatumSelection){
      //       //   String value = model.selectedSeries[0].domainFn(model.selectedDatum[0].index) + ' '
      //       //       + model.selectedSeries[0].measureFn(model.selectedDatum[0].index).toString();
      //       //   CustomCircleSymbolRenderer.value = value;
      //       // }
          },
        ),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
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
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.year}: \$${sales.sales.toString()}',
          colorFn: (OrdinalSales sales, _) => charts.Color.fromHex(code: '#ABCABC'),
          // fillColorFn: (OrdinalSales sales, _) => charts.Color.fromHex(code: '#DEFDEF'),
      ),
      new charts.Series<OrdinalSales, String>(
          id: 'Marketing',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.year}: \$${sales.sales.toString()}',
          colorFn: (OrdinalSales sales, _) => charts.Color.fromHex(code: '#ACACAC'),
          // fillColorFn: (OrdinalSales sales, _) => charts.Color.fromHex(code: '#DEFDEF'),
      ),
    ];
  }
}

AlertDialog alert(String text) => AlertDialog(
    title: Text("My title"),
    content: Text(text),
  );

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
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