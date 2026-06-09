package models;

import java.sql.Date;

public class BookingHistory {

    private int maDP;
    private String tenPhong;
    private String soPhong;
    private String hoTen;
    private Date ngayNhan;
    private Date ngayTra;
    private String trangThai;
    private int maHD;
    private double tongTien;
    private String trangThaiHD;

    public int getMaDP() { return maDP; }
    public void setMaDP(int maDP) { this.maDP = maDP; }

    public String getTenPhong() { return tenPhong; }
    public void setTenPhong(String tenPhong) { this.tenPhong = tenPhong; }

    public String getSoPhong() { return soPhong; }
    public void setSoPhong(String soPhong) { this.soPhong = soPhong; }

    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }

    public Date getNgayNhan() { return ngayNhan; }
    public void setNgayNhan(Date ngayNhan) { this.ngayNhan = ngayNhan; }

    public Date getNgayTra() { return ngayTra; }
    public void setNgayTra(Date ngayTra) { this.ngayTra = ngayTra; }

    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }

    public int getMaHD() { return maHD; }
    public void setMaHD(int maHD) { this.maHD = maHD; }

    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }

    public String getTrangThaiHD() { return trangThaiHD; }
    public void setTrangThaiHD(String trangThaiHD) { this.trangThaiHD = trangThaiHD; }
}