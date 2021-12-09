import 'package:chart_demo/listChart/list_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHART',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        appBar: AppBar(title: Text("Chart demo"),),
        
        body: ListChart()),
    );
  }
}



