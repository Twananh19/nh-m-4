import 'package:flutter/material.dart';

class AccountProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tài khoản',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/avatar.png'), // Thay bằng ảnh thực tế
            ),
            SizedBox(height: 10),
            Text(
              'Nhom 4 - Quan Ly Thu Vien',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text('Mobile App Dev (N05)',
                style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(height: 20),
            buildSectionTitle('Thông tin cá nhân'),
            buildInfoRow(
                Icons.email, 'Email', '22010224@st.phenikaa-uni.edu.vn'),
            buildInfoRow(Icons.phone, 'Di động', '336339804'),
            buildInfoRow(Icons.location_on, 'Lớp', 'DH_K16.40'),
            SizedBox(height: 20),
            buildSectionTitle('Quản lý tài khoản'),
            ListTile(
              leading: Icon(Icons.vpn_key, color: Colors.orange),
              title: Text('Đổi mật khẩu'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          )
        ],
      ),
    );
  }
}
