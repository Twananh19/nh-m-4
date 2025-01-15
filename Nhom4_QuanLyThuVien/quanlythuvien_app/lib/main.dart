import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'digital_library_tab.dart';
import 'e_library_tab.dart';
import 'profile_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thư viện Online',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeTab(),
          DigitalLibraryTab(),
          ELibraryTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang Chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Thư Viện Số'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Thư Viện Điện Tử'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cá Nhân'),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Thư viện điện tử"),
//         ),
//         body: const StrawberryPavlovaTab(),
//       ),
//     );
//   }
// }

// class InfoColumn extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;

//   const InfoColumn({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(icon, color: Colors.green),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         Text(value),
//       ],
//     );
//   }
// }

// class StrawberryPavlovaTab extends StatelessWidget {
//   const StrawberryPavlovaTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             bool isSmallScreen = constraints.maxWidth < 600; // Kiểm tra thiết bị nhỏ
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 8,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: isSmallScreen
//                   ? Column(
//                       children: [
//                         // Nội dung và hình ảnh xếp dọc trên màn hình nhỏ
//                         buildInfoColumn(),
//                         buildImage(),
//                       ],
//                     )
//                   : Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Nội dung và hình ảnh xếp ngang trên màn hình lớn
//                         Expanded(flex: 4, child: buildInfoColumn()),
//                         Expanded(flex: 6, child: buildImage()),
//                       ],
//                     ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildInfoColumn() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             "Thép đã tôi thế đấy",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             " 'Thép đã tôi thế đấy' của Nikolai Ostrovsky kể về cuộc sống đầy thử thách của Pavel Korchagin, một thanh niên Xô Viết kiên cường, đấu tranh với nghịch cảnh để đạt được lý tưởng cách mạng.",
//             style: TextStyle(fontSize: 16),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: const [
//               Icon(Icons.star, color: Colors.amber, size: 24),
//               Icon(Icons.star, color: Colors.amber, size: 24),
//               Icon(Icons.star, color: Colors.amber, size: 24),
//               Icon(Icons.star, color: Colors.amber, size: 24),
//               Icon(Icons.star, color: Colors.grey, size: 24),
//               SizedBox(width: 8),
//               Text("170 Reviews"),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: const [
//               InfoColumn(icon: Icons.category, label: "Thể loại", value: "Tiểu thuyết"),
//               InfoColumn(icon: Icons.attach_money, label: "Giá bán", value: "150.000"),
//               InfoColumn(icon: Icons.inventory_2, label: "Số lượng", value: "20"),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildImage() {
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       height: 350,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         image: const DecorationImage(
//           image: NetworkImage('https://salt.tikicdn.com/ts/product/aa/91/95/3a5030d907f1e5a02edd7e2edf582ce3.jpg'), // URL hình ảnh bìa sách
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
