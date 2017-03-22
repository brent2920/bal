package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.loginDao;


@Controller
@RequestMapping("/broker")
public class broker_login_controller {
	
	@Autowired
	loginDao lDao;
	
	@RequestMapping("/login")
	public ModelAndView brokerlogin(HttpSession session, HttpServletRequest req){
		Map map = new HashMap<>();
		ModelAndView mav = new ModelAndView();
		String id = (String) req.getAttribute("Eemail");
		String bk_password = req.getParameter("password");
		map.put("id", id);
		map.put("bk_password", bk_password);
		map = lDao.brokerLogin(map);
		if(map.get("id") !=null){
		session.setAttribute("id", map.get("BK_REGNAME"));
		
		mav.setViewName("t_main");
		return mav;
		}else{
			mav.addObject("msg","이메일 이나 패스워드가 잘못되었습니다");
			mav.setViewName("t_main");
		return mav;
		}
	}
	
	
}
