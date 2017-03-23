package controller;


import java.util.HashMap;
import java.util.Map;


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
		Map map1 = new HashMap<>();
		map1 = lDao.brokerLogin(map);
		
		
		if(map1 !=null){
			session.setAttribute("id1", map1.get("BK_REGNAME"));
			session.setAttribute("brokerid", map.get("ID"));
			System.out.println(session.getAttribute("id1").toString());
			
			mav.setViewName("redirect:/");
			

			}else{
				
				mav.addObject("msg1","1");
				mav.setViewName("redirect:/");
				
			}
		return mav;
		}
	
	
}
