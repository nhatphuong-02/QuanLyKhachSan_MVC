package services;

import dao.PhongDAO;
import models.Phong;

import java.util.List;

public class RoomService {

    private PhongDAO phongDAO = new PhongDAO();

    public List<Phong> getAllRooms() {
        return phongDAO.getAllRooms();
    }

    public List<Phong> searchRooms(String keyword,
                                   String trangThai) {
        return phongDAO.searchRooms(
                keyword,
                trangThai
        );
    }
    
    public void addRoom(Phong phong) throws Exception {
    phongDAO.addRoom(phong);
    }

    public void updateRoom(Phong phong) throws Exception {
        phongDAO.updateRoom(phong);
    }

    public void deleteRoom(int maPhong) throws Exception {
        phongDAO.deleteRoom(maPhong);
    }

    public Phong getRoomById(int maPhong) throws Exception {
    return phongDAO.getRoomById(maPhong);
}
}