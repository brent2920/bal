package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.massageDao;

@Controller
@RequestMapping("/")
public class massage_contrller {
	@Autowired
	massageDao msgdao;
	
	
	
		@RequestMapping("/massage")
		@ResponseBody
		public String msg(@RequestParam (name="massage")String massage, 
				@RequestParam (name="msgroomnumber")int msgroomnumber,
				HttpSession session, @RequestParam(name="registr")String registr){
			Map map = new HashMap();
			String id = (String)session.getAttribute("id");
			String email = (String)session.getAttribute("email");
			map.put("massage", massage);
			//map.put("sell_num", msgroomnumber);
			map.put("registr", registr);
			map.put("id", id);
			map.put("email", email);
			int r = msgdao.massageadd(map);
			String yesNo ="";
			if(r == 1){
				yesNo = "MY";
			}else{
				yesNo = "MN";
			}

			return yesNo;
					
		}
		
		@RequestMapping("/massagefind")
		@ResponseBody
		public ModelAndView massagefind(HttpSession session){
			List list = new ArrayList();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("t_main");
			Map msgmap = new HashMap();
			String eemail = (String)session.getAttribute("email");
			msgmap.put("email", eemail);
			list = msgdao.msgfind(msgmap);
			mav.addObject("msglist",list);
			return mav;
		}
		
		@RequestMapping("/massagedel")
		@ResponseBody
		public String massagedel(HttpSession session, @RequestParam (name="msgdell")int msg_seq){
			String yesNo = "";
			Map map = new HashMap();
			String email = (String)session.getAttribute("email");
			System.out.println("메세지 잘떠?세션 이메일 ==> "+email);
			map.put("email",email);
			map.put("msg_seq", msg_seq);
			 int r = msgdao.msadel(map);
			 System.out.println("메세지 삭제 여부 ========> "+r);
			 if(r == 1){
				 yesNo ="DMY";
			 }else{
				 yesNo ="DMN"; 
			 }
			
			
			return yesNo;
		}
		
		@RequestMapping("/msgsendmsg")
		@ResponseBody
		public String msgsendmsg(@RequestParam(name="msgsendmsg") String msgsendmsg,
				@RequestParam (name="sendemail")String sendemail,HttpSession session) {
			String yesNo = "";
			Map map = new HashMap();
			String email = (String)session.getAttribute("email");
			String id = (String)session.getAttribute("id");
			System.out.println(msgsendmsg+"/"+sendemail+"/"+email+"/"+id);
			map.put("id", id);
			map.put("email", email);
			map.put("registr", sendemail);
			map.put("massage", msgsendmsg);
			int r = msgdao.massageadd(map);
			if (r == 1){
				yesNo ="SDMY";
			}else{
				yesNo="SDMN";
			}
			
			return yesNo;
			
		}
		
		
		
		
		
}
