import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _pageSize = 5; // Số sách hiển thị mỗi trang

  // Tham chiếu đến collection "books" trên Firestore
  final CollectionReference booksCollection =
  FirebaseFirestore.instance.collection('books');

  // Hàm thay đổi trang (pagination)
  void _changePage(int newPage, int totalPages) {
    if (newPage >= 1 && newPage <= totalPages) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  // Dialog thêm sách
  Future<void> _showAddBookDialog() async {
    final titleController = TextEditingController();
    final authorController = TextEditingController();
    final statusController = TextEditingController();
    bool isOnline = false;

    return showDialog(
      context: context,
      builder: (context) {
        // Sử dụng StatefulBuilder để cập nhật trạng thái trong dialog (cho Switch)
        return StatefulBuilder(builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text("Thêm Sách"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Tiêu đề"),
                  ),
                  TextField(
                    controller: authorController,
                    decoration: InputDecoration(labelText: "Tác giả"),
                  ),
                  TextField(
                    controller: statusController,
                    decoration: InputDecoration(labelText: "Số lượng"),
                  ),
                  Row(
                    children: [
                      Text("Online?"),
                      Switch(
                        value: isOnline,
                        onChanged: (val) {
                          setStateDialog(() {
                            isOnline = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Hủy"),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (titleController.text.isEmpty ||
                      authorController.text.isEmpty ||
                      statusController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")),
                    );
                    return;
                  }
                  try {
                    await booksCollection.add({
                      'title': titleController.text,
                      'author': authorController.text,
                      'status': statusController.text,
                      'isOnline': isOnline,
                      'createdAt': FieldValue.serverTimestamp(),
                    });
                    Navigator.pop(context);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Lỗi khi thêm sách: $error")),
                    );
                  }
                },
                child: Text("Thêm"),
              ),
            ],
          );
        });
      },
    );
  }

  // Dialog sửa sách
  Future<void> _showEditBookDialog(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    final titleController = TextEditingController(text: data['title'] ?? '');
    final authorController = TextEditingController(text: data['author'] ?? '');
    final statusController = TextEditingController(text: data['status'] ?? '');
    bool isOnline = data['isOnline'] ?? false;

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text("Sửa Sách"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Tiêu đề"),
                  ),
                  TextField(
                    controller: authorController,
                    decoration: InputDecoration(labelText: "Tác giả"),
                  ),
                  TextField(
                    controller: statusController,
                    decoration: InputDecoration(labelText: "Số lượng"),
                  ),
                  Row(
                    children: [
                      Text("Online?"),
                      Switch(
                        value: isOnline,
                        onChanged: (val) {
                          setStateDialog(() {
                            isOnline = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Hủy"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await booksCollection.doc(doc.id).update({
                      'title': titleController.text,
                      'author': authorController.text,
                      'status': statusController.text,
                      'isOnline': isOnline,
                    });
                    Navigator.pop(context);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Lỗi khi sửa sách: $error")),
                    );
                  }
                },
                child: Text("Lưu"),
              ),
            ],
          );
        });
      },
    );
  }

  // Dialog xác nhận xóa sách
  Future<void> _deleteBook(String docId) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Xóa Sách"),
          content: Text("Bạn có chắc muốn xóa sách này không?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Hủy"),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await booksCollection.doc(docId).delete();
                  Navigator.pop(context);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Lỗi khi xóa sách: $error")),
                  );
                }
              },
              child: Text("Xóa"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SÁCH",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.orange),
            onPressed: () {
              // Xử lý tìm kiếm nếu cần
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: booksCollection.orderBy('createdAt', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Lỗi: ${snapshot.error}"));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final allBooks = snapshot.data!.docs;
            // Lọc theo tìm kiếm (theo tiêu đề)
            String searchQuery = _searchController.text.toLowerCase();
            List<DocumentSnapshot> filteredBooks = allBooks.where((doc) {
              final data = doc.data() as Map<String, dynamic>? ?? {};
              final title = data['title']?.toString().toLowerCase() ?? '';
              return title.contains(searchQuery);
            }).toList();

            // Phân trang cục bộ
            final int totalBooks = filteredBooks.length;
            final int totalPages = (totalBooks / _pageSize).ceil();
            if (totalPages > 0 && _currentPage > totalPages) {
              _currentPage = totalPages;
            }
            int startIndex = (_currentPage - 1) * _pageSize;
            int endIndex = startIndex + _pageSize;
            if (endIndex > totalBooks) {
              endIndex = totalBooks;
            }
            List<DocumentSnapshot> booksPage = filteredBooks.sublist(startIndex, endIndex);

            return Column(
              children: [
                // Thanh tìm kiếm
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {}); // Cập nhật danh sách khi tìm kiếm
                        },
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
                      onPressed: () => _changePage(_currentPage - 1, totalPages),
                    ),
                    for (int i = 1; i <= totalPages; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: InkWell(
                          onTap: () => _changePage(i, totalPages),
                          child: CircleAvatar(
                            backgroundColor: i == _currentPage ? Colors.grey[300] : Colors.white,
                            child: Text(
                              "$i",
                              style: TextStyle(
                                color: i == _currentPage ? Colors.black : Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () => _changePage(_currentPage + 1, totalPages),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Danh sách sách
                Expanded(
                  child: ListView.builder(
                    itemCount: booksPage.length,
                    itemBuilder: (context, index) {
                      final doc = booksPage[index];
                      final data = doc.data() as Map<String, dynamic>? ?? {};
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Nếu cần mở chi tiết sách
                                    },
                                    child: Text(
                                      data['title'] ?? 'Chưa có tiêu đề',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    if (value == 'edit') {
                                      _showEditBookDialog(doc);
                                    } else if (value == 'delete') {
                                      _deleteBook(doc.id);
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 'edit',
                                      child: Text('Sửa'),
                                    ),
                                    PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Xóa'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(
                              data['author'] ?? '',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Số lượng: ${data['status'] ?? ''}",
                              style: TextStyle(fontSize: 13, color: Colors.black54),
                            ),
                            if (data['isOnline'] == true)
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Xử lý mở sách online nếu cần
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBookDialog,
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}
