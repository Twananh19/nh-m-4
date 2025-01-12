import 'package:flutter/material.dart';

class DigitalLibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('Link đến cơ sở dữ liệu sách 1')),
        ListTile(title: Text('Link đến cơ sở dữ liệu sách 2')),
        // Thêm các mục liên kết khác ở đây
      ],
    );
  }
}
