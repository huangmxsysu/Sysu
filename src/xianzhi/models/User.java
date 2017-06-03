package xianzhi.models;

public class User {
	private int id;
	private String username;
	private String password;
	private String name;
	private String stu_num;

	public void setName(String tmp){
		name=tmp;
		
	}
	public void setUsername(String tmp){
		username=tmp;
	}
	public void setId(int tmp){
		id=tmp;
	}
	public void setPassword(String tmp){
		password=tmp;
	}
	public void setStu_num(String tmp){
		stu_num=tmp;
	}

	public String getName(){
		return name;
	}
	public String getUsername(){
		return username;
	}
	public String getPassword(){
		return password;
	}
	public int getId(){
		return id;
	}
	public String getStu_num(){
		return stu_num;
	}
}

