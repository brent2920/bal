package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.loginDao;


@Controller
@RequestMapping("/broker")
public class broker_login_controller {
	
	@Autowired
	loginDao lDao;
	
	@RequestMapping("/login")
	public ModelAndView brokerlogin(HttpSession session, @RequestParam Map map){
		ModelAndView mav = new ModelAndView();
		map = lDao.brokerLogin(map);
		
		
		if(map !=null){
			session.setAttribute("id1", map.get("BK_REGNAME"));
			System.out.println(session.getAttribute("id1").toString());
			mav.setViewName("t_main");
			
			}else{
				mav.addObject("msg","이메일 이나 패스워드가 잘못되었습니다");
				mav.setViewName("t_main");
			}
		return mav;
		}
	
	
}
