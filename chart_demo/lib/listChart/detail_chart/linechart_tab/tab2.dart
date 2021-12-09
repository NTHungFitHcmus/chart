import 'package:flutter/material.dart';

class LinechartTab2 extends StatefulWidget {
  const LinechartTab2({ Key? key }) : super(key: key);

  @override
  _LinechartTab2State createState() => _LinechartTab2State();
}

class _LinechartTab2State extends State<LinechartTab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("- Giới hạn khoảng thời gian 1 màn hình"),
          Text("- Kéo để xem thêm đường"),
          Text("- Màu đường"),
          Text("- Màu chữ"),
          Text("- Sự kiện (show dialog) khi click đường"),
        ],
      ),
    );
  }
}