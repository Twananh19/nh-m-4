import 'package:flutter/material.dart';

class NotificationTab extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {'title': 'Ra mắt sách mới: "Hành trình tri thức"', 'date': '05/01/2025'},
    {'title': 'Giảm giá đặc biệt 50% cho sách khoa học', 'date': '10/01/2025'},
    {'title': 'Buổi ký tặng sách: "Tác giả A"', 'date': '15/01/2025'},
    {'title': 'Cuộc thi viết cảm nhận về sách tháng 2', 'date': '20/01/2025'},
    {'title': 'Cập nhật danh mục sách lịch sử', 'date': '25/01/2025'},
    {'title': 'Workshop: Phương pháp đọc nhanh hiệu quả', 'date': '30/01/2025'},
    {'title': 'Tặng sách miễn phí cho thành viên mới', 'date': '05/02/2025'},
    {'title': 'Sự kiện giao lưu cùng nhà văn nổi tiếng', 'date': '10/02/2025'},
    {'title': 'Top 10 cuốn sách bán chạy nhất tháng 1', 'date': '15/02/2025'},
    {'title': 'Thảo luận nhóm: "Tương lai ngành xuất bản"', 'date': '20/02/2025'},
  ];

  // Danh sách ánh xạ số tháng thành tên tháng
  final List<String> monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.white, // Màu nền cho AppBar
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1.0), // Viền dưới màu xám nhạt
            ),
          ),
          child: AppBar(
            title: const Text(
              'Thông báo',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent, // Đặt màu nền AppBar trong suốt vì đã có màu của Container
            elevation: 0, // Xóa bóng của AppBar để giữ hiệu ứng viền
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final dateParts = notification['date']!.split('/');
          final day = dateParts[0]; // Ngày
          final monthIndex = int.parse(dateParts[1]) - 1; // Số tháng (0-based)
          final month = monthNames[monthIndex]; // Lấy tên tháng

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      month,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      day,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                notification['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Ngày: ${notification['date']}'),
              onTap: () {
                print('Xem thông báo: ${notification['title']}');
              },
            ),
          );
        },
      ),
    );
  }
}
