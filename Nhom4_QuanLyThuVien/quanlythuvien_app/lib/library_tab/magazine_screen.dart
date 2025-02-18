import 'package:flutter/material.dart';

class MagazineScreen extends StatelessWidget {
  final List<Map<String, String>> magazines = [
    {
      'title': 'Nhà quản lý = The manager magazine. Số 3 - Tháng 5 năm 2019',
      'author': 'Viện Nghiên cứu và đào tạo về quản lý',
      'status': 'Sẵn sàng cho tham khảo: Thư viện Tập đoàn Phenikaa'
    },
    {
      'title': 'Tạp chí Pi / Hội Toán học Việt Nam.',
      'author': 'Hội toán học Việt Nam',
      'status':
          'Sẵn sàng cho tham khảo: Library and Information Center of Phenikaa University'
    },
    {
      'title': 'Tạp chí nghiên cứu dược và thông tin thuốc',
      'author': 'Trường Đại học Dược Hà Nội',
      'status':
          'Sẵn sàng cho tham khảo: Library and Information Center of Phenikaa University'
    },
    {
      'title': 'Hiểu sâu, biết rộng - Kiểu gì cũng thắng',
      'author': 'David Epstein ; Tôn Thất Kỳ Văn dịch',
      'status':
          'Sẵn sàng mượn: Library and Information Center of Phenikaa University'
    },
    {
      'title': 'Viết và xuất bản bài báo khoa học quốc tế',
      'author': 'Peter Mason, Pamela Wright, Lưu Ngọc Hoạt',
      'status':
          'Sẵn sàng cho tham khảo: Library and Information Center of Phenikaa University'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'TẠP CHÍ',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: magazines.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    magazines[index]['title']!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(magazines[index]['author']!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(magazines[index]['status']!),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
