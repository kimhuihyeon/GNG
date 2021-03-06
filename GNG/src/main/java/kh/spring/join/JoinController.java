package kh.spring.join;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
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
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.moda.CommandMap;






@Controller
public class JoinController {
	
	String authNUm = "";

	@Resource(name="joinService")
	private JoinService joinService;

		
	@RequestMapping(value="/joinStep1")
	public ModelAndView joinStep1(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinStep1");
		return mv;
	}
	
	@RequestMapping(value="/joinStep1/modal_email")
	public ModelAndView modal_email(){
		ModelAndView mv = new ModelAndView("modal_email");
		return mv;
	}
	
	@RequestMapping(value="/joinStep2")
	public ModelAndView joinStep2(HttpSession session,HttpServletResponse response, HttpServletRequest request,CommandMap Map){
		ModelAndView mv = new ModelAndView();
		String email1 = (String) Map.getMap().get("email1");
		String email2 = (String) Map.getMap().get("email2");
		System.out.println(email1 +"@"+email2);
		mv.setViewName("joinStep2");
		session.setAttribute("email1",email1);
		session.setAttribute("email2",email2);
/*		mv.addObject("email1",email1);
		mv.addObject("email2",email2);*/
		return mv;
	}
	
	@RequestMapping(value="/checkId")
	@ResponseBody
	public void checkId(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception{
		PrintWriter out = response.getWriter();
		String paramId= (request.getParameter("MEMBER_ID") == null)?"":String.valueOf(request.getParameter("MEMBER_ID"));
		int checkId = joinService.chekcId(paramId);
		
		out.print(checkId);
		out.flush();
		out.close();
	}

	@RequestMapping(value="/joinStep1/modal_email_auth")
	public ModelAndView email_auth(HttpServletResponse response, HttpServletRequest request,CommandMap Map)throws Exception{
		
		
		String email = (String) Map.getMap().get("email");
		System.out.println("email = " + email);
		Map.getMap().put("MEMBER_EMAIL", email);
		
		int checkNum = joinService.checkMember(Map.getMap());
		System.out.println("checkNum="+checkNum);
		//System.out.println("mode"+Map.getMap().get("mode"));
		
		if(checkNum==0)
		{
		authNUm = RandomNum();
		sendEmail(email.toString(),authNUm);
		System.out.println("????????????");
		}
		String checkNumString=String.valueOf(checkNum);
		PrintWriter writer =response.getWriter();
		writer.write(checkNumString);
		writer.flush();
		writer.close();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("email",email);
		mv.addObject("authNum", authNUm);
		mv.setViewName("joinStep1");
		
		System.out.println("?????????"+authNUm);
		return mv;
	}
	
/*	@RequestMapping(value = "/sample/ajax/test.jws", method=RequestMethod.GET )
	 public ModelAndView ajaxTestMethod(HttpServletRequest req, HttpServletResponse res ) throws Exception {
	  return new ModelAndView("sample/ajaxtest");
	 }
	 */
	  /**
	     * Ajax - @ResponseBody ?????????????????? ????????? ??????.
	     * @param request
	     * @returnf
	     * @throws Exception
	     */
	    @RequestMapping(value="/joinStep1/modal_email_auth_success", method=RequestMethod.POST)
	    public @ResponseBody String clickMethod (HttpServletRequest request) throws Exception   {
	         
	        String str = authNUm;
	         System.out.println("authNUm???????"+authNUm);
	        return str;
	    }
	     /*
		    @RequestMapping(value="sample/ajax/click.jws", method=RequestMethod.POST)
		    public @ResponseBody String clickMethod (HttpServletRequest request) throws Exception   {
		         
		        String str = authNUm;
		         System.out.println("authNUm?????? ?"+authNUm);
		        return str;
		    }
	*/

	private void sendEmail(String email,String authNum){
		String host ="smtp.gmail.com";
		String subject = "MODA ?????? ?????? ??????";
		String fromName ="MODA ?????????";
		String from="khiclass@gmail.com";//???????????????
		String to1 = email;
		
		String content = "????????????[" + authNum +"]";
		
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
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B"))); //?????????????????????
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			
			msg.setRecipients(Message.RecipientType.TO, address1); //??????????????????1
			msg.setSubject(subject); //????????????
			msg.setSentDate(new java.util.Date()); //????????? ????????????
			msg.setContent(content,"text/html;charset=utf-8"); //????????????
			
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
	//??????????????? ?????? ????????????

	@RequestMapping(value="/joinComplete", method=RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		String MEMBER_EMAIL = request.getParameter("MEMBER_EMAIL1")+"@"+request.getParameter("MEMBER_EMAIL2");
		Map<String, Object> memberMap=new HashMap<String, Object>();
		commandMap.getMap().put("MEMBER_EMAIL", MEMBER_EMAIL);
		memberMap=commandMap.getMap();
		joinService.insertMember(memberMap, request);
		joinService.joinPoint(memberMap);
		mv.setViewName("joinComplete");
		return mv;
		
	}
}