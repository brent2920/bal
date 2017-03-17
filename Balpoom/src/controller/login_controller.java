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
@RequestMapping("/")
public class login_controller {
	@Autowired
	loginDao ldao;
	
		@RequestMapping("/login")
		public ModelAndView mav(@RequestParam Map map, HttpSession session){
			ModelAndView mav = new ModelAndView();
			Map id = ldao.login(map);			
			String uid = (String)id.get("ID");	
			if(uid != null){
				session.setAttribute("id", uid);
				mav.setViewName("t_main");
			}
			return mav;
		}
}
