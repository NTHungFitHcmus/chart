import 'package:flutter/material.dart';

class MixchartTab2 extends StatefulWidget {
  const MixchartTab2({ Key? key }) : super(key: key);

  @override
  _MixchartTab2State createState() => _MixchartTab2State();
}

class _MixchartTab2State extends State<MixchartTab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("- Giới hạn khoảng trong 1 màn hình"),
          Text("- Kéo để xem thêm đường, cột"),
          Text("- Màu, độ dày đường, cột"),
          Text("- Màu chữ"),
          Text("- Sự kiện (show dialog) khi click đường"),
          Text("- Zoom thêm bớt đường, cột"),  
          Text("- Thêm đơn vị thứ 3"),
        ],
      ),
    );
  }
}