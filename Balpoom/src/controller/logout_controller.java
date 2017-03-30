package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.newsDao;

@Controller
@RequestMapping("/")
public class logout_controller {
	@Autowired
	newsDao ndao;
	
	
		@RequestMapping("/logout")
		public ModelAndView logout(HttpSession session){
			ModelAndView mav = new ModelAndView();
			List<Map> news = ndao.get_news();
			mav.addObject("news",news);
			
			session.removeAttribute("id");
			session.removeAttribute("id1");
			session.removeAttribute("email");
			session.removeAttribute("brokerid");
			
			mav.setViewName("t_main");
			return mav;
		}
		
		
		
		
}
