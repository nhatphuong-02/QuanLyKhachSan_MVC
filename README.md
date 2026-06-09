# 🏨 Hotel Management System

## 📖 Giới thiệu

Hotel Management System là một ứng dụng web được xây dựng bằng Java Servlet/JSP theo mô hình MVC nhằm hỗ trợ quản lý hoạt động của khách sạn. Hệ thống cho phép quản lý phòng, khách hàng, đặt phòng, hóa đơn và tài khoản người dùng thông qua giao diện web trực quan.

Dự án được thực hiện nhằm vận dụng các kiến thức về Java Web, cơ sở dữ liệu, lập trình hướng đối tượng và kiến trúc MVC trong phát triển ứng dụng thực tế.

---

## 🎯 Mục tiêu

- Xây dựng ứng dụng Web quản lý khách sạn hoàn chỉnh.
- Thực hành mô hình MVC trong Java Web.
- Áp dụng DAO Pattern và Service Layer.
- Thiết kế và quản lý cơ sở dữ liệu SQL Server.
- Nâng cao kỹ năng phát triển Web Application bằng Java.

---

## 🛠 Công nghệ sử dụng

### Backend
- Java Servlet
- JSP
- JDBC
- MVC Architecture
- DAO Pattern
- Service Layer

### Frontend
- HTML5
- CSS3
- JavaScript
- Bootstrap

### Database
- Microsoft SQL Server

### Tools
- IntelliJ IDEA
- Maven
- Apache Tomcat 9
- Git & GitHub

---

## ✨ Chức năng chính

### Người dùng

- Đăng ký tài khoản
- Đăng nhập hệ thống
- Xem danh sách phòng
- Tìm kiếm phòng
- Đặt phòng trực tuyến
- Xem lịch sử đặt phòng
- Xem thông tin hóa đơn

### Quản trị viên

- Quản lý phòng
    - Thêm phòng
    - Cập nhật phòng
    - Xóa phòng

- Quản lý khách hàng
- Quản lý hóa đơn
- Quản lý đặt phòng
- Theo dõi trạng thái phòng

---

## 🏗 Kiến trúc hệ thống

Dự án được xây dựng theo mô hình MVC:

```text
Controller
     ↓
Service
     ↓
DAO
     ↓
SQL Server
```

### Controller

- Tiếp nhận request từ người dùng.
- Xử lý điều hướng và luồng nghiệp vụ.

### Service

- Xử lý nghiệp vụ hệ thống.
- Kết nối giữa Controller và DAO.

### DAO

- Thực hiện thao tác với cơ sở dữ liệu.
- CRUD dữ liệu.

### View

- JSP
- HTML
- CSS
- JavaScript

---

## 🗄 Cơ sở dữ liệu

Các bảng chính:

- tblLoaiPhong
- tblPhong
- tblKhachHang
- tblTaiKhoan
- tblDatPhong
- tblHoaDon

Hệ thống sử dụng SQL Server để lưu trữ và quản lý dữ liệu.

---

## 📌 Kết quả đạt được

- Xây dựng thành công ứng dụng Web quản lý khách sạn bằng Java.
- Áp dụng mô hình MVC trong thực tế.
- Thiết kế cơ sở dữ liệu chuẩn hóa.
- Thực hiện phân quyền người dùng và quản trị viên.
- Kết nối và thao tác dữ liệu với SQL Server thông qua JDBC.

---

## 🚀 Hướng phát triển

- Thanh toán trực tuyến.
- Gửi email xác nhận đặt phòng.
- Tích hợp RESTful API.
- Tích hợp Spring Boot.
- Triển khai hệ thống lên Cloud.
- Thống kê doanh thu và biểu đồ trực quan.

---

## 👨‍💻 Tác giả

**Quách Nhật Phương**

Sinh viên ngành Công nghệ Thông tin trường Đại học Sư phạm Kỹ thuật.

---

## ⚠️ Lưu ý

Dự án được xây dựng với mục đích học tập và nghiên cứu. Một số chức năng có thể tiếp tục được nâng cấp và mở rộng trong các phiên bản tiếp theo.