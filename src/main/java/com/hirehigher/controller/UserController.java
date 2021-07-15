package com.hirehigher.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hirehigher.command.EmailAuthVO;
import com.hirehigher.command.UserVO;
import com.hirehigher.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;	
	
	@Autowired
	JavaMailSender mailSender;
	
	//로그인화면
	@RequestMapping("/userLogin")
	public void userLogin() {
		
	}
	
	//로그인 처리
	@RequestMapping(value="loginForm", method=RequestMethod.POST)
	public ModelAndView loginForm(UserVO vo) {
		
		ModelAndView mv = new ModelAndView();
		
		UserVO userVO = userService.login(vo);

		if(userVO != null) { //로그인 성공
			System.out.println(userVO.toString());
			mv.addObject("login", userVO);
		}else { //로그인 실패
			mv.addObject("msg", "아이디 비밀번호를 확인하세요");
			
		}
		
		return mv; //LoginSuccessHandler로 반환
	}
	
	//회원가입화면
	@RequestMapping("/userJoin")
	public void userJoin() {
		
	}
	
	//아이디 중복확인(비동기요청)
	@ResponseBody //@ResponseBody는 restController가 아닌 일반 컨트롤러에서 비동기요청이 일어난곳으로 return값을 보내주기위해 필요하다
	@GetMapping("/idCheck/{userId}") //$.getJSON으로 비동기요청을 받을때는 RequestMapping이 아니라 GetMapping으로 받아준다.
	public int idCheck(@PathVariable("userId") String userId) {
		
		int result = userService.idCheck(userId);
		
		return result;
	}
	
	//닉네임 중복확인(비동기요청)
	@ResponseBody
	@GetMapping("/nickNameCheck/{nickName}")
	public int nickNameCheck(@PathVariable("nickName") String nickName) {
		
		int result = userService.nickNameCheck(nickName);
		
		return result;
	}
	
//	//이메일 중복확인 1	(왜안되는지 모르겠음 .com으로 끝나면 406에러발생	)
//	@ResponseBody
//	@GetMapping(value="/emailCheck/{userEmail:.+}", produces="application/json" )
//	public int emailCheck(@PathVariable("userEmail") String userEmail) {
//		
//		System.out.println("emailCheck로 들어온 이메일:"+userEmail);
//		
//		int result = userService.emailCheck(userEmail);
//		
//		System.out.println("result:"+result);
//		return result;
//	}
	
	//이메일중복확인 2
	@ResponseBody
	@RequestMapping(value="/emailCheck", method=RequestMethod.POST)
	public int emailCheck(@RequestBody UserVO vo) {
		
		String userEmail = vo.getUserEmail();
		
		int result = userService.emailCheck(userEmail);
		
		return result;
	}
	
	//이메일 발송
	@ResponseBody
	@PostMapping(value="/sendEmail", produces="application/json")
	public EmailAuthVO sendEmail(@RequestBody UserVO vo) {
		
		String userEmail = vo.getUserEmail();		
		
		//인증키 생성
		UUID uuid = UUID.randomUUID(); //16진수 랜덤값	
		String keyCode = uuid.toString().replaceAll("-", "").substring(0, 6);
		
		String setfrom = "jming95623@gmail.com"; //보내는 사람 이메일
        String tomail = userEmail; // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content ="\r\n\r\n"+"저희 홈페이지를 찾아주셔서 감사합니다"+"\r\n\r\n"+ "인증번호는 " +keyCode+ " 입니다. "+"\r\n\r\n"+ "인증번호를 홈페이지에 입력해주세요";
		
        System.out.println(userEmail);
        System.out.println(content);
       
        
        try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//        	SimpleMailMessage message = new SimpleMailMessage();
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
						
			
		} catch (Exception e) {
			e.printStackTrace();		
		}
        
		return new EmailAuthVO(keyCode);
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public void mypage() {
		
	}
	
	//마이수정페이지
	@RequestMapping("/mypageModify")
	public void mypageModify() {
		
	}
	
	
	
}
