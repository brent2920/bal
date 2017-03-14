package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class template_control {
	@RequestMapping("/template")
	public ModelAndView main_nav() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/tbm/template");
		return mav;
	}


}