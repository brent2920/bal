package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class nav_controller {
	@RequestMapping("/")
	public ModelAndView main_nav() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mainNav");
		return mav;
	}

	@RequestMapping("/login_pop")
	public ModelAndView login_pop() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/login_pop_up");
		return mav;
	}
}