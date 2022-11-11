package repository.impl;

import model.Facility;
import repository.DataBaseRepository;
import repository.ICustomerRepository;
import repository.IFacilityRepository;
import sun.dc.pr.PRError;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    public static final String SELECT_ALL_FACILITY = "select * from facility where is_delete = 0 ;";
    @Override
    public List<Facility> findAll() {
        List<Facility> facilityFindAll = new ArrayList<>();
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int area = rs.getInt("area");
                double price = rs.getDouble("cost");
                int maxPeople = rs.getInt("max_people");
                String standardRoom = rs.getString("standard_room");
                String descriptionOtherConvenience = rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int numberOfFloors = rs.getInt("number_of_floors");
                String facilityFree = rs.getString("facility_free");
                int rentTypeId = rs.getInt("rent_type_id");
                int facilityTypeId = rs.getInt("facility_type_id");
                facilityFindAll.add(new Facility(id,name,area,price,maxPeople,standardRoom,
                        descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree,rentTypeId,facilityTypeId));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityFindAll;
    }
}
