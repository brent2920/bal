package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class mydelete_controller {
	
	
		@RequestMapping("/mydelete")
		public ModelAndView mydelete(@RequestParam Map map, HttpSession session){
			ModelAndView mav = new ModelAndView();
			String password = (String)map.get("delpass");
			String eamil = (String)session.getAttribute("email");
			return mav;
		}
}
