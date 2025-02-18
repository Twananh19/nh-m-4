import 'package:flutter/material.dart';
import 'library_tab/magazine_screen.dart';
import 'library_tab/book_screen.dart';
import 'library_tab/thesis_screen.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Thư viện điện tử",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.blue),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                prefixIcon: Icon(Icons.search, color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryTile(
                    context, "SÁCH", "Các đầu mục sách trong thư viện"),
                _buildCategoryTile(
                    context, "TẠP CHÍ", "Tất cả tạp chí trong thư viện"),
                _buildCategoryTile(context, "LUẬN VĂN LUẬN ÁN",
                    "Các tài liệu về luận văn luận án"),
                _buildCategoryTile(context, "TÀI LIỆU SỐ",
                    "Tất cả các tài liệu số trong thư viện"),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.grey,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "PULIC"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.storage), label: "Thư viện số"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.book), label: "Thư viện điện tử"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
      //   ],
      // ),
    );
  }

  Widget _buildCategoryTile(
      BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        if (title == "SÁCH") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookScreen()), // Chuyển đến BookScreen
          );
        } else if (title == "TẠP CHÍ") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MagazineScreen()), //Chuyển đến MagazineScreen
          );
        } else if (title == "LUẬN VĂN LUẬN ÁN") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ThesisScreen()), //Chuyển đến ThesisScreen
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(title)), // Các mục khác vẫn dùng DetailScreen
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String category;
  DetailScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text("Nội dung của $category"),
      ),
    );
  }
}
