package xianzhi.servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import xianzhi.dbHandle.UserDbHandle;
import xianzhi.models.User;

/**
 * Servlet Filter implementation class rememberMeFilter
 */
@WebFilter("/rememberMeFilter")
public class rememberMeFilter implements Filter {

    /**
     * Default constructor. 
     */
    public rememberMeFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request ;
		HttpSession ses = req.getSession() ;
		
		Cookie[] cookies = req.getCookies();
		String emailCookie=null;
		UserDbHandle userDbHandle = new UserDbHandle();
		String UserNameOrName = "";
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if("LOGIN_NAME".equals(cookie.getName())){
					emailCookie = cookie.getValue();
					 try {
					 	if (userDbHandle.findByUsername(emailCookie) != null) {
	  						 User user = userDbHandle.findByUsername(emailCookie);
					     	 if(user.getName()!=null && !user.getName().equals("")){
					     	 UserNameOrName=user.getName();
					 	     }else{
					 	    	UserNameOrName=user.getUsername();
					         }
//					     	ses.setAttribute("loginUser",user);
							ses.setAttribute("UserNameOrName", UserNameOrName);
							ses.setAttribute("isLogin", true);
					 	}
					} catch (Exception e) {
									// TODO: handle exception
							}
					System.out.println("Filter:   LOGIN_NAME == cookie.getName   value ==" + cookie.getValue());
					System.out.println("cookie剩下" + cookie.getMaxAge() + "秒");

				}
			}
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
