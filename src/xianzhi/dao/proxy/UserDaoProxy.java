package xianzhi.dao.proxy;


import java.util.List;

import xianzhi.dao.IUserDao;
import xianzhi.dao.impl.UserDaoImpl;
import xianzhi.dbc.DatabaseConnection;
import xianzhi.models.User;

public class UserDaoProxy implements IUserDao {
	private DatabaseConnection dbc = null ;
	private IUserDao dao = null ;
	public UserDaoProxy() throws Exception {
		this.dbc = new DatabaseConnection() ;
		this.dao = new UserDaoImpl(this.dbc.getConnection()) ;
	}
	@Override
	public boolean doCreate(User user) throws Exception {
		boolean flag = false ;
		try{
			if(this.dao.findById(user.getId()) == null){
				flag = this.dao.doCreate(user) ;
			}
			
			//预置
			else{
					flag = this.dao.doCreate(user) ;
			}

		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return flag;
	}

	@Override
	public List<User> findAll(String keyWord) throws Exception {
		List<User> all = null ;
		try{
			all = this.dao.findAll(keyWord) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return all;
	}

	@Override
	public User findById(int id) throws Exception {
		User user = null ;
		try{
			user = this.dao.findById(id) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return user;
	}
	
	@Override
	public User findByUsername(String str) throws Exception {
		User user = null ;
		try{
			user = this.dao.findByUsername(str) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return user;
	}

}