<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập</title>
    <link
      rel="icon"
      type="image/jpg"
      href="${pageContext.request.contextPath}/assets/images/logo.jpg"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
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
    <!-- CSS trang đăng nhập -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/login.css"
    />
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-xl-4 col-lg-5 col-md-7 col-sm-9">
          <div class="card login-card">
            <div class="login-brand-header">
              <div class="hotel-logo">
                <i
                  class="fa-solid fa-hotel me-2"
                  style="color: var(--primary-gold); font-size: 1.4rem"
                ></i>THE<span>GRAND</span>
              </div>
              <div class="hotel-subtitle">Đăng Nhập Hệ Thống</div>
            </div>

            <c:if test="${not empty success}">
              <div class="alert alert-success alert-dismissible fade show d-flex align-items-center gap-2 mx-3"
                  role="alert"
                  style="border-radius:10px; border:none; background:rgba(46,213,115,0.12); color:#16a34a; font-size:0.84rem;">
                <i class="fa-solid fa-circle-check"></i>
                <div>${success}</div>
                <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert"></button>
              </div>
            </c:if>

            <div class="login-body">
              <form action="${pageContext.request.contextPath}/login" method="post" accept-charset="UTF-8">
                <div class="mb-3">
                  <label class="form-label form-label-luxury">Tên Đăng Nhập</label>
                  <div class="input-group input-group-luxury">
                    <span class="input-icon">
                      <i class="fa-regular fa-user"></i>
                    </span>
                    <input
                      type="text"
                      name="username"
                      class="form-control form-control-luxury"
                      placeholder="Nhập tên đăng nhập..."
                      required
                    />
                  </div>
                </div>

                <div class="mb-3">
                  <label class="form-label form-label-luxury">Mật Khẩu</label>
                  <div class="input-group input-group-luxury">
                    <span class="input-icon">
                      <i class="fa-solid fa-lock"></i>
                    </span>
                    <input
                      type="password"
                      name="password"
                      class="form-control form-control-luxury"
                      placeholder="••••••••"
                      required
                    />
                  </div>
                </div>

                <button class="btn btn-login-luxury w-100">
                  Đăng Nhập
                </button>
              </form>

              <div class="login-footer-luxury">
                Chưa có tài khoản?
                <a href="register">Đăng ký ngay</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>