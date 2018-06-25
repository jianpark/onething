package kosta.spring.postIT.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

/**
 *  springSecurity������������ authentication-failure-handler-ref="" �� �ۼ��س�����
 *  ����(�α���) �ɶ� �����ϰ� �Ǹ� MemberAuthenticationFailureHandler Ŭ������
 *   onAuthenticationFailure()�޼ҵ尡 �ڵ� ȣ��ȴ�.
 * */
@Component //id="memberAuthenticationFailureHandler"
public class MemberAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, 
			AuthenticationException ex)
			throws IOException, ServletException {
		
		  req.setAttribute("errorMessage", ex.getMessage());
		  /*req.setAttribute("loginid", req.getParameter("userId"));*/
		  req.getRequestDispatcher("/loginForm?error=true").forward(req, res);
		  /*req.getRequestDispatcher("/WEB-INF/views/common/member/loginForm.jsp").forward(req, res);*/
		 

	}

}








