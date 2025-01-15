import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giới thiệu'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chào mừng bạn đến với ứng dụng thư viện của chúng tôi!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ứng dụng cung cấp quyền truy cập dễ dàng vào thư viện số và thư viện điện tử. '
                'Bạn có thể tìm kiếm, đọc và quản lý tài liệu ngay trên thiết bị của mình.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Image.network(
                'https://example.com/library_image.jpg', // Thay link hình ảnh
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                'Tài liệu liên kết:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildLinkItem('Tài liệu Hướng dẫn sử dụng', 'https://example.com/guide.pdf'),
              const SizedBox(height: 8),
              _buildLinkItem('Trang chủ thư viện', 'https://example.com/library_home'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLinkItem(String title, String url) {
    return InkWell(
      onTap: () async {
        final Uri link = Uri.parse(url);
        if (await canLaunchUrl(link)) {
          await launchUrl(link, mode: LaunchMode.externalApplication);
        } else {
          throw 'Không thể mở liên kết $title.';
        }
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
      ),
    );
  }
}
