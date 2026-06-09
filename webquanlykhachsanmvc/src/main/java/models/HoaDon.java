package models;

import java.sql.Date;

public class HoaDon {
    private int maHoaDon;
    private int maDatPhong;
    private String tenPhong;
    private String soPhong;
    private String hoTen;
    private Date ngayNhan;
    private Date ngayTra;
    private double tongTien;
    private String trangThai;
    private String phuongThucTT;

    public int getMaHoaDon() { return maHoaDon; }
    public void setMaHoaDon(int maHoaDon) { this.maHoaDon = maHoaDon; }

    public int getMaDatPhong() { return maDatPhong; }
    public void setMaDatPhong(int maDatPhong) { this.maDatPhong = maDatPhong; }

    public String getTenPhong() { return tenPhong; }
    public void setTenPhong(String tenPhong) { this.tenPhong = tenPhong; }

    public String getSoPhong() { return soPhong; }
    public void setSoPhong(String soPhong) { this.soPhong = soPhong; }
    
    public String getHoTen() {return hoTen;}
    public void setHoTen(String hoTen) {this.hoTen = hoTen;}
    
    public Date getNgayNhan() { return ngayNhan; }
    public void setNgayNhan(Date ngayNhan) { this.ngayNhan = ngayNhan; }

    public Date getNgayTra() { return ngayTra; }
    public void setNgayTra(Date ngayTra) { this.ngayTra = ngayTra; }

    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }

    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }

    public String getPhuongThucTT() { return phuongThucTT; }
    public void setPhuongThucTT(String phuongThucTT) { this.phuongThucTT = phuongThucTT; }
}