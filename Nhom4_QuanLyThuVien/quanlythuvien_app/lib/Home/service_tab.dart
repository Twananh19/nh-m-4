import 'package:flutter/material.dart';

class ServiceTab extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'title': 'DỊCH VỤ ĐẶT PHÒNG LÀM VIỆC NHÓM',
      'icon': Icons.meeting_room,
      'date': '01/02/2025',
    },
    {
      'title': 'Dịch vụ Turnitin',
      'icon': Icons.check_circle_outline,
      'date': '05/02/2025',
    },
    {
      'title': 'DỊCH VỤ CUNG CẤP THÔNG TIN',
      'icon': Icons.info_outline,
      'date': '10/02/2025',
    },
    {
      'title': 'Dịch vụ phát hành ấn phẩm',
      'icon': Icons.library_books,
      'date': '15/02/2025',
    },
    {
      'title': 'Dịch vụ thư viện số',
      'icon': Icons.cloud_done,
      'date': '20/02/2025',
    },
  ];

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
              'Dịch vụ',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          final dateParts = service['date']!.split('/');
          final day = dateParts[0]; // Ngày
          final month = dateParts[1]; // Tháng
          final year = dateParts[2]; // Năm

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Icon(
                        service['icon'],
                        color: Colors.orange,
                        size: 24, // Giảm kích thước icon để phù hợp
                      ),
                    ),
                    const SizedBox(height: 4),
                    Flexible(
                      child: Text(
                        '$day/$month/$year',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10, // Giảm kích thước font chữ
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                service['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // subtitle: Text('Ngày: ${service['date']}'),
              onTap: () {
                print('Xem chi tiết dịch vụ: ${service['title']}');
              },
            ),
          );
        },
      ),
    );
  }
}
