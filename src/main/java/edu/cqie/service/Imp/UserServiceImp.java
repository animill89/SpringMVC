package edu.cqie.service.Imp;

import edu.cqie.entity.User;
import edu.cqie.service.UserService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImp implements UserService {
    private  List<User> list =new ArrayList<>();
    private static Long uid=0l;
    @Override
    public List<User> list() {
        //从数据库中拿去数据
        return list;
    }
    @Override
    public void addUser(User user){
        //保存到数据库中
        list.add(user);
    }

    //修改
    @Override
    public void edit(User user) {
        list=list.stream().map(item->item.getUserId()==user.getUserId()?user:item).collect(Collectors.toList());
    }

    //删除
    @Override
    public void remove(Long id) {
        list.removeIf(i->i.getUserId()==id);
    }

    //批量删除
    @Override
    public void remove(List<Long> ids) {
        list.removeIf(i->ids.contains(i.getUserId()));
    }



    @Override
    public User get(Long id) {
        return list.stream().filter(item->item.getUserId()==id).findFirst().orElse(null);
    }

    @Override
    public void add(User user) {
        list.add(user);
    }

    @Override
    public void deleteUser(String username){
        Iterator<User> iterator= list.iterator();
        while (iterator.hasNext()){
            User user=iterator.next();
            if(user.getName().equals(username)){
                iterator.remove();
            }
        }
    }

    //获取用户详情
    @Override
    public User getDetail(String username){
        for (User user : list) {
            if(user.getName().equals(username)){
                return user;
            }
        }
        return null;
    }
//批量删除
    @Override
    public void deleteUsers(List<Long> ids) {
        list.removeIf(user -> ids.contains(user.getUserId()));
    }

    @Override
    public void update(User user){
        for (User item : list) {
            if(item.getName().equals(user.getName())){
                item.setEmail(user.getEmail());
                item.setPhoneNumber(user.getPhoneNumber());
                item.setSex(user.getSex());
            }
        }
    }

}
