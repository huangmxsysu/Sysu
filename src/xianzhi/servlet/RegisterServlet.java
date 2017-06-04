package xianzhi.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xianzhi.models.User;
import xianzhi.tools.MD5;
import xianzhi.dbHandle.UserDbHandle;
/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String repeat_password = request.getParameter("repeat_password");
		String stu_num=request.getParameter("stu_num");
		String name=request.getParameter("name");
		User user=new User();
		
		boolean isRegister = false;
		String isPwdSame="";
		String isPwd="";
		String isEmail="";
		UserDbHandle userDbHandle= new UserDbHandle();
		
		
		try{
				
			//if(username.matches("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$")&&((DaoFactory.getIUserDAOInstance().findByUsername(username))==null)){
			//为了方便暂时不要考虑邮箱格式
			if((userDbHandle.findByUsername(username)) == null){
				
				if(password.matches("[A-Za-z0-9]{3,}")){
						
					if(repeat_password.equals(password)){
						
					
						password=MD5.getMD5(MD5.getMD5(password));
						user.setUsername(username);
						user.setPassword(password);
						user.setStu_num(stu_num);
						user.setName(name);
						user.setId(1);
						
			
						if (userDbHandle.doCreate(user)) {
							isRegister=true;
							System.out.println("register dao!");
							
							
							List<User> all = userDbHandle.findAll("") ;
							Iterator<User> iter = all.iterator() ;
							User emp = null ;
							while(iter.hasNext()){
								emp = iter.next() ;
								System.out.println(emp.getId() + "-->" + emp.getUsername() + " --> " + emp.getPassword() + " --> " + emp.getName() + " --> " + emp.getStu_num()) ;
							}
						}
			
						request.setAttribute("isRegister",isRegister);
						System.out.println("isRegister ==== " + isRegister);
						
					}
					
					else{
						isPwdSame="两次密码不相同";
						System.out.println("password!=repeat_password");
					
					}
				}
				else{
					isPwd="密码格式错误";
					System.out.println("password不符合格式");//password不符合格式
					
				}
				
			}
			else{
				isEmail="邮箱有重复";
				System.out.println("email不符合email格式");//username不符合email格式
				
			}
			
			if(isRegister == true){
				request.setAttribute("isRegister",isRegister);
				request.getRequestDispatcher("/user/login.jsp").forward(
						request, response);
			}else{
				request.setAttribute("isRegister",false);
				request.setAttribute("isPwdSame",isPwdSame);
				request.setAttribute("isPwd",isPwd);
				request.setAttribute("isEmail",isEmail);
				request.getRequestDispatcher("/user/register.jsp").forward(
						request, response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
