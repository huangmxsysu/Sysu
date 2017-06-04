package xianzhi.test;

import java.util.Iterator;
import java.util.List;

import xianzhi.dbHandle.*;
import xianzhi.models.User;

public class DaoInsertTest {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		UserDbHandle userDbHandle= new UserDbHandle();
		User emp = null ;
		for(int x=0;x<5;x++){
			emp = new User() ;
			emp.setId(1000 + x) ;
			emp.setName("name" + x) ;
			emp.setStu_num("1434804"+x);
			emp.setPassword("123000"+x) ;
			emp.setUsername("123000"+x+"@qq.com");
			userDbHandle.doCreate(emp) ;
		}
		List<User> all = userDbHandle.findAll("") ;
		Iterator<User> iter = all.iterator() ;
		while(iter.hasNext()){
			emp = iter.next() ;
			System.out.println(emp.getId() + "-->" + emp.getUsername() + " --> " + emp.getPassword() + " --> " + emp.getName() + " --> " + emp.getStu_num()) ;
		}
	}
}