import 'package:flutter/material.dart';
import 'myClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thư viện Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Danh sách sách mẫu
  final List<Book> books = [
    Book(bookId: 1, title: 'Dart Programming', author: 'John Doe', genre: 'Programming'),
    Book(bookId: 2, title: 'Flutter for Beginners', author: 'Jane Smith', genre: 'Mobile Development'),
    Book(bookId: 3, title: 'Effective Dart', author: 'Bob Johnson', genre: 'Programming'),
  ];

  // Người dùng mẫu
  final User user = User(
    userId: 1,
    name: 'Nguyen Van A',
    email: 'nguyenvana@gmail.com',
    password: '123456',
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thư viện Online'),
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeTab(),
          _buildLibraryTab(),
          _buildUserTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Thư Viện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Người Dùng',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return Center(
      child: Text(
        'Chào mừng đến với Thư viện Online!',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLibraryTab() {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          leading: Icon(Icons.book, color: Colors.blue),
          title: Text(book.title),
          subtitle: Text('Tác giả: ${book.author}'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(book.title),
                content: Text('Thể loại: ${book.genre}\nTác giả: ${book.author}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Đóng'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildUserTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Thông tin người dùng:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Tên: ${user.name}'),
          Text('Email: ${user.email}'),
        ],
      ),
    );
  }
}
