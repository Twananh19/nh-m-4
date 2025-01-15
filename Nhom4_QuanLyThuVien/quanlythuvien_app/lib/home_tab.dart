import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
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
                _buildIconRow(), // Phần list icon nằm ngang
                const SizedBox(height: 24),
                _buildNewsSection(context), // Thêm dòng này để hiển thị thanh tin tức
                const SizedBox(height: 24),
                // Các phần khác nếu có
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
                backgroundImage: NetworkImage('https://cdn.tuoitre.vn/thumb_w/800/471584752817336320/2024/11/24/chill-guy-ttc-1732421724981667208220.jpg'), // Thay bằng link avatar
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Anh Vu Tuan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '22010203',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.mail),
                    onPressed: () {
                      // Hành động cho mail
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.message),
                    onPressed: () {
                      // Hành động cho tin nhắn
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16), // Khoảng cách giữa thông tin user và thanh tìm kiếm
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

  Widget _buildIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIconWithLabel(Icons.info_outline, 'Giới thiệu'),
        _buildIconWithLabel(Icons.notifications, 'Thông báo'),
        _buildIconWithLabel(Icons.support, 'Dịch vụ'),
        _buildIconWithLabel(Icons.description, 'Biểu mẫu'),
        _buildIconWithLabel(Icons.contact_phone, 'Liên hệ'),
      ],
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return InkWell(
      onTap: () {
        // TODO: Thêm hành động khi nhấn vào icon
        print('Nhấn vào $label');
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
  Widget _buildNewsSection(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tin tức',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Chuyển đến trang tin tức đầy đủ
                    print('Chuyển sang trang danh sách tin tức');
                  },
                  child: Row(
                   children: [
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
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 220, // Chiều cao của mỗi tin tức
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Giả sử có 10 tin tức
              itemBuilder: (context, index) {
                return _buildNewsCard(context, index);
              },
            ),
          ),
        ],
      );
    }

    Widget _buildNewsCard(BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 240, // Chiều rộng mỗi tin tức
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
                  'https://via.placeholder.com/240x140.png?text=Tin+${index + 1}',
                  height: 140,
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
                      'Tiêu đề tin tức ${index + 1}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ngày ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
}