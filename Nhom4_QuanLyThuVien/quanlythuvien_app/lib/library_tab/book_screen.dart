import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _totalPages = 10;

  final List<Book> books = [
    Book(
      title: "Môi trường và phát triển bền vững",
      author: "Nguyễn Đình Hòa",
      status: "Không sẵn sàng: Hư hỏng (1)",
      isOnline: true,
    ),
    Book(
      title:
          "Công nghệ sinh học: Dùng cho sinh viên ĐH, CĐ chuyên và không chuyên ngành",
      author: "Vũ Văn Vụ | Lê Hồng Điệp | Nguyễn Mộng Hùng",
      status:
          "Sẵn sàng cho tham khảo: Library and Information Center of Phenikaa University",
      isOnline: false,
    ),
    Book(
      title: "Công nghệ xử lí nước thải bằng biện pháp sinh học",
      author: "Lương Đức Phẩm",
      status:
          "Sẵn sàng mượn: Library and Information Center of Phenikaa University",
      isOnline: false,
    ),
    Book(
      title: "Tuyến điểm du lịch Việt Nam",
      author: "Bùi Thị Hải Yến",
      status:
          "Sẵn sàng cho tham khảo: Library and Information Center of Phenikaa University",
      isOnline: true,
    ),
    Book(
      title: "Cẩm nang quản lý môi trường",
      author: "Lưu Đức Hải [Chủ biên] | Phạm Thị Việt Anh",
      status:
          "Sẵn sàng cho tham khảo: Library and Information Center of Phenikaa University",
      isOnline: false,
    ),
  ];

  void _changePage(int newPage) {
    if (newPage >= 1 && newPage <= _totalPages) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "SÁCH",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Thanh tìm kiếm
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Tìm kiếm",
                      prefixIcon: Icon(Icons.menu, color: Colors.black),
                      suffixIcon: Icon(Icons.search, color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.filter_list, color: Colors.black),
              ],
            ),
            SizedBox(height: 10),

            // Thanh phân trang
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => _changePage(_currentPage - 1),
                ),
                for (int i = 1; i <= _totalPages; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      onTap: () => _changePage(i),
                      child: CircleAvatar(
                        backgroundColor:
                            i == _currentPage ? Colors.grey[300] : Colors.white,
                        child: Text(
                          "$i",
                          style: TextStyle(
                            color:
                                i == _currentPage ? Colors.black : Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () => _changePage(_currentPage + 1),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Danh sách sách
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Nếu muốn mở màn hình mới khi bấm vào sách, thêm Navigator.push() tại đây
                          },
                          child: Text(
                            book.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          book.author,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Trạng thái: ${book.status}",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        if (book.isOnline)
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                // Xử lý mở sách online tại đây
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Xem trực tuyến"),
                            ),
                          ),
                        Divider(thickness: 1, color: Colors.grey[300]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Lớp dữ liệu Book
class Book {
  final String title;
  final String author;
  final String status;
  final bool isOnline;

  Book({
    required this.title,
    required this.author,
    required this.status,
    required this.isOnline,
  });
}
