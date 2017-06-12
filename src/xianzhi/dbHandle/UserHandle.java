package xianzhi.dbHandle;


import java.util.* ;
import java.sql.* ;
import xianzhi.models.* ;

import xianzhi.dbc.DatabaseConnection;

public class UserHandle{
	
	private Connection conn = null ;
	private PreparedStatement pstmt = null ;

	public UserHandle(){
		try {
	    	this.conn=new DatabaseConnection().getConnection();
	    } catch (Exception e) {
		 		// TODO: handle exception
	    	e.printStackTrace();
	    }
    }
	
	public boolean doCreate(User user) throws Exception{
		boolean flag = false ;
		ResultSet max_id=this.conn.prepareStatement("select max(id) from user").executeQuery();
		max_id.next();
		int maxId=max_id.getInt(1);
		System.out.println("maxid====" + maxId);
		String sql = "INSERT INTO user(id,username,password,name,stu_num) VALUES (?,?,?,?,?)" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1,maxId+1) ;
		this.pstmt.setString(2,user.getUsername()) ;
		this.pstmt.setString(3,user.getPassword()) ;
		this.pstmt.setString(4,user.getName()) ;
		this.pstmt.setString(5,user.getStu_num()) ;
		if(this.pstmt.executeUpdate() > 0){
			flag = true ;
		}
		this.pstmt.close() ;
		return flag ;
	}
	public List<User> findAll(String keyWord) throws Exception{
		List<User> all = new ArrayList<User>() ;
		String sql = "SELECT id,username,password,name,stu_num FROM user WHERE name LIKE ? OR username LIKE ?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,"%"+keyWord+"%") ;
		this.pstmt.setString(2,"%"+keyWord+"%") ;
		ResultSet rs = this.pstmt.executeQuery() ;
		User user = null ;
		while(rs.next()){
			user = new User() ;
			user.setId(rs.getInt(1)) ;
			user.setUsername(rs.getString(2)) ;
			user.setPassword(rs.getString(3)) ;
			user.setName(rs.getString(4)) ;
			user.setStu_num(rs.getString(5)) ;
			all.add(user) ;
		}
		this.pstmt.close() ;
		return all ;
	}
	

	public User findById(int id) throws Exception{
		User user = null ;
		String sql = "SELECT id,username,password,name,stu_num,img FROM user WHERE id=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1,id) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			user = new User() ;
			user.setId(rs.getInt(1)) ;
			user.setUsername(rs.getString(2)) ;
			user.setPassword(rs.getString(3)) ;
			user.setName(rs.getString(4)) ;
			user.setStu_num(rs.getString(5)) ;
			user.setImg(rs.getString(6));
		}
		this.pstmt.close() ;
		return user ;
	}
	
	public User findByUsername(String str) throws Exception{
		User user = null ;
		
		String sql = "SELECT id,username,password,name,stu_num FROM user WHERE username=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,str) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			user = new User() ;
			user.setId(rs.getInt(1)) ;
			user.setUsername(rs.getString(2)) ;
			user.setPassword(rs.getString(3)) ;
			user.setName(rs.getString(4)) ;
			user.setStu_num(rs.getString(5)) ;
		}
		this.pstmt.close();
		return user ;
	}
	
	public boolean doUpdateImg(User user) throws Exception{
		boolean flag = false ;
		String sql = "update user set img=? where id=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,user.getImg());
		this.pstmt.setInt(2, user.getId());
		if(this.pstmt.executeUpdate() > 0){
			flag = true ;
		}
		this.pstmt.close() ;
		return flag ;
	}
	
	public void close(){
		if(this.conn != null){
			try{
				this.conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
}