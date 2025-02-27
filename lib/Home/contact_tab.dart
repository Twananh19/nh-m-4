import 'package:flutter/material.dart';

class ContactTab extends StatelessWidget {
  const ContactTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
            ),
          ),
          child: AppBar(
            title: const Text(
              'Liên hệ',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tên trung tâm thư viện
            Text(
              'TRUNG TÂM THÔNG TIN THƯ VIỆN TRƯỜNG ĐẠI HỌC PHENIKAA',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Thời gian mở cửa
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Thời gian mở cửa: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '+ Phòng đọc: Từ 8h00-17h00 Từ Thứ 2 đến Thứ 6 (Nghỉ trưa từ 12h00 - 13h00)',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '+ Phòng tự học: Mở cửa 24/7',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            // Địa chỉ
            Row(
              children: const [
                Text(
                  'Địa chỉ: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Flexible(
                  child: Text(
                    'Phường Yên Nghĩa - Quận Hà Đông- Hà Nội',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Số điện thoại
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Số điện thoại: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Flexible(
                  child: Text(
                    '0246.291 8118 ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Text(
                  'Số máy lẻ: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Flexible(
                  child: Text(
                    '117 & 126',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            // Email
            Row(
              children: [
                const Text(
                  'Email: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      // Mở email khi nhấn vào link
                      print('Gửi email đến: thuviendhabc@gmail.com');
                    },
                    child: const Text(
                      'elib@phenikaa-uni.edu.vn',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Bản đồ
            Text(
              'Vị trí trên bản đồ:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Hình ảnh bản đồ
            Container(
              height: 300, // Chiều cao của hình ảnh
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/location.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
