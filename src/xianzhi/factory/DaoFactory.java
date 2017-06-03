package xianzhi.factory;

import xianzhi.dao.IUserDao;
import xianzhi.dao.proxy.UserDaoProxy;

public class DaoFactory {
	public static IUserDao getIUserDAOInstance() throws Exception{
		return new UserDaoProxy() ;
	}
}