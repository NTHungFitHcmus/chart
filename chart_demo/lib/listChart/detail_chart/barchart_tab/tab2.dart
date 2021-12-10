import 'package:flutter/material.dart';

class BarchartTab2 extends StatefulWidget {
  const BarchartTab2({ Key? key }) : super(key: key);

  @override
  _BarchartTab2State createState() => _BarchartTab2State();
}

class _BarchartTab2State extends State<BarchartTab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("- Giới hạn số lượng cột 1 màn hình"),
          Text("- Kéo để xem thêm cột"),
          Text("- Màu, độ dày cột"),
          Text("- Màu chữ"),
          Text("- Xoay ngang dọc"),
          Text("- Ẩn hiện title cột hàng"),
          Text("- Sự kiện (show dialog) khi click cột"),
          Text("- Nghiêng title"),
          Text("- Vạch kẻ của cột hàng"),
          Text("- Zoom thêm bớt cột"),
        ],
      ),
    );
  }
}