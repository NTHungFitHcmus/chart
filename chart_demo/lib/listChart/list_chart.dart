import 'package:chart_demo/data/list_chart_data.dart';
import 'package:chart_demo/listChart/detail_chart/detail_chart.dart';
import 'package:flutter/material.dart';

class ListChart extends StatefulWidget {
  const ListChart({Key? key}) : super(key: key);



  @override
  _ListChartState createState() => _ListChartState();
}

class _ListChartState extends State<ListChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
            Expanded(child: ListView.builder(
              
              itemCount: lstChart.length,
              itemBuilder: (_,index){

              return InkWell(
                onTap: (){
                  print(lstChart[index].title);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailChart(listChartModel: lstChart[index])));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(lstChart[index].title),
                  )),
              );
            })),
            SizedBox(height: 10,)
        ],
      ),
    );
  }
}