package xianzhi.models;

public class User {
	private int id;
	private String username;
	private String password;
	private String name;
	private String stu_num;
	private String img;
	public String getImg() {
		String userImg=img;
		System.out.println("userImg=" + img);
		if(userImg==null || userImg.length()==0){
			return "static/user_img/0.jpg";
		}else{
			System.out.println("User getImg img="+ userImg);
			return userImg;
		}
		
	}

	public void setImg(String img) {
		this.img = img;
		System.out.println("User setImg img="+ img);
	}
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

