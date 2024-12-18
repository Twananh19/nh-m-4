import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2; // Số lần nhấn
  List<dynamic> _messages = [1, "hello", 2, "goodbye"]; // Dữ liệu mẫu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Colors.purple[100],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Hello',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              _messages.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            // Cột màu
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    'Red',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text(
                    'Green',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text(
                    'Blue',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.cyan,
                  alignment: Alignment.center,
                  child: const Text(
                    'Cyan',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
