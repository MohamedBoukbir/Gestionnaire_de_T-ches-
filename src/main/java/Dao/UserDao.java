package Dao;

import entity.User;

import java.util.List;

public interface UserDao {
    public void save(User u);
    public List<User> findAll();
    public User findById(Long id);
    public void update(User u) ;
    public void deleteById(Long id);

}
