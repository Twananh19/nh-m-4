import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'account_profile.dart';
import 'coming_soon.dart';
import '../login.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Cá nhân', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          _buildProfileSection(),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(Icons.person, 'Thông tin tài khoản', AccountProfileScreen(), context),
                _buildListTile(Icons.credit_card, 'Thẻ thư viện', ComingSoonScreen('Thẻ thư viện'), context),
                _buildListTile(Icons.info, 'Thông tin chung', ComingSoonScreen('Thông tin chung'), context),
                _buildListTile(Icons.attach_money, 'Tiền phạt', ComingSoonScreen('Tiền phạt'), context),
                _buildListTile(Icons.history, 'Lịch sử tìm kiếm', ComingSoonScreen('Lịch sử tìm kiếm'), context),
                _buildListTile(Icons.history_toggle_off, 'Lịch sử ghi mượn', ComingSoonScreen('Lịch sử ghi mượn'), context),
                _buildListTile(Icons.shopping_cart, 'Đề xuất mua', ComingSoonScreen('Đề xuất mua'), context),
                _buildListTile(Icons.school, 'Xác nhận ra trường', ComingSoonScreen('Xác nhận ra trường'), context),
                Divider(),
                _buildListTile(Icons.settings, 'Cài đặt', ComingSoonScreen('Cài đặt'), context),
                _buildListTile(Icons.feedback, 'Góp ý', ComingSoonScreen('Góp ý'), context),
                _buildListTile(Icons.error, 'Báo lỗi', ComingSoonScreen('Báo lỗi'), context),
                _buildListTile(Icons.info_outline, 'Về PULIC', ComingSoonScreen('Về Pulic'), context),
                _buildListTile(Icons.book, "Hướng dẫn sử dụng", ComingSoonScreen('Tính năng'), context),
              ],
            ),
          ),
          Divider(),
          _buildLogoutTile(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      color: Colors.blue[900],
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Giang Le Truong',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '22010224',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '22010224@st.phenikaa-uni.edu.vn',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, Widget screen, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[700]),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: Colors.blue[700]),
      title: Text('Đăng xuất'),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        showLogoutConfirmationDialog(context);
      },
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận'),
          content: Text('Bạn có chắc chắn muốn đăng xuất?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng dialog
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Đóng dialog
                await FirebaseAuth.instance.signOut();
                // Không cần gọi Navigator.pushReplacement, StreamBuilder sẽ chuyển về LoginScreen
              },
              child: Text('Đăng xuất'),
            ),
          ],
        );
      },
    );
  }
}
