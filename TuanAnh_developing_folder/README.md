# Thư Viện Online

## Mô tả đồ án
Thư Viện Online là một ứng dụng Flutter được thiết kế với mục đích quản lý sách và người dùng trong thư viện trực tuyến.  

## Tính năng
- Hiển thị danh sách sách với thông tin chi tiết.
- Hiển thị danh sách người dùng cùng các thuộc tính.
- Cho phép thêm người dùng mới từ giao diện.
- Xóa người dùng với xác nhận trước khi thực hiện.

## Các bước thực hiện
### 1. Khởi tạo dự án
Tạo một dự án Flutter mới:
```bash
flutter create TuanAnh_developing_folder
```

### 2. Xây dựng UI và logic

- Tạo file `main.dart` chính và file `myClass.dart` để lưu trữ các lớp `User` và `Book`.
- Xây dựng giao diện cho ba tab: Trang chủ, Thư viện, và Người dùng.
- Sử dụng `IndexedStack` để chuyển đổi giữa các tab.

### 3. Quản lý người dùng

- **Thêm người dùng**: Sử dụng hộp thoại nhập tên, email, vai trò và mật khẩu.
- **Xóa người dùng**: Thêm nút xóa trong danh sách người dùng, khi nhấn xác nhận trước khi xóa.

### 4. Xử lý lỗi

- Đã khắc phục lỗi thiếu `emailController` trong hàm thêm người dùng bằng việc tạo biến controller có liên quan.
- Sửa lỗi "method isn't defined" cho `_confirmDeleteUser` bằng cách định nghĩa hàm đầy đủ.

## Hướng dẫn cài đặt và chạy

1. Cài đặt Flutter và Dart.
2. Di chuyển vào thư mục dự án:
   ```bash
   cd TuanAnh_developing_folder
   ```
3. Chạy ứng dụng:
   ```bash
   flutter run -d web-server
   ```

## Câu trúc tệp

```
TuanAnh_developing_folder/
|- lib/
   |- main.dart
   |- myClass.dart
