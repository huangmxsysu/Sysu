package xianzhi.dbc;
import java.sql.*;
public class DatabaseConnection {

	
//	CREATE TABLE `user` (
//			 
//			  `id` int(11) NOT NULL,
//			  `username` char(255) COLLATE utf8_bin NOT NULL,
//			  `password` char(255) COLLATE utf8_bin NOT NULL,
//			  `stu_num` char(255) COLLATE utf8_bin DEFAULT NULL,
//			  `name` char(255) COLLATE utf8_bin DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
	private static final String DBDRIVER = "com.mysql.jdbc.Driver" ; 
	private static final String DBURL = "jdbc:mysql://127.0.0.1:3306/14348016?useunicode=true&characterEncoding=utf-8" ;
	private static final String DBUSER = "user" ;
	private static final String DBPASSWORD = "123" ;
	private Connection conn ;
	public DatabaseConnection() throws Exception {
		Class.forName(DBDRIVER) ;
		this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	}
	public Connection getConnection(){
		return this.conn ;
	}
	public void close() throws Exception {
		if(this.conn != null){
			try{
				this.conn.close() ;
			}catch(Exception e){
				throw e ;
			}
		}
	}
}
