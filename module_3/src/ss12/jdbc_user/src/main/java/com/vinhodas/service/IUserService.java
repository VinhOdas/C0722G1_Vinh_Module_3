package com.vinhodas.service;

import com.vinhodas.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
     void insertUser(User user) throws SQLException;

     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id) throws SQLException;

     boolean updateUser(User user) throws SQLException;

    List<User> findByCountry(String s);

    List<User> sortByName();

    User getUserById(int id);

    boolean insertUserStore(User user) throws SQLException;
}
