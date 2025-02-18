import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  final String title;

  ComingSoonScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: Text('$title đang được phát triển',
              style: TextStyle(fontSize: 18))),
    );
  }
}
