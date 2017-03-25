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
import models.pagingDao;


@Controller

public class latelycontroller {

	@Autowired
	latelyDao lDao;
	@Autowired
	pagingDao pDao;
	
	
	
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
			
			String str = "http://z1.zigbang.com/items/7676969/af2d4be65c803cf7ac380737cdfb14cddf9ba75b.jpg?h=80&q=60";
			map.put("url",str);
			
			System.out.println(str.toString());
			list.add(map);
			}
		}
		mav.addObject("size",list.size());
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping("/02")
	public ModelAndView testHandler(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("t_latelyList");
		List<Map> list = new ArrayList<>();
		Map map = new HashMap<>();
		
		Cookie[] c = req.getCookies();
		System.out.println("==============");
		for(Cookie cc : c){
			if(!(cc.getName().equals("JSESSIONID"))){
			int regNum = Integer.parseInt(cc.getValue());
			map = lDao.getLatelyList(regNum);
			System.out.println(cc.getValue());
			
			String str = "http://z1.zigbang.com/items/7676969/af2d4be65c803cf7ac380737cdfb14cddf9ba75b.jpg?h=100&q=100";
			map.put("url",str);
			
			System.out.println(str.toString());
			list.add(map);
			}
		}
		
		String p= req.getParameter("page") ==null ? "1":req.getParameter("page");
		int pp = Integer.parseInt(p);
		int start = 0;
		int end = 0;
		int end1 = (pp-1)*5;
		
		if(pp==1){
		 start = pp;
		end = pp*5;
		}else{
			start = end1+1;
			end = Integer.parseInt(p)*5;
		}
		
		List list1 = pDao.paging(start, end);
		System.out.println(start +","+end);
		int cnt = list.size();
		System.out.println(cnt);
		int size = cnt %5 ==0 ? cnt/5 : cnt/5+1;
		mav.addObject("size",size);
		System.out.println(list1.toString());
		mav.addObject("page",p);
		mav.addObject("list",list);
		mav.addObject("list1",list1);
		
		return mav;
	}
}
