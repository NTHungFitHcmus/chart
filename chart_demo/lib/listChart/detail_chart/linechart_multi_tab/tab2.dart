import 'package:flutter/material.dart';

class LinechartMultiTab2 extends StatefulWidget {
  const LinechartMultiTab2({ Key? key }) : super(key: key);

  @override
  _LinechartMultiTab2State createState() => _LinechartMultiTab2State();
}

class _LinechartMultiTab2State extends State<LinechartMultiTab2> {
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
          Text("- Chú thích đường"),
        ],
      ),
    );
  }
}