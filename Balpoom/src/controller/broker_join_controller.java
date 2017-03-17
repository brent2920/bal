package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/broker_join")
public class broker_join_controller {

	@RequestMapping("/join")
	public ModelAndView broker_join(){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}
