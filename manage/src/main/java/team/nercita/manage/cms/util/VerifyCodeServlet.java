package team.nercita.manage.cms.util;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 向浏览器输出验证码
 * @author L
 *
 */
public class VerifyCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 3241662483141312286L;

	/**
	 * Constructor of the object.
	 */
	public VerifyCodeServlet() {
		super();
	}

	@Override
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置浏览器不缓存本页
		response.setHeader("Cache-Control", "no-cache");
		
		//生成验证码，写入用户session
		String verifyCode=SecurityCode.getSecurityCode();
		request.getSession().setAttribute("verifyCode",verifyCode);
		
		//输出验证码给客户端 
		response.setContentType("image/jpeg");
		BufferedImage bim= SecurityImage.createImage(verifyCode);
		ImageIO.write(bim, "JPEG",response.getOutputStream());	
		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
