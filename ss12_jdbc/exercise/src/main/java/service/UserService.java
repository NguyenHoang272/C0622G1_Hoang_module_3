package service;

import dao.IUserDAO;
import dao.UserDAO;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserDAO userDAO = new UserDAO();


    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDAO.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDAO.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userDAO.updateUser(user);
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return userDAO.selectUserByCountry(country);
    }

    @Override
    public List<User> sortByName() throws IOException {
        return userDAO.sortByName();
    }


}
