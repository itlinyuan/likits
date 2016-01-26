package com.likits.action.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.util.WebUtils;

import com.likits.util.RandomValidateCodeUtil;


public class VerificationCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	 public void doGet(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException { 
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg");  
          
        //生成随机字串  
        String verifyCode = RandomValidateCodeUtil.generateVerifyCode(4);  
        //存入会话session 
        WebUtils.setSessionAttribute(request, "randVerificationCode", verifyCode.toLowerCase());
//      HttpSession session = request.getSession(true);  
//      session.setAttribute("randVerificationCode", verifyCode.toLowerCase());  
        //System.out.println(verifyCode.toLowerCase());
        //生成图片  
        int w = 120, h = 40;  
        RandomValidateCodeUtil.outputImage(w, h, response.getOutputStream(), verifyCode);  
  
    } 
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException { 
		doGet(request, response);
	}

}
