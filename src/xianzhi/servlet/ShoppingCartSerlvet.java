package xianzhi.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import xianzhi.dbHandle.ShopHandle;

/**
 * Servlet implementation class ShoppingCartSerlvet
 */
@WebServlet("/ShoppingCartSerlvet")
public class ShoppingCartSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		  int userId=	Integer.parseInt(request.getParameter("userId"));
		  
		    int goodsId=Integer.parseInt(request.getParameter("goodsId"));
		   int goodsNum=(Integer) request.getSession().getAttribute("goodsNum");
		   goodsNum=goodsNum+1;
		   ShopHandle shopHandle=new ShopHandle();
		   request.getSession().setAttribute("goodsNum",goodsNum);
		   try {
			shopHandle.doSaveShoppingCart(goodsNum, goodsId, userId);
			// request.getSession().setAttribute("goodsNum",goodsNum);
			response.getWriter().print("success");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			response.getWriter().print("false");
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
