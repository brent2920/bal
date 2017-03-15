package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.roomDao;

@Controller
@RequestMapping("/initialization")
public class init_controller {
	
	@Autowired
	roomDao rdao;
	
	public ModelAndView initHandler() {
		ModelAndView mav = new ModelAndView("t_main");
		
		// 여기에 roomDao에 있는 메소드가 돌아갈 수 있게 구현하면 될 듯
		
		
		return mav;
	}
}
