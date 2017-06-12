package xianzhi.servlet;


import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import xianzhi.dbHandle.UserHandle;
import xianzhi.tools.LoginVerify;
import xianzhi.models.User;

/**
 * Servlet implementation class GoodsCheckServlet
 */
//用户头像更新
//限制10MB大小
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/ModifyUserImg")
public class ModifyUserImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyUserImg() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// 处理文件
		if(!LoginVerify.isLogin(request)){
		    request.getRequestDispatcher("user/login.jsp?login-info="+java.net.URLEncoder.encode("你还没有登录！","UTF-8")).forward(request,response);
			return;
		}
		
		User user=(User)(request.getSession().getAttribute("loginUser"));
		UserHandle userHandle=new UserHandle();
	
	    //更新信息，seesion中的user信息可能滞后！
	    try {
			user=userHandle.findById(user.getId());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		Part part = request.getPart("file");
		if(part==null){
//			response.sendRedirect("user/personal.jsp?tab=modify&info="+java.net.URLEncoder.encode("请选择文件","UTF-8"));
			System.out.print("没有选择文件");
			return;
		}
		String savePath = request.getServletContext().getRealPath("static/user_img");
		byte[] bt = new byte[(int) part.getSize()];
		FileOutputStream fos = null;

		String imagePathName1 = savePath + "\\" +user.getId()
				+ ".jpg";
		System.out.println(imagePathName1);
		String imagePathName = imagePathName1.replace('\\',
				'/');
		System.out.println(imagePathName);
		user.setImg("static/user_img/"+user.getId()+".jpg");
		fos = new FileOutputStream(imagePathName);
		part.getInputStream().read(bt);
		fos.write(bt);
		
		try {
			userHandle.doUpdateImg(user);

			System.out.println("头像修改成功");
		
			response.sendRedirect("user/personal.jsp?user="+user.getId()+"&tab=info&success=1&info="+java.net.URLEncoder.encode("头像更新成功","UTF-8")+"&cache="+0);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			userHandle.close();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		this.doGet(request, response);
	}
}