import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const Text(
              '2',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text('Hello'),
            const Text('[1, hello, 2, goodbye]'),
            Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                  child: const Center(child: Text('Red')),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('Green')),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('Blue')),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.cyan,
                  child: const Center(child: Text('Cyan')),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
