package models;

public class TaiKhoan {
    private String username;
    private String password;
    private String vaiTro;
    private int maKhachHang;

    public TaiKhoan() {}

    public TaiKhoan(String username, String password, String vaiTro, int maKhachHang) {
        this.username = username;
        this.password = password;
        this.vaiTro = vaiTro;
        this.maKhachHang = maKhachHang;
    }


    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getVaiTro() { return vaiTro; }
    public void setVaiTro(String vaiTro) { this.vaiTro = vaiTro; }

    public int getMaKhachHang() { return maKhachHang; }
    public void setMaKhachHang(int maKhachHang) { this.maKhachHang = maKhachHang; }
}