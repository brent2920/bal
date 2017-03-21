package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.latelyDao;


@Controller

public class latelycontroller {

	@Autowired
	latelyDao lDao;
	
	
	
	@RequestMapping("/01")
	public ModelAndView latelyList(HttpServletRequest req){
		ModelAndView mav = new ModelAndView("t_main_sub");
		List<Map> list = new ArrayList<>();
		Map map = new HashMap<>();
		
		Cookie[] c = req.getCookies();
		System.out.println("==============");
		for(Cookie cc : c){
			if(!(cc.getName().equals("JSESSIONID"))){
			int regNum = Integer.parseInt(cc.getValue());
			map = lDao.getLatelyList(regNum);
			System.out.println(cc.getValue());
			
			String str = "http://z1.zigbang.com/items/"+regNum+"/68da20790318c36a1a3dafe0bcf0f8c98d363be3.JPG?w=560&h=420&q=60";
			map.put("url",str);
			
			System.out.println(str.toString());
			list.add(map);
			}
		}
		mav.addObject("size",list.size());
		mav.addObject("lately","/lately/lately");
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping("/02")
	public ModelAndView testHandler() {
		ModelAndView mav = new ModelAndView("t_main_test");
		return mav;
	}
}
