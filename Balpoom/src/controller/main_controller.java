package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.roomDao;

@Controller
public class main_controller {
	
	@Autowired
	roomDao rd;
	
	@RequestMapping("/")
	public ModelAndView mainHandler() {
		ModelAndView mav = new ModelAndView("t_main");
		return mav;
	}
	
	@RequestMapping("/search")
	public ModelAndView searchHandler() {
		ModelAndView mav = new ModelAndView("t_search");
		return mav;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detailViewHandler() {
		ModelAndView mav = new ModelAndView("t_detail");
		return mav;
	}
	//test 용 신경쓰지 말것
	@RequestMapping("/testing")
	public ModelAndView testing(){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> mlist = rd.test_room();
	
		mav.addObject("mlist",mlist);
		mav.addObject("mlistsize",mlist.size());
		mav.setViewName("/testing/test");
		return mav;
	}

}
