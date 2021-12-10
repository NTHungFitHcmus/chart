import 'package:flutter/material.dart';

class PiechartTab2 extends StatefulWidget {
  const PiechartTab2({ Key? key }) : super(key: key);

  @override
  _PiechartTab2State createState() => _PiechartTab2State();
}

class _PiechartTab2State extends State<PiechartTab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("- Màu miền"),
          Text("- Màu chữ"),
          Text("- Nhiều miền sẽ khó hiển thị thông tin trên biểu đồ"),
          Text("- Chú thích miền (xài thư viện bị giới hạn hiển thị số lượng chú thích, nhiều thì nên custom thêm bằng widget bên ngoài thủ công hoặc thư viện khác)"),
          Text("- Sự kiện (show dialog) khi click miền"),
        ],
      ),
    );
  }
}