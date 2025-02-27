import 'package:flutter/material.dart';

class DigitalLibraryTab extends StatelessWidget {
  final List<String> libraryItems = [
    'BÀI BÁO KHOA HỌC',
    'BÀI GIẢNG ĐIỆN TỬ',
    'ĐỒ ÁN, KHÓA LUẬN TỐT NGHIỆP',
    'ENGINEERING STANDARDS',
    'LUẬN VĂN – LUẬN ÁN',
    'OER - HỌC LIỆU MỞ',
    'SÁCH, GIÁO TRÌNH, TÀI LIỆU SỐ HÓA, SƯU TẦM - LƯU HÀNH',
    'NỘI BỘ',
    'SÁCH THAM KHẢO - GIẢI TRÍ',
    'TÀI LIỆU PHENIKAA UNI BIÊN SOẠN - LHNB',
  ];

  final List<String> databases = ['LEXICOMP', 'SANFORD', 'VJOL'];

  // Danh sách 6 hình ảnh kèm link cho "CƠ SỞ DỮ LIỆU TRỰC TUYẾN"
  final List<Map<String, String>> onlineDatabaseImages = [
    {
      'imageUrl':
      'https://via.placeholder.com/150?text=ProQuest+Ebook+Central',
      'link': 'https://ebookcentral.proquest.com'
    },
    {
      'imageUrl':
      'https://via.placeholder.com/150?text=Refinitiv+Eikon',
      'link': 'https://www.refinitiv.com/en/products/eikon-trading-software'
    },
    {
      'imageUrl':
      'https://via.placeholder.com/150?text=Micromedex',
      'link': 'https://www.ibm.com/products/micromedex'
    },
    {
      'imageUrl':
      'https://via.placeholder.com/150?text=ClinicalKey',
      'link': 'https://www.clinicalkey.com'
    },
    {
      'imageUrl':
      'https://via.placeholder.com/150?text=Access+Pharmacy',
      'link': 'https://accesspharmacy.mhmedical.com'
    },
    {
      'imageUrl':
      'https://via.placeholder.com/150?text=LWW+Health+Library',
      'link': 'https://www.lwwhealthlibrary.com'
    },
  ];

  // Danh sách 1 hình ảnh kèm link cho "CÁC THƯ VIỆN SỐ" (thư viện Tạ Quang Bửu)
  final List<Map<String, String>> digitalLibraryTQB = [
    {
      'imageUrl': 'https://via.placeholder.com/150?text=Tạ+Quang+Bửu',
      'link': 'https://tqblibrary.poly.edu'
    },
  ];

  // Danh sách 3 libraryItem cho "CÁC THƯ VIỆN SỐ KHÁC"
  final List<String> otherLibraryItems = [
    'CSDL MIỄN PHÍ - TÀI NGUYÊN HỌC LIỆU MỞ MIỄN PHÍ',
    'THƯ VIỆN SỐ ĐẠI HỌC QUỐC GIA TP.HCM',
    'THƯ VIỆN SỐ ĐẠI HỌC QUỐC GIA HÀ NỘI'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thư viện số',
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      // Giao diện gồm thanh tìm kiếm cố định và nội dung cuộn
      body: Column(
        children: [
          // Thanh tìm kiếm cố định
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                prefixIcon:
                const Icon(Icons.search, color: Colors.orange),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Nội dung cuộn
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                sectionTitle('Danh sách đơn vị thư viện'),
                ...libraryItems
                    .map((item) => libraryItem(item))
                    .toList(),
                // Menu "CƠ SỞ DỮ LIỆU TRỰC TUYẾN" hiển thị 6 hình ảnh kèm link
                sectionTitle('Liên kết bên ngoài'),
                CustomExpansionTile(
                  title: 'CƠ SỞ DỮ LIỆU TRỰC TUYẾN',
                  headerColor: Colors.orange,
                  titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  children: onlineDatabaseImages
                      .map((item) => imageMenuItem(
                      item['imageUrl']!, item['link']!))
                      .toList(),
                ),
                const SizedBox(height: 10),
                // Menu mở rộng CƠ SỞ DỮ LIỆU TRỰC TUYẾN KHÁC (nền xanh)
                CustomExpansionTile(
                  title: 'CƠ SỞ DỮ LIỆU TRỰC TUYẾN KHÁC',
                  children: databases
                      .map((db) => libraryItem(db))
                      .toList(),
                ),
                const SizedBox(height: 10),
                // Menu "CÁC THƯ VIỆN SỐ" hiển thị 1 hình ảnh kèm link
                CustomExpansionTile(
                  title: 'CÁC THƯ VIỆN SỐ',
                  headerColor: Colors.orange,
                  titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  children: digitalLibraryTQB
                      .map((item) => imageMenuItem(
                      item['imageUrl']!, item['link']!))
                      .toList(),
                ),
                const SizedBox(height: 10),
                // Menu "CÁC THƯ VIỆN SỐ KHÁC" hiển thị 3 libraryItem dạng text
                CustomExpansionTile(
                  title: 'CÁC THƯ VIỆN SỐ KHÁC',
                  children: otherLibraryItems
                      .map((title) => libraryItem(title))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold)),
    ),
  );

  Widget libraryItem(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        onTap: () {
          // Xử lý sự kiện khi nhấn vào mục (nếu cần)
        },
      ),
    ),
  );

  Widget imageMenuItem(String imageUrl, String link) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: GestureDetector(
      onTap: () {
        // Thực hiện mở link, ví dụ sử dụng url_launcher (cần thêm package)
        print('Tapped on $link');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

/// Widget CustomExpansionTile hiển thị header có màu nền và mũi tên xoay
class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final Color headerColor;
  final TextStyle titleTextStyle;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.children,
    this.headerColor = Colors.blue,
    this.titleTextStyle = const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white),
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _arrowAnimation =
        Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header: bao gồm tiêu đề và icon mũi tên xoay trong cùng 1 container
        GestureDetector(
          onTap: _handleTap,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: widget.headerColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: widget.titleTextStyle),
                RotationTransition(
                  turns: _arrowAnimation,
                  child: Icon(
                    Icons.expand_more,
                    color: widget.titleTextStyle.color,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Nội dung mở rộng
        AnimatedCrossFade(
          firstChild: Container(),
          secondChild: Column(children: widget.children),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
