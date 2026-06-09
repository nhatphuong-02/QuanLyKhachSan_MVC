<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
language="java" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link
      rel="icon"
      type="image/jpg"
      href="${pageContext.request.contextPath}/assets/images/logo.jpg"
    />

    <title>Đăng Ký Tài Khoản</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,600;1,400&display=swap"
      rel="stylesheet"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

    <!-- CSS trang đăng ký -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/register.css"
    />
  </head>
  <body>
    <div class="register-wrapper">
      <div class="luxury-register-card">
        <div class="card-header-luxury">
          <img
            src="${pageContext.request.contextPath}/assets/images/logo.jpg"
            alt="Hotel Logo"
            class="header-logo"
          />
          <h3>Đăng Ký Tài Khoản</h3>
          <p>Gia Nhập Cộng Đồng Thành Viên</p>
        </div>

        <div class="card-body-luxury">
          <form action="register" method="post" accept-charset="UTF-8">
            <div class="form-group-luxury">
              <label>Họ và Tên</label>
              <div class="input-group-luxury">
                <input
                  type="text"
                  name="hoTen"
                  class="form-control-luxury"
                  placeholder="Nguyễn Văn A"
                  required
                />
                <i class="fa-solid fa-user"></i>
              </div>
            </div>

            <div class="form-group-luxury">
              <label>Số Điện Thoại</label>
              <div class="input-group-luxury">
                <input
                  type="tel"
                  name="sdt"
                  class="form-control-luxury"
                  placeholder="0905 000 000"
                  required
                />
                <i class="fa-solid fa-phone"></i>
              </div>
            </div>

            <div class="form-group-luxury">
              <label>Địa Chỉ Email</label>
              <div class="input-group-luxury">
                <input
                  type="email"
                  name="email"
                  class="form-control-luxury"
                  placeholder="example@hotel.com"
                  required
                />
                <i class="fa-solid fa-envelope"></i>
              </div>
            </div>

            <div class="form-group-luxury">
              <label>Địa Chỉ</label>
              <div class="input-group-luxury">
                <input
                  type="text"
                  name="diaChi"
                  class="form-control-luxury"
                  placeholder="Số nhà, Tên đường, Thành phố"
                  required
                />
                <i class="fa-solid fa-location-dot"></i>
              </div>
            </div>

            <div class="form-group-luxury">
              <label>Tên Đăng Nhập</label>
              <div class="input-group-luxury">
                <input
                  type="text"
                  name="username"
                  class="form-control-luxury"
                  placeholder="Nhập tên tài khoản"
                  required
                />
                <i class="fa-solid fa-user-gear"></i>
              </div>
            </div>

            <div class="form-group-luxury">
              <label>Mật Khẩu</label>
              <div class="input-group-luxury">
                <input
                  type="password"
                  name="password"
                  class="form-control-luxury"
                  placeholder="••••••••"
                  required
                />
                <i class="fa-solid fa-lock"></i>
              </div>
            </div>

            <button type="submit" class="btn-submit-luxury">
              <i class="fa-solid fa-user-plus me-2"></i> Tạo Tài Khoản
            </button>
          </form>

          <div class="form-footer-luxury">
            Đã có tài khoản? <a href="login">Đăng nhập ngay</a>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
