package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class roomadd_controller {
		
	@RequestMapping("roomadd")
	public ModelAndView mav(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomadd");
		return mav;
	}
	
	@RequestMapping("/roomMap")
	public ModelAndView mav(@RequestParam Map map){
		ModelAndView mav = new ModelAndView();
		
		return mav;
		
	}
	
}
