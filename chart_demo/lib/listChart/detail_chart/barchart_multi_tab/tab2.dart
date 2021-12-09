import 'package:flutter/material.dart';

class BarchartMultiTab2 extends StatefulWidget {
  const BarchartMultiTab2({ Key? key }) : super(key: key);

  @override
  _BarchartMultiTab2State createState() => _BarchartMultiTab2State();
}

class _BarchartMultiTab2State extends State<BarchartMultiTab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("- Giới hạn số lượng cột 1 màn hình"),
          Text("- Kéo để xem thêm cột"),
          Text("- Màu cột"),
          Text("- Màu chữ"),
          Text("- Xoay ngang dọc"),
          Text("- Ẩn hiện title cột hàng"),
          Text("- Sự kiện (show dialog) khi click cột"),
          Text("- Nghiêng title"),
          Text("- Vạch kẻ của cột hàng"),
          Text("- Hiện chú thích 2 cột"),
        ],
      ),
    );
  }
}