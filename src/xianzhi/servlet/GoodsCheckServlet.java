package xianzhi.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
    
    //使用part获取表单域
    public String getForm(HttpServletRequest req,String formName) throws IllegalStateException, IOException, ServletException{
    	Part part = req.getPart(formName);
    	byte[] tmp=new byte[(int) part.getSize()];
    	part.getInputStream().read(tmp);
    	return new String(tmp);
    }
    
    public String getFileName(String header) {
        /**
         * String[] tempArr1 = header.split(";");代码执行完之后，在不同的浏览器下，tempArr1数组里面的内容稍有区别
         * 火狐或者google浏览器下：tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
         * IE浏览器下：tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
         */
        String[] tempArr1 = header.split(";");
        /**
         *火狐或者google浏览器下：tempArr2={filename,"snmp4j--api.zip"}
         *IE浏览器下：tempArr2={filename,"E:\snmp4j--api.zip"}
         */
        String[] tempArr2 = tempArr1[2].split("=");
        //获取文件名，兼容各种浏览器的写法
        String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\")+1).replaceAll("\"", "");
        return fileName;
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		PrintWriter out=response.getWriter();
//		Part part=request.getPart("img-goods");
//		part.write(getServletContext().getRealPath("/src")+"/"+"a.txt");
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		    request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	        //存储路径
	        String savePath = request.getServletContext().getRealPath("/static/goods_img");
	        //处理表单
	        String goodsName=getForm(request, "name-goods");
	        int goodsQuantity=Integer.parseInt(getForm(request,"quantity-goods"));
	    	//todo,更多信息
	    	//处理文件
	    	Part part=request.getPart("img-goods");
	        //给文件取名,使用ID取名
	        //ToDo
	    	
	    	 String header = part.getHeader("content-disposition");
             //获取文件名
             String fileName = getFileName(header);
	        //String fileName = "todo_rename.jpg";
	        System.out.println("goodsName="+goodsName + "  goodsQuantity=" + goodsQuantity + " fileName=" + fileName);
	        //把文件写到指定路径
	        part.write(savePath+File.separator+fileName);
	        if(true/*suc*/){
	        	/*jump1*/
	        }else{
	        	request.setAttribute("info", "error");
	        	/*jump2*/
	        }

	}

}
