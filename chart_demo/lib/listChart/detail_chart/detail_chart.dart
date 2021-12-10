import 'package:chart_demo/data/list_chart_data.dart';
import 'package:chart_demo/listChart/detail_chart/barchart_multi_tab/tab1.dart';
import 'package:chart_demo/listChart/detail_chart/barchart_multi_tab/tab2.dart';
import 'package:chart_demo/listChart/detail_chart/barchart_tab/tab1.dart';
import 'package:chart_demo/listChart/detail_chart/barchart_tab/tab2.dart';
import 'package:chart_demo/listChart/detail_chart/linechart_multi_tab/tab1.dart';
import 'package:chart_demo/listChart/detail_chart/linechart_multi_tab/tab2.dart';
import 'package:chart_demo/listChart/detail_chart/linechart_tab/tab1.dart';
import 'package:chart_demo/listChart/detail_chart/linechart_tab/tab2.dart';
import 'package:chart_demo/listChart/detail_chart/mixchart_tab/tab1.dart';
import 'package:chart_demo/listChart/detail_chart/mixchart_tab/tab2.dart';
import 'package:chart_demo/listChart/detail_chart/piechart_tab/tab1.dart';
import 'package:chart_demo/listChart/detail_chart/piechart_tab/tab2.dart';
import 'package:flutter/material.dart';

class DetailChart extends StatefulWidget {
  DetailChart({Key? key, required this.listChartModel}) : super(key: key);

  ListChartModel listChartModel;

  @override
  _DetailChartState createState() => _DetailChartState();
}

class _DetailChartState extends State<DetailChart> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
        
            
            title: Text("Chi tiết " + widget.listChartModel.title ),
              bottom: TabBar(
              indicatorColor: Colors.orangeAccent,
              
              tabs: <Widget>[
                Tab(
                  text:"Chi tiết",
                ),
                Tab(
                  text:"Custom chart",
                ),
              ],
              labelStyle: TextStyle(fontSize: 16,),
            ),
          ),
          
    
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            if (widget.listChartModel.title == 'Horizontal barchart')
              BarchartTab1(),
            if (widget.listChartModel.title == 'Horizontal barchart')
              BarchartTab2(),
            if (widget.listChartModel.title == 'Horizontal barchart multi')
              BarchartMultiTab1(),
            if (widget.listChartModel.title == 'Horizontal barchart multi')
              BarchartMultiTab2(),
            if (widget.listChartModel.title == 'Linechart')
              LinechartTab1(),
            if (widget.listChartModel.title == 'Linechart')
              LinechartTab2(),
            if (widget.listChartModel.title == 'Linechart multi')
              LinechartMultiTab1(),
            if (widget.listChartModel.title == 'Linechart multi')
              LinechartMultiTab2(),
            if (widget.listChartModel.title == 'Piechart')
              PiechartTab1(),
            if (widget.listChartModel.title == 'Piechart')
              PiechartTab2(),
            if (widget.listChartModel.title == 'Mix barchart and linechart')
              MixchartTab1(),
            if (widget.listChartModel.title == 'Mix barchart and linechart')
              MixchartTab2(),
          ],
        ),
      ),
    );
  }
}
