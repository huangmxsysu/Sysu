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

import xianzhi.factory.DaoFactory;
import xianzhi.models.User;
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
		String stu_num=request.getParameter("stu_num");
		String name=request.getParameter("name");
		System.out.println(name);
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setStu_num(stu_num);
		user.setName(name);
		user.setId(1);
		boolean isRegister=false;
		try {
			if(DaoFactory.getIUserDAOInstance().doCreate(user)){
				isRegister = true;
				System.out.println("registerTest dao!");
				
				
				List<User> all = DaoFactory.getIUserDAOInstance().findAll("") ;
				Iterator<User> iter = all.iterator() ;
				User emp = null ;
				while(iter.hasNext()){
					emp = iter.next() ;
					System.out.println(emp.getId() + "-->" + emp.getUsername() + " --> " + emp.getPassword() + " --> " + emp.getName() + " --> " + emp.getStu_num()) ;
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("info",isRegister);
		System.out.println("isRegister ==== " + isRegister);
		if(isRegister){
			
			//注意：这里user前要加"/"
			request.getRequestDispatcher("/user/login.jsp").forward(request,response);
		}
		 else{
		 	request.getRequestDispatcher("/user/register.jsp").forward(request,response);
		}
		 
		 
	}

}
