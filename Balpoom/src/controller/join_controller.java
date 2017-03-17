package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.joinDao;

@Controller

@RequestMapping("/")
public class join_controller {
	@Autowired
	joinDao jdao;
	
		@RequestMapping("/join")
		public ModelAndView join(@RequestParam Map map){
			ModelAndView mav = new ModelAndView();
			String num1 = (String)map.get("telenum1");
			String num2 = (String)map.get("telenum2");
			String num3 = (String)map.get("telenum3");
			String telenum = 	num1+num2+num3;
			map.put("telenum", telenum);
			int r = jdao.join(map);
			if(r==1){
				mav.setViewName("t_main");	
			}
			//mav.setViewName();
			return mav;
		}
}


















