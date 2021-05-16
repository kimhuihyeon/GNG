package kh.spring.findMember;

import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.moda.CommandMap;

@Controller
public class FindController {
	
	@Resource(name="findService")
	private FindService findService;
	
	//아이디,비밀번호찾기로 이동
	@RequestMapping(value="/login/findForm")
	public ModelAndView findForm(){
		ModelAndView mv = new ModelAndView("modal_findForm");
		return mv;
	}
	
	//아이디,비민번호찾기 로직
    @RequestMapping(value="/login/find")
    public @ResponseBody String clickMethod (HttpServletResponse response,HttpServletRequest request,CommandMap map) throws Exception   {
    	String idemail = (String) map.getMap().get("idemail");
    	String idname = (String) map.getMap().get("idname");
    	String pwname = (String) map.getMap().get("pwname");
    	String check_find = (String) map.getMap().get("check_find");
    	String pwemail = (String) map.getMap().get("pwemail");
    	String mid = (String) map.getMap().get("mid");
    	String authNUm ="";
    	String str ="";
    	
    	System.out.println("id네임 : "+idname+" pw네임 :" + pwname + "id이메일 :"+idemail +" pwemail"+pwemail+" check_find :" +check_find +" 아이디 : "+mid);
    	
    	
    	if(check_find.equals("i")){
    		System.out.println("아이디 찾기 시작");
        	map.getMap().put("MEMBER_EMAIL_FIND", idemail);
        	map.getMap().put("MEMBER_NAME", idname);
        	String findId = findService.findId(map.getMap());
        	System.out.println("findId="+findId);
        	
        	
            return findId;
    	}else if(check_find.equals("p")){
    		
    		System.out.println("비밀번호 찾기 시작");
    		
    		map.getMap().put("MEMBER_EMAIL_FIND",pwemail);
    		map.getMap().put("MEMBER_ID_FIND",mid);
    		map.getMap().put("MEMBER_NAME",pwname);
        	String findEmail = findService.findEmail(map.getMap());
         	System.out.println("findEmail="+findEmail);
         	
        	if(findEmail!=null){
        		System.out.println("pwe메일 : "+pwemail + "find메일 : "+findEmail);
        		if(pwemail.equals(findEmail)){             		
        			authNUm = RandomNum();//랜덤숫자 String으로 넣고
            		map.getMap().put("MEMBER_PASSWORD_CHANGE", authNUm); 
            		findService.changePw(map.getMap()); //랜덤숫자로 비밀번호 변경하고
            		sendPwEmail(findEmail,authNUm); //메일발송
            		System.out.println("메일발송성공 변경된숫자 : "+authNUm);
            	}
        	}
        	
        	
             return authNUm;
    	}
    	else{

    		
    		return str;
    	}
    		
    	

    }
    
	private void sendPwEmail(String email,String authNum){
		String host ="smtp.gmail.com";
		String subject = "MODA 인증 번호 전달";
		String fromName ="MODA 관리자";
		String from="khiclass@gmail.com";//보내는메일
		String to1 = email;
		
		String content = "초기화 된 비밀번호 [" + authNum +"]";
		
		try{
			Properties props = new Properties();
			
			props.put("mail.smtp,starttls.enable","true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props,new javax.mail.Authenticator(){
					@Override
					protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("khiclass@gmail.com","khacademy");
			}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B"))); //보내는사람설정
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			
			msg.setRecipients(Message.RecipientType.TO, address1); //받는사람설정1
			msg.setSubject(subject); //제목설정
			msg.setSentDate(new java.util.Date()); //보내는 날짜설정
			msg.setContent(content,"text/html;charset=utf-8"); //내용설정
			
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	public String RandomNum(){
		StringBuffer buffer = new StringBuffer();
		for(int i = 0;i<=6;i++){
			int n= (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	
	
}
