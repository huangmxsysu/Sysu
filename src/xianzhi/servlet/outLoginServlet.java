package xianzhi.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class outLoginServlet
 */
@WebServlet("/outLoginServlet")
public class outLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public outLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getSession().setAttribute("isLogined", false);
		request.getSession().setAttribute("UserNameOrName",null);
		request.getSession().setAttribute("LoginUser",null);
		//request.getRequestDispatcher("/index.jsp").forward(request, response);
		Cookie[] cookies=request.getCookies();
			for(int i=0;i<cookies.length;++i){
				System.out.println(cookies[i].getName()+"=========");
				if("LOGIN_NAME".equals(cookies[i].getName())){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				}
			}
		response.sendRedirect("index.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
