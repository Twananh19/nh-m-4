import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Hàm chính để chạy ứng dụng Flutter.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thư viện điện tử', // Tiêu đề của ứng dụng.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Màu chủ đạo của ứng dụng.
      ),
      home: const MyHomePage(), // Giao diện chính của ứng dụng.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Tạo State cho StatefulWidget.
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Biến lưu giá trị bộ đếm.
  final List<dynamic> _list = [1, 'hello', 2, 'goodbye']; // Danh sách các phần tử.

  // Hàm tăng giá trị bộ đếm.
  void _incrementCounter() {
    setState(() {
      _counter++; // Tăng _counter lên 1.
    });
  }

  // Hàm giảm giá trị bộ đếm.
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--; // Giảm _counter xuống 1 nếu lớn hơn 0.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thư viện điện tử'), // Tiêu đề trên AppBar.
        backgroundColor: Colors.purple[100], // Đổi màu nền AppBar thành tím nhạt.
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm phía trên nội dung.
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.purple[100], // Màu nền tím nhạt.
            // child: const Text(
            //   'Flutter Demo Home Page',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search below AppBar', // Placeholder cho thanh tìm kiếm.
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.search), // Biểu tượng tìm kiếm.
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Canh giữa nội dung theo trục dọc.
                children: <Widget>[
                  const Text('You have pushed the button this many times:'), // Dòng hướng dẫn.
                  Text(
                    '$_counter', // Hiển thị giá trị của _counter.
                    style: Theme.of(context).textTheme.headlineMedium, // Dùng kiểu chữ mặc định.
                  ),
                  const Text('Hello'), // Thêm dòng chữ "Hello".
                  Text(
                    _list.toString(), // Hiển thị danh sách _list.
                    style: const TextStyle(fontStyle: FontStyle.italic), // Kiểu chữ in nghiêng.
                  ),
                  const SizedBox(height: 20), // Khoảng cách giữa danh sách và các ô màu.
                  Column(
                    mainAxisSize: MainAxisSize.min, // Chỉ chiếm không gian vừa đủ.
                    children: [
                      _buildColorBox('SÁCH', Colors.red), // Ô màu đỏ.
                      _buildColorBox('TẠP CHÍ', Colors.green), // Ô màu xanh lá.
                      _buildColorBox('LUẬN VĂN LUẬN ÁN', Colors.blue), // Ô màu xanh dương.
                      _buildColorBox('TÀI LIỆU SỐ', Colors.cyan), // Ô màu lục lam.
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Row để đặt hai nút dấu "-" và "+" ngang hàng.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Canh nút về bên phải màn hình.
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter, // Gọi hàm giảm _counter khi bấm nút.
            tooltip: 'Decrement', // Gợi ý khi hover vào nút.
            child: const Icon(Icons.remove), // Icon dấu "-".
          ),
          const SizedBox(width: 10), // Khoảng cách giữa hai nút.
          FloatingActionButton(
            onPressed: _incrementCounter, // Gọi hàm tăng _counter khi bấm nút.
            tooltip: 'Increment', // Gợi ý khi hover vào nút.
            child: const Icon(Icons.add), // Icon dấu "+".
          ),
        ],
      ),
    );
  }

  // Hàm dựng một ô màu với tên và màu sắc truyền vào.
  Widget _buildColorBox(String label, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4), // Khoảng cách giữa các ô màu.
      color: color, // Màu của ô.
      width: 200, // Chiều rộng ô.
      height: 50, // Chiều cao ô.
      child: Center(
        child: Text(
          label, // Hiển thị tên màu.
          style: const TextStyle(color: Colors.white), // Màu chữ là trắng.
        ),
      ),
    );
  }
}

