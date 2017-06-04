package xianzhi.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xianzhi.tools.MD5;
import xianzhi.models.User;
import xianzhi.dbHandle.*;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);

		
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		
		String password=request.getParameter("password");
		
		String hasUsername = "";
		String samePwd = "";
		Boolean isLogin = false;

		UserDbHandle userDbHandle = new UserDbHandle();
		
		String UserNameOrName="";
			try {
				if(userDbHandle.findByUsername(username)!=null){
				 	User user=	userDbHandle.findByUsername(username);
                    String pass=	MD5.getMD5(MD5.getMD5(password));
					if(user.getPassword().equals(pass)){
			
						   String checkstate="sysu";
						   checkstate =(String)request.getParameter("remember_me");
							  
							   if(checkstate!=null&&checkstate.equals("on")){
								   Cookie cookie=new Cookie("LOGIN_NAME",username);
								   cookie.setMaxAge(30);
								   response.addCookie(cookie);
								   System.out.println("LoginServlet:   remember on! add Cookie.name=" + cookie.getName() + " Cookie.value =" + cookie.getValue());
								   }
								HttpSession session=request.getSession();

								
								if(user.getName()!=null && !user.getName().equals("")){
										UserNameOrName=user.getName();
								}else{
										UserNameOrName=user.getUsername();
									 }
								session.setAttribute("UserNameOrName", UserNameOrName);
//								session.setAttribute("loginUser",user);
								session.setAttribute("isLogin", true);
									 
								request.getRequestDispatcher("/index.jsp").forward(request, response);
								
								
						System.out.println("密码正确，登陆成功！");
						isLogin = true;
					}
					else{
						System.out.println("密码不一致，请核对");	
						samePwd = "密码不一致";
					}
					
				}
				else{
					System.out.println("用户名不存在");
					hasUsername = "用户名不存在，请先注册";			
				}
				
				if(!isLogin){
					request.setAttribute("isLogin", "false");
					request.setAttribute("samePwd", samePwd);
					request.setAttribute("hasUsername", hasUsername);
					request.getRequestDispatcher("/user/login.jsp").forward(request, response);
				}
			} catch (Exception e) {
			
				e.printStackTrace();
			}
	}

}
