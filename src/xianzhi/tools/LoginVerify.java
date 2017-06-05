package xianzhi.tools;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import xianzhi.models.*;
public class LoginVerify {
	public static boolean isAdmin(HttpServletRequest request){
		HttpSession ses=request.getSession();
		if(ses.getAttribute("isLogined")!=null
			&& ses.getAttribute("loginUser")!=null
			&& ((User)ses.getAttribute("loginUser")).getId()<1000){
			return true;
		}
		return false;
	}
	
	public static boolean isLogin(HttpServletRequest request){
		HttpSession ses=request.getSession();
		if(ses.getAttribute("isLogined")!=null
			&& ses.getAttribute("loginUser")!=null){
			return true;
		}
		return false;
	}
}