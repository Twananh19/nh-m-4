import 'package:flutter/material.dart';

class ThesisScreen extends StatefulWidget {
  @override
  _ThesisScreenState createState() => _ThesisScreenState();
}

class _ThesisScreenState extends State<ThesisScreen> {
  int _selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LUẬN VĂN LUẬN ÁN",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          _buildPagination(),
          Expanded(
            child: ListView(
              children: _buildThesisList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(10, (index) {
        int pageNumber = index + 1;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  _selectedPage == pageNumber ? Colors.blue : Colors.grey[300],
              foregroundColor:
                  _selectedPage == pageNumber ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _selectedPage = pageNumber;
              });
            },
            child: Text("$pageNumber"),
          ),
        );
      }),
    );
  }

  List<Widget> _buildThesisList() {
    List<Map<String, String>> theses = [
      {
        "title": "Hoàn thiện công tác giám sát thực hiện dự án...",
        "author": "Vũ, Văn Hoàng | Ngô, Thị Thanh Vân",
        "status": "Sẵn sàng cho tham khảo"
      },
      {
        "title": "Giải pháp nâng cao hiệu quả công tác quản lý...",
        "author": "Hà, Trung Dũng | Ngô, Trí Viếng",
        "status": "Sẵn sàng cho tham khảo"
      },
      {
        "title": "Nghiên cứu giải pháp cọc khoan nhồi xử lý...",
        "author": "Lê, Sỹ Điệp | Nguyễn, Văn Lộc",
        "status": "Sẵn sàng cho tham khảo"
      },
      {
        "title": "Nâng cao năng lực quản lý dự án đầu tư...",
        "author": "Bùi, Văn Tân | Ngô, Trí Viếng",
        "status": "Sẵn sàng cho tham khảo"
      },
      {
        "title": "Giải pháp nâng cao chất lượng quản lý dự án...",
        "author": "Đoàn, Trung Lực | Ngô, Trí Viếng",
        "status": "Sẵn sàng cho tham khảo"
      },
    ];

    return theses.map((thesis) {
      return ListTile(
        title: Text(thesis["title"]!,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(thesis["author"]!),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {},
          child: Text("Xem trực tuyến", style: TextStyle(color: Colors.white)),
        ),
      );
    }).toList();
  }
}
