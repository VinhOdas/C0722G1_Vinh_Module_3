package repository.impl;

import model.Product;
import repository.DataBaseRepository;
import repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    public static final String SELECT_ALL = "select * from cai_gi_do where is_delete=0;";
    private static final String INSERT = "INSERT INTO `cai_gi_do` (`name_id`)" + "VALUES (?);";
    public static final String SELECT_ALL_DTO = " SELECT * from product  where is_delete=0;";
    private static final String INSERT_DTO = "INSERT INTO `product` (`id`, `ten_san_pham`, `gia`, `so_luong`, `mau_sac`, `mo_ta`) VALUES (?,?,?,?,?,?);";

    private static final String SEARCH_PRODUCT = "SELECT * from product \n" +
            "            where \n" +
            "            ten_san_pham like ? AND\n" +
            "            gia like ? AND\n" +
            "            mau_sac LIKE ?;";

    public static final String DELETE = "delete from `product` where id=?;";


    @Override
    public List<Product> selectAll() {



        List<Product> productList = new ArrayList<>();
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DTO);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("ten_san_pham");
                Double gia = Double.valueOf(rs.getString("gia"));
                int soLuong = rs.getInt("so_luong");
                String mauSac = rs.getString("mau_sac");
                String moTa = rs.getString("mo_ta");
                productList.add(new Product(id, name, gia, soLuong, mauSac, moTa));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    @Override
    public void addProduct(Product product) throws SQLException {
        Connection connection = DataBaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DTO);
        preparedStatement.setInt(1, product.getId());
        preparedStatement.setString(2, product.getTenSanPham());
        preparedStatement.setDouble(3, product.getGia());
        preparedStatement.setInt(4, product.getSoLuong());
        preparedStatement.setString(5, product.getMauSac());
        preparedStatement.setString(6, product.getMoTa());

        preparedStatement.executeUpdate();
        System.out.println(preparedStatement);
    }

    @Override
    public List<Product> searchTriple(String searchName, String searchGia, String searchColor) {
        Connection connection = DataBaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();


        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_PRODUCT);

            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + searchGia + "%");
            ps.setString(3, "%" + searchColor + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("ten_san_pham");
                Double gia = rs.getDouble("gia");
                int soLuong = rs.getInt("so_luong");
                String mauSac = rs.getString("mau_sac");
                String moTa = rs.getString("mo_ta");

                productList.add(new Product(id, name, gia, soLuong, mauSac, moTa));
            }

        } catch (SQLException throwAbles) {
            throwAbles.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted = false;
        Connection connection = DataBaseRepository.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(DELETE);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            statement.setInt(1, id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return rowDeleted;
    }
}




