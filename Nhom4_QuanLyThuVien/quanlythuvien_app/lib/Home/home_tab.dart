import 'dart:math';
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
  // Dữ liệu mẫu cho tin tức (News)
  final List<Map<String, String>> dummyNews = [
    {
      'title': 'Tin tức 1: Sự kiện đặc biệt diễn ra!',
      'date': '24/02/2025',
      'imageURL': 'https://congchung.edu.vn/wp-content/uploads/2023/09/vai-tro-cua-tai-nguyen-thien-nhien-la-gi.jpg'
    },
    {
      'title': 'Tin tức 2: Cập nhật thông tin mới nhất',
      'date': '25/02/2025',
      'imageURL': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5kkSv6MDABIFTcFk73I_ODMftH3bTR_FvUA&s'
    },
  ];

  // Dữ liệu mẫu cho tài liệu nổi bật (Featured Docs)
  final List<Map<String, String>> dummyFeaturedDocs = [
    {
      'title': 'Tài liệu 1: Hướng dẫn chi tiết',
      'date': '22/02/2025',
      'imageURL': 'https://via.placeholder.com/300x200.png?text=Doc+1'
    },
    {
      'title': 'Tài liệu 2: Tài liệu tham khảo',
      'date': '23/02/2025',
      'imageURL': 'https://via.placeholder.com/300x200.png?text=Doc+2'
    },
  ];

  @override
  void initState() {
    super.initState();
    // Xáo trộn dữ liệu ngẫu nhiên
    dummyNews.shuffle(Random());
    dummyFeaturedDocs.shuffle(Random());
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
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Người dùng',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ID: 123456',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
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
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
        // Header của mục Tin tức
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tin tức', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => print('Thêm tin tức (không thực hiện)'),
                    child: const Icon(Icons.add, color: Colors.orange),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => print('Xem thêm tin tức'),
                    child: Row(
                      children: const [
                        Text('Xem thêm', style: TextStyle(fontSize: 16, color: Colors.orange)),
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
        // Sử dụng SizedBox với cùng kích thước cho cả Tin tức và Tài liệu nổi bật
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyNews.length,
            itemBuilder: (context, index) {
              final data = dummyNews[index];
              return _buildItemCard(data: data);
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
        // Header của mục Tài liệu nổi bật
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tài liệu nổi bật', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => print('Thêm tài liệu nổi bật (không thực hiện)'),
                    child: const Icon(Icons.add, color: Colors.orange),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => print('Xem thêm tài liệu nổi bật'),
                    child: Row(
                      children: const [
                        Text('Xem thêm', style: TextStyle(fontSize: 16, color: Colors.orange)),
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
        // Sử dụng SizedBox height 220 để có cùng kích thước với Tin tức
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyFeaturedDocs.length,
            itemBuilder: (context, index) {
              final data = dummyFeaturedDocs[index];
              return _buildItemCard(data: data);
            },
          ),
        ),
      ],
    );
  }

  //================================//
  // Widget hiển thị 1 card cho mỗi mục (dùng chung cho Tin tức & Tài liệu nổi bật)
  //================================//

  Widget _buildItemCard({required Map<String, String> data}) {
    // Nếu không có URL hợp lệ, sử dụng placeholder
    final imageUrl = (data['imageURL'] == null || data['imageURL']!.trim().isEmpty)
        ? 'https://via.placeholder.com/300x200.png?text=No+Image'
        : data['imageURL']!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                height: 140,
                width: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 140,
                    width: 300,
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
