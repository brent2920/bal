package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.loginDao;
import models.newsDao;

@Controller
@RequestMapping("/")
public class login_controller {
	@Autowired
	loginDao ldao;
	@Autowired
	newsDao ndao;
	
	
		@RequestMapping("/login")
		public ModelAndView mav(@RequestParam Map map, HttpSession session  ) throws IOException {
			ModelAndView mav = new ModelAndView();
			Map id = ldao.login(map);	
			List<Map> news = ndao.get_news();
			mav.addObject("news",news);
			
			if(id != null){
				String uid = (String)id.get("ID");
				String eemail =(String)id.get("EEMAIL");
				System.out.println(eemail);
				session.setAttribute("id", uid);
				session.setAttribute("email", eemail);
				mav.setViewName("t_main");
			}else{
				mav.addObject("msg","이메일 이나 패스워드가 잘못되었습니다");
				mav.setViewName("t_main");
			
				
			}
			return mav;
		}
}
