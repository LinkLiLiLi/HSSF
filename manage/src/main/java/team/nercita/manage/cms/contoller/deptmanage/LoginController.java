package team.nercita.manage.cms.contoller.deptmanage;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import team.nercita.manage.cms.service.usermanage.UserService;
import team.nercita.manage.cms.util.Message;

/**
 * 登录
 * @author L
 * @date： 2017年6月16日 下午4:09:23
 */
@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	@ResponseBody
	public Message login(HttpServletRequest request, String userName, String password, String validate){
		if(!validate.toLowerCase().equals(request.getSession().getAttribute("verifyCode").toString().toLowerCase())){
			return new Message("fail", "验证码错误或失效！");
		}
		UsernamePasswordToken token = new UsernamePasswordToken(userName, DigestUtils.md5Hex(password));
		token.setRememberMe(false);
		try {
			SecurityUtils.getSubject().login(token);
			return new Message("success", "登录成功！");
		} catch (UnknownAccountException uae) {
			return new Message("fail", uae.getMessage());
		} catch (IncorrectCredentialsException ice) {
			return new Message("fail", "密码错误！");
		}
	}
}
