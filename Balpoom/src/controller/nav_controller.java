package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class nav_controller {

	@RequestMapping("/test")
	public ModelAndView login_pop() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/watch/watchmain");
		return mav;
	}
	
	@RequestMapping("/watch")
	public ModelAndView watch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/watch/watchmain");
		return mav;
	}
	
	@RequestMapping("/search_navbar")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("/search/search_navbar");
		return mav;
	}
}