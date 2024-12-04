package edu.cqie.service;

import edu.cqie.entity.User;

import java.util.List;

public interface UserService {

    public List<User> list();
    public User get(Long id);
    public void add(User user);
    public void addUser(User user);
    public void edit(User user);
    public void remove(Long id);
    public void remove(List<Long> ids);
    public void deleteUser(String username);
    public void deleteUsers(List<Long> ids);
    public User getDetail(String username);
    public void update(User user);
}
