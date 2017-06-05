package xianzhi.servlet;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import xianzhi.dbHandle.GoodsHandle;
import xianzhi.models.Goods;
import xianzhi.models.User;
/**
 * Servlet implementation class GoodsCheckServlet
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/GoodsCheckServlet")
public class GoodsCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoodsCheckServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 使用part获取表单域
	public String getForm(HttpServletRequest req, String formName)
			throws IllegalStateException, IOException, ServletException {
		Part part = req.getPart(formName);
		byte[] tmp = new byte[(int) part.getSize()];
		part.getInputStream().read(tmp);
		return new String(tmp);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
	
		String nameCheck = "";
		String quantityCheck = "";
		String contentCheck = "";
		String fileCheck = "";
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		request.setAttribute("isCheck", false);
		// 存储路径
		String savePath = request.getServletContext().getRealPath(
				"/static/goods_img");
		// 处理表单
		String goodsName = getForm(request, "name-goods");
		String goodsContent = getForm(request, "content-goods");

		String goodsQuantitystr = getForm(request, "quantity-goods");// 先判断再转换成int防止直接抛出异常
		Float goodsQuantity = null;
		
		// ;
		// 处理文件
		Part part = request.getPart("file");
		String type_id=getForm(request,"type_id-goods");
		String [] typeId={"other","book","live","sport","clothes","eletronic"};//id对应01234
	

		// 给文件取名,使用ID取名
		// ToDo
		// String fileName = "todo_rename.jpg";
		if (goodsName != null && (!goodsName.equals(""))) {

			if ((goodsQuantitystr != null && !goodsQuantitystr.equals(""))) {

				if (goodsContent != null && (!goodsContent.equals(""))) {
					if (part.getSize() != 0) {
						int type=0;
						for(int i=0;i<typeId.length;i++){
							if(type_id.equals(typeId[i])){
								type=i;
							
							}
							
						}
						
			
						User user =(User)request.getSession().getAttribute("loginUser");
				
					    
					    Goods good = new Goods();
					    good.setType_id(type);
					    if(user != null)
					    System.out.println("goodservlet:user.getId()=" + user.getId());
					    good.setProducter_id(user.getId());
					    
						goodsQuantity = Float.parseFloat(getForm(request,
								"quantity-goods"));
						good.setName(goodsName);
						good.setContent(goodsContent);
						good.setPrice(goodsQuantity);

						request.setAttribute("isCheck", true);

						int maxid = 0;
						FileOutputStream fos = null;
						try {
							GoodsHandle goodsHandle = new GoodsHandle();
							maxid = goodsHandle.getMaxId();
							good.setId(maxid + 1);

							int id = good.getId();

							byte[] bt = new byte[(int) part.getSize()];
						

							String imagePathName1 = savePath + "\\" + id
									+ ".jpg";
							// System.out.println(imagePathName1);
							String imagePathName = imagePathName1.replace('\\',
									'/');
							// System.out.println(imagePathName);
							good.setImage("static/goods_img/" + id + ".jpg");
							fos = new FileOutputStream(imagePathName);

							part.getInputStream().read(bt);
							fos.write(bt);

							Date date=new Date();
							good.setStates(1);
							good.setCreatDate(date);
							good.setNum(1);//修复标记
							goodsHandle.doCreateGoods(good);
							
							
							response.sendRedirect("user/personal.jsp?tab=push&success=1&info="
									+ java.net.URLEncoder.encode("添加成功","UTF-8"));
							return;
						} catch (Exception e) {
							
							e.printStackTrace();
							response.sendRedirect("user/personal.jsp?tab=push&info="
											+ java.net.URLEncoder.encode("数据库异常","UTF-8"));
							return;
						} finally {
							if (fos != null) {
								fos.close();
							}
						}

					} else {

						fileCheck = "需要上传物品图片";
						request.setAttribute("fileCheck", fileCheck);
						request.getRequestDispatcher(
								"user/personal.jsp?tab=push&success=0").forward(request,
								response);
					}
				} else {

					contentCheck = "物品简介不能为空";
					request.setAttribute("contentCheck", contentCheck);
					request.getRequestDispatcher("user/personal.jsp?tab=push&success=0")
							.forward(request, response);
				}

			} else {
				quantityCheck = "物品价格不能为空且要大于0";
			}

			request.setAttribute("quantityCheck", quantityCheck);
			request.getRequestDispatcher("user/personal.jsp?tab=push&success=0").forward(
					request, response);

		} else {
			nameCheck = "物品名称不能为空";

			request.setAttribute("nameCheck", nameCheck);
			request.getRequestDispatcher("user/personal.jsp?tab=push&success=0").forward(
					request, response);
		}

		// todo,更多信息

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}