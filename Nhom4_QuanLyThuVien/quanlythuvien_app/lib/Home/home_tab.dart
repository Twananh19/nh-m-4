import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_tab.dart';
import 'notification_tab.dart';
import 'service_tab.dart';
import 'contact_tab.dart';
import 'package:intl/intl.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // Tham chiếu đến các collection trên Firestore
  final CollectionReference newsCollection =
  FirebaseFirestore.instance.collection('news');
  final CollectionReference featuredDocsCollection =
  FirebaseFirestore.instance.collection('featuredDocs');

  //=======================================//
  // 1. Các hàm xử lý CRUD cho Tin tức (News)
  //=======================================//

  // Hàm hiển thị dialog thêm Tin tức
  Future<void> _showAddNewsDialog() async {
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    final imageURLController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm Tin Tức'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Tiêu đề'),
                ),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(labelText: 'Ngày (dd/mm/yyyy)'),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                      dateController.text = formattedDate;
                    }
                  },
                ),
                TextField(
                  controller: imageURLController,
                  decoration: const InputDecoration(labelText: 'URL hình ảnh'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isEmpty ||
                    dateController.text.isEmpty ||
                    imageURLController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")),
                  );
                  return;
                }
                try {
                  await newsCollection.add({
                    'title': titleController.text,
                    'date': dateController.text,
                    'imageURL': imageURLController.text,
                    'createdAt': FieldValue.serverTimestamp(), // để sắp xếp tin tức
                  });
                  Navigator.pop(context);
                } catch (error) {
                  print("Error when adding news: $error");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Lỗi khi thêm tin tức: $error")),
                  );
                }
              },
              child: const Text('Thêm'),
            ),
          ],
        );
      },
    );
  }

  // Hàm hiển thị dialog sửa Tin tức
  Future<void> _showEditNewsDialog(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    final titleController = TextEditingController(text: data['title'] ?? '');
    final dateController = TextEditingController(text: data['date'] ?? '');
    final imageURLController = TextEditingController(text: data['imageURL'] ?? '');

    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sửa Tin Tức'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Tiêu đề'),
                ),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(labelText: 'Ngày (dd/mm/yyyy)'),
                ),
                TextField(
                  controller: imageURLController,
                  decoration: const InputDecoration(labelText: 'URL hình ảnh'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                await newsCollection.doc(doc.id).update({
                  'title': titleController.text,
                  'date': dateController.text,
                  'imageURL': imageURLController.text,
                });
                Navigator.pop(context);
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  // Hàm xóa Tin tức
  Future<void> _deleteNews(String docId) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xóa Tin Tức'),
          content: const Text('Bạn có chắc muốn xóa tin tức này không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                await newsCollection.doc(docId).delete();
                Navigator.pop(context);
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

  //===============================================//
  // 2. Các hàm xử lý CRUD cho Tài liệu nổi bật (Featured Docs)
  //===============================================//

  // Hàm hiển thị dialog thêm Tài liệu nổi bật
  Future<void> _showAddFeaturedDocsDialog() async {
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    final imageURLController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm Tài liệu nổi bật'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Tiêu đề'),
                ),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(labelText: 'Ngày (dd/mm/yyyy)'),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                      dateController.text = formattedDate;
                    }
                  },
                ),
                TextField(
                  controller: imageURLController,
                  decoration: const InputDecoration(labelText: 'URL hình ảnh'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                await featuredDocsCollection.add({
                  'title': titleController.text,
                  'date': dateController.text,
                  'imageURL': imageURLController.text,
                });
                Navigator.pop(context);
              },
              child: const Text('Thêm'),
            ),
          ],
        );
      },
    );
  }

  // Hàm hiển thị dialog sửa Tài liệu nổi bật
  Future<void> _showEditFeaturedDocsDialog(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    final titleController = TextEditingController(text: data['title'] ?? '');
    final dateController = TextEditingController(text: data['date'] ?? '');
    final imageURLController = TextEditingController(text: data['imageURL'] ?? '');

    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sửa Tài liệu nổi bật'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Tiêu đề'),
                ),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(labelText: 'Ngày (dd/mm/yyyy)'),
                ),
                TextField(
                  controller: imageURLController,
                  decoration: const InputDecoration(labelText: 'URL hình ảnh'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                await featuredDocsCollection.doc(doc.id).update({
                  'title': titleController.text,
                  'date': dateController.text,
                  'imageURL': imageURLController.text,
                });
                Navigator.pop(context);
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  // Hàm xóa Tài liệu nổi bật
  Future<void> _deleteFeaturedDocs(String docId) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xóa Tài liệu nổi bật'),
          content: const Text('Bạn có chắc muốn xóa mục này không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                await featuredDocsCollection.doc(docId).delete();
                Navigator.pop(context);
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

  //================================//
  // UI - HEADER & ICON ROW
  //================================//

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    'https://cdn.tuoitre.vn/thumb_w/800/471584752817336320/2024/11/24/chill-guy-ttc-1732421724981667208220.jpg'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Anh Vu Tuan',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('22010203',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.mail),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://mail.google.com/');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Không thể mở liên kết Gmail.';
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.message),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://www.messenger.com/');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Không thể mở liên kết Messenger.';
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              prefixIcon: const Icon(Icons.search, color: Colors.orange),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIconWithLabel(context, Icons.info_outline, 'Giới thiệu'),
        _buildIconWithLabel(context, Icons.notifications, 'Thông báo'),
        _buildIconWithLabel(context, Icons.settings_suggest, 'Dịch vụ'),
        _buildIconWithLabel(context, Icons.description, 'Biểu mẫu'),
        _buildIconWithLabel(context, Icons.phone, 'Liên hệ'),
      ],
    );
  }

  Widget _buildIconWithLabel(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        if (label == 'Giới thiệu') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutTab()));
        } else if (label == 'Thông báo') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationTab()));
        } else if (label == 'Dịch vụ') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceTab()));
        } else if (label == 'Liên hệ') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactTab()));
        } else {
          print('Nhấn vào $label');
        }
      },
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.blue.withOpacity(0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 36, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  //================================//
  // UI - Mục Tin Tức (News)
  //================================//

  Widget _buildNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header của mục Tin tức có nút "Thêm"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tin tức',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  GestureDetector(
                    onTap: _showAddNewsDialog,
                    child: const Icon(Icons.add, color: Colors.orange),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => print('Chuyển sang trang danh sách Tin tức'),
                    child: Row(
                      children: const [
                        Text(
                          'Xem thêm',
                          style: TextStyle(fontSize: 16, color: Colors.orange),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 14, color: Colors.orange),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: StreamBuilder<QuerySnapshot>(
            // Sắp xếp theo createdAt để tin tức mới nhất xuất hiện đầu tiên
            stream: newsCollection.orderBy('createdAt', descending: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Lỗi: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('Không có tin tức nào'));
              }
              final docs = snapshot.data!.docs;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  final rawData = doc.data();
                  if (rawData == null) return Container();
                  final data = rawData as Map<String, dynamic>;
                  return _buildItemCard(doc: doc, data: data, isFeaturedDocs: false, isNews: true);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  //================================//
  // UI - Mục Tài liệu nổi bật (Featured Docs)
  //================================//

  Widget _buildFeaturedDocsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header của mục Tài liệu nổi bật có nút "Thêm"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tài liệu nổi bật',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  GestureDetector(
                    onTap: _showAddFeaturedDocsDialog,
                    child: const Icon(Icons.add, color: Colors.orange),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => print('Chuyển sang trang danh sách Tài liệu nổi bật'),
                    child: Row(
                      children: const [
                        Text(
                          'Xem thêm',
                          style: TextStyle(fontSize: 16, color: Colors.orange),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 14, color: Colors.orange),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: StreamBuilder<QuerySnapshot>(
            stream: featuredDocsCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Lỗi: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('Không có tài liệu nào'));
              }
              final docs = snapshot.data!.docs;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  final rawData = doc.data();
                  if (rawData == null) return Container();
                  final data = rawData as Map<String, dynamic>;
                  return _buildItemCard(doc: doc, data: data, isFeaturedDocs: true, isNews: false);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  //================================//
  // Widget hiển thị 1 card (cho cả Tin tức & Tài liệu nổi bật)
  //================================//

  Widget _buildItemCard({
    required DocumentSnapshot doc,
    required Map<String, dynamic> data,
    required bool isFeaturedDocs,
    required bool isNews,
  }) {
    // Nếu không có URL hợp lệ, sử dụng placeholder
    final imageUrl = (data['imageURL'] == null || data['imageURL'].toString().trim().isEmpty)
        ? 'https://via.placeholder.com/300x200.png?text=No+Image'
        : data['imageURL'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                if (isNews) {
                  _showEditNewsDialog(doc);
                } else {
                  _showEditFeaturedDocsDialog(doc);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hình ảnh với bo tròn ở góc trên
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: isFeaturedDocs ? 100 : 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: isFeaturedDocs ? 100 : 140,
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image, size: 50),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['title'] ?? 'Chưa có tiêu đề',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data['date'] ?? 'Chưa có ngày',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Popup menu Sửa/Xóa
          Positioned(
            top: 0,
            right: 0,
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  if (isNews) {
                    _showEditNewsDialog(doc);
                  } else {
                    _showEditFeaturedDocsDialog(doc);
                  }
                } else if (value == 'delete') {
                  if (isNews) {
                    _deleteNews(doc.id);
                  } else {
                    _deleteFeaturedDocs(doc.id);
                  }
                }
              },
              itemBuilder: (context) => const [
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
          ),
        ],
      ),
    );
  }

  //================================//
  // Build giao diện tổng thể của HomeTab
  //================================//

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIconRow(context),
                const SizedBox(height: 24),
                _buildNewsSection(),
                const SizedBox(height: 24),
                _buildFeaturedDocsSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
