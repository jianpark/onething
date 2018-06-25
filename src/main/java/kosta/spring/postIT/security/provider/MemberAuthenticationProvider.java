package kosta.spring.postIT.security.provider;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.spring.postIT.model.dao.AuthoritiesDAO;
import kosta.spring.postIT.model.dao.MemberDAO;
import kosta.spring.postIT.model.dto.AuthorityDTO;
import kosta.spring.postIT.model.dto.MenteeDTO;;

/**
 *  springSecurity���� loginForm�� ���� id�� pwd�� �Է��ϰ�
 *  �α����� Ŭ�������� ������ ���ѿ� ���� üũ���ִ� Ŭ����.
 *  (authenticate()�޼ҵ尡 �ڵ� ȣ��!!)
 * 
 * */
@Service //id="memberAuthenticationProvider" 
public class MemberAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AuthoritiesDAO authoritiesDAO;
	
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		
		if(!this.supports(auth.getClass())) {
			return null;
		}
		
		//1. �μ��� ������ Authentication�� �̿��Ͽ� id,pwd�� ������.
		String userId = auth.getName();//���̵�
		
		//System.out.println("userId : "+userId);
		
		MenteeDTO menteeDTO = memberDAO.selectMemberById(userId);
		if(menteeDTO==null) {
			throw new UsernameNotFoundException(userId+"�� ���� ȸ���Դϴ�.");
		}
		
		//2. db���� ����� ������ �����´�.
		   //(��й�ȣ�� ��ȣȭ �ؼ� ���Ѵ�.)
		String passowrd =(String)auth.getCredentials();//��
		if(!passwordEncoder.matches(passowrd, menteeDTO.getUserPwd())) {//ù��° �μ��� ��, �ι�°�μ� ��ȣȭ
			throw new UsernameNotFoundException("��й�ȣ �����Դϴ�.");
		}
		
		//4. db���� ����� ������ �ִٸ� 
		     //���Ѹ���� �����´�.
		List<AuthorityDTO> list = authoritiesDAO.selectAuthorityByUserName(userId);
		
		List<SimpleGrantedAuthority> authList = new ArrayList<>();
		for(AuthorityDTO au : list) {
			authList.add(new SimpleGrantedAuthority(au.getRole()));
		}
		
		//���������� ������ ������� ������ Authentication�� �����ؼ������Ѵ�.
		return new UsernamePasswordAuthenticationToken(menteeDTO, null, authList);
	}

	/**
	 * �μ��� ���޵� Authentication��ü�� ����ó���� �Ҽ� �ִ� ��ü���� ���θ�
	 * �Ǵ��ϴ� �޼ҵ�
	 * */
	@Override
	public boolean supports(Class<?> auth) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(auth);
	}

}








