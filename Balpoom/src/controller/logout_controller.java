package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class logout_controller {
		@RequestMapping("/logout")
		public ModelAndView logout(HttpSession session){
			ModelAndView mav = new ModelAndView();
			
			session.removeAttribute("id");
			mav.setViewName("t_main");
			return mav;
		}
}
