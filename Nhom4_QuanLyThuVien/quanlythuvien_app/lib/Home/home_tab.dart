import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_tab.dart';

class HomeTab extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'title': 'Những con số ấn tượng năm 2024',
      'imageURL': 'https://picsum.photos/300/200?random=1',
      'date': '6/1/2025',
    },
    {
      'title': 'Chúc mừng năm mới 2025',
      'imageURL': 'https://picsum.photos/300/200?random=2',
      'date': '31/12/2024',
    },
    
    {
      'title': 'Những con số ấn tượng năm 2024',
      'imageURL': 'https://picsum.photos/300/200?random=3',
      'date': '6/1/2025',
    },
    {
      'title': 'Chúc mừng năm mới 2025',
      'imageURL': 'https://picsum.photos/300/200?random=4',
      'date': '31/12/2024',
    },
    
    {
      'title': 'Những con số ấn tượng năm 2024',
      'imageURL': 'https://picsum.photos/300/200?random=5',
      'date': '6/1/2025',
    },
    {
      'title': 'Chúc mừng năm mới 2025',
      'imageURL': 'https://picsum.photos/300/200?random=6',
      'date': '31/12/2024',
    },
    
    // More news items
  ];

  final List<Map<String, String>> featuredDocsList = [
    {
      'title': 'Báo cáo quý 1 năm 2024',
      'imageURL': 'https://picsum.photos/200/140?random=7',
      'date': '15/3/2024',
    },
    {
      'title': 'Tổng kết dự án XYZ',
      'imageURL': 'https://picsum.photos/200/140?random=8',
      'date': '20/5/2024',
    },
    {
      'title': 'Báo cáo quý 1 năm 2024',
      'imageURL': 'https://picsum.photos/200/140?random=9',
      'date': '15/3/2024',
    },
    {
      'title': 'Tổng kết dự án XYZ',
      'imageURL': 'https://picsum.photos/200/140?random=10',
      'date': '20/5/2024',
    },
    {
      'title': 'Báo cáo quý 1 năm 2024',
      'imageURL': 'https://picsum.photos/200/140?random=11',
      'date': '15/3/2024',
    },
    {
      'title': 'Tổng kết dự án XYZ',
      'imageURL': 'https://picsum.photos/200/140?random=12',
      'date': '20/5/2024',
    },
    // More document items
  ];

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
                _buildIconRow(context), // Truyền context đúng
                const SizedBox(height: 24),
                _buildNewsSection('Tin tức', newsList),
                const SizedBox(height: 24),
                _buildNewsSection('Tài liệu nổi bật', featuredDocsList, isFeaturedDocs: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    'https://cdn.tuoitre.vn/thumb_w/800/471584752817336320/2024/11/24/chill-guy-ttc-1732421724981667208220.jpg'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Anh Vu Tuan',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
        _buildIconWithLabel(context, Icons.info_outline, 'Dịch vụ'),
        _buildIconWithLabel(context, Icons.notifications, 'Biểu mẫu'),
        _buildIconWithLabel(context, Icons.info_outline, 'Liên hệ'),
      ],
    );
  }

  Widget _buildIconWithLabel(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        if (label == 'Giới thiệu') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutTab()), // Giả sử AboutTab đã được tạo đúng
          );
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

  Widget _buildNewsSection(String title, List<Map<String, String>> items,
      {bool isFeaturedDocs = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => print('Chuyển sang trang danh sách $title'),
                child: Row(
                  children: const [
                    Text(
                      'Xem thêm',
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 14, color: Colors.orange),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: isFeaturedDocs ? 180 : 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildNewsCard(items[index], isFeaturedDocs);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsCard(Map<String, String> item, bool isFeaturedDocs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: isFeaturedDocs ? 200 : 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                item['imageURL']!,
                height: isFeaturedDocs ? 100 : 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['date']!,
                    style:
                        TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

