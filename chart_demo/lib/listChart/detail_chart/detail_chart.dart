import 'package:chart_demo/data/list_chart_data.dart';
import 'package:chart_demo/listChart/detail_chart/tab1.dart';
import 'package:chart_demo/listChart/detail_chart/tab2.dart';
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
        
            
            title: Text("Chi tiết" + widget.listChartModel.title ),
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
          
    
        body: TabBarView(children: [
         Tab1(),
         Tab2()
        ],),
      ),
    );
  }
}
