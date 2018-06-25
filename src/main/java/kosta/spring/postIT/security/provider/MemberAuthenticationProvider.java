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
 *  springSecurity에서 loginForm에 의해 id와 pwd를 입력하고
 *  로그인을 클릭했을때 인증과 권한에 대해 체크해주는 클래스.
 *  (authenticate()메소드가 자동 호출!!)
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
		
		//1. 인수로 들어오는 Authentication를 이용하여 id,pwd를 꺼낸다.
		String userId = auth.getName();//아이디
		
		//System.out.println("userId : "+userId);
		
		MenteeDTO menteeDTO = memberDAO.selectMemberById(userId);
		if(menteeDTO==null) {
			throw new UsernameNotFoundException(userId+"는 없는 회원입니다.");
		}
		
		//2. db에서 사용자 정보를 가져온다.
		   //(비밀번호는 복호화 해서 비교한다.)
		String passowrd =(String)auth.getCredentials();//평문
		if(!passwordEncoder.matches(passowrd, menteeDTO.getUserPwd())) {//첫번째 인수는 평문, 두번째인수 암호화
			throw new UsernameNotFoundException("비밀번호 오류입니다.");
		}
		
		//4. db에서 사용자 정보가 있다면 
		     //권한목록을 가져온다.
		List<AuthorityDTO> list = authoritiesDAO.selectAuthorityByUserName(userId);
		
		List<SimpleGrantedAuthority> authList = new ArrayList<>();
		for(AuthorityDTO au : list) {
			authList.add(new SimpleGrantedAuthority(au.getRole()));
		}
		
		//최종적으로 인증된 사용자의 정보를 Authentication에 저장해서리턴한다.
		return new UsernamePasswordAuthenticationToken(menteeDTO, null, authList);
	}

	/**
	 * 인수로 전달된 Authentication객체가 인증처리를 할수 있는 객체인지 여부를
	 * 판단하는 메소드
	 * */
	@Override
	public boolean supports(Class<?> auth) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(auth);
	}

}








