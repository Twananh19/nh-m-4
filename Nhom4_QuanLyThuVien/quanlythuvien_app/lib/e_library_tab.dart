import 'package:flutter/material.dart';

class ELibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('Sách')),
        ListTile(title: Text('Tạp chí')),
        ListTile(title: Text('Luận văn - Luận án')),
        ListTile(title: Text('Tài liệu số')),
      ],
    );
  }
}
