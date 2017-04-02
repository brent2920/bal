package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class errorcontroller {
	
	
	@RequestMapping("/error")
	public ModelAndView error(){
		ModelAndView mav = new ModelAndView("t_error");
		
		return mav;
	}

}
