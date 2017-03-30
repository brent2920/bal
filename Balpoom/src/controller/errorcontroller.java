package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/error")
public class errorcontroller {
	
	@RequestMapping("/404")
	public ModelAndView error404(){
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	@RequestMapping("/500")
	public ModelAndView error500(){
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
