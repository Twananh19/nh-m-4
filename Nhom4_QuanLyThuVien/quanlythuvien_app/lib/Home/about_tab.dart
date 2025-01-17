import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTab extends StatelessWidget {
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
              'Giới thiệu',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent, // Đặt màu nền AppBar trong suốt vì đã có màu của Container
            elevation: 0, // Xóa bóng của AppBar để giữ hiệu ứng viền
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Giới thiệu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '7/11/2024',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Trung tâm Thông tin Thư viện Trường Đại học Phenikaa chính thức được thành lập từ ngày 18/9/2020 theo Quyết định số 18/QĐ-DHP-HĐT trên cơ sở tách bộ phận Quản lý Thư viện từ Phòng Đào tạo và Quản lý sinh viên.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Chức năng nhiệm vụ của Trung tâm Thông tin Thư viện được quy định tại Quy định chức năng nhiệm vụ Phòng/Ban/Khoa/Viện/Trung tâm trực thuộc Trường Đại học Phenikaa.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'TRUNG TÂM THÔNG TIN THƯ VIỆN PHENIKAA UNI là nơi Hỗ trợ học tập / nghiên cứu / đổi mới / khởi nghiệp (Learn - Study / Research / Innovate / StartUp); Phát sinh ý tưởng mới (Ideas); Giao lưu, hợp tác, kết nối, chia sẻ học thuật (Collaborate — Connect - Sharing); Là nơi truyền cảm hứng nghiên cứu, sáng tạo (Inspire, Create).',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Trung tâm TTTV Phenikaa Uni được định hướng tới mô hình Learning Commons. Đây được định nghĩa như là một không gian giáo dục, tương tự như thư viện và lớp học trong đó có các không gian và hạ tầng thiết bị phục vụ việc đọc, nghiên cứu, tự học, làm việc nhóm, sáng tạo, gặp gỡ, hay đơn thuần chỉ là thư giãn... Learning Commons là sự kết hợp giữa thư viện với công nghệ thông tin và các dịch vụ hỗ trợ học tập nhằm cung cấp những dịch vụ tốt nhất đáp ứng được tối đa các nhu cầu của người dùng. Đây là một không gian học tập năng động với kiến trúc, nội thất, trang thiết bị công nghệ và cách thức tổ chức quản lý luôn hướng đến người dùng. Áp dụng mô hình này, người dùng thư viện có thể phát huy tối đa những không gian chung cho phép tự tra cứu, học, đọc tài liệu hoặc nghiên cứu, thảo luận về các vấn đề quan tâm, hoặc đơn giản chỉ là nghỉ ngơi, thư giãn. Mô hình cho phép người dùng chủ động tiếp cận tài liệu và sử dụng những trang thiết bị hiện đại mà không cần sự can thiệp của thư thư. Như vậy không gian thư viện sẽ phát huy tối đa tính chủ động của người dùng trong việc tiếp cận tài liệu, tự học, từ đó đem lại cho họ cảm giác thoải mái, tiện nghi nhất, cùng với hiệu quả học tập, nghiên cứu tốt nhất.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Image.network(
                Uri.encodeFull('https://library.phenikaa-uni.edu.vn/sites/default/files/Slide3.jpeg'),
                height: 500,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                'Giờ mở cửa:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('- ', style: TextStyle(fontSize: 16)), // Bullet point
                      Expanded(
                        child: Text(
                          'Phòng đọc: Từ Thứ 2 – Thứ 6; sáng 8h-12h; chiều từ 13h-17h',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('- ', style: TextStyle(fontSize: 16)), // Bullet point
                      Expanded(
                        child: Text(
                          'Phòng tự học: Tầng 6 A10 mở cửa từ 06h00 tới 22h30 hàng ngày',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                'Các đường link truy cập:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('+ ', style: TextStyle(fontSize: 16)), // Bullet point
                      Expanded(
                        child: _buildLinkItem('Cổng thông tin thư viện: ', 'http://library.phenikaa-uni.edu.vn/'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('+ ', style: TextStyle(fontSize: 16)), // Bullet point
                      Expanded(
                        child: _buildLinkItem('Thư viện điện tử: ', 'http://elib.phenikaa-uni.edu.vn/'),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('+ ', style: TextStyle(fontSize: 16)), // Bullet point
                      Expanded(
                        child: _buildLinkItem('Thư viện số: ', 'http://dlib.phenikaa-uni.edu.vn/'),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('+ ', style: TextStyle(fontSize: 16)), // Bullet point
                      Expanded(
                        child: _buildLinkItem('Ứng dụng thư viện PU-LIC: ', 'https://library.phenikaa-uni.edu.vn/node/383'),
                      ),
                    ],
                  ),
                ],
              ),
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
