package xianzhi.dao;

import java.util.List;

import xianzhi.models.User;

public interface IUserDao {
	public boolean doCreate(User user) throws Exception ;
	public List<User> findAll(String keyWord) throws Exception ;
	public User findById(int id) throws Exception ;
}