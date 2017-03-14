package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class main_controller {
	@RequestMapping("/")
	public ModelAndView mainHandler() {
		ModelAndView mav = new ModelAndView("t_main");
		return mav;
	}
}
