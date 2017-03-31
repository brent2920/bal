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

import models.informationDao;
import models.latelyDao;
import models.mongoDao;
import models.newsDao;
import models.pagingDao;

@Controller

public class latelycontroller {

	@Autowired
	latelyDao lDao;
	@Autowired
	pagingDao pDao;
	@Autowired
	mongoDao mDao;
	@Autowired
	newsDao nDao;
	
	@Autowired
	informationDao infoDao;
//	@RequestMapping("/01")
//	public ModelAndView latelyList(HttpServletRequest req) {
//		ModelAndView mav = new ModelAndView("t_main");
//		List<Map> list = new ArrayList<>();
//		Map map = new HashMap<>();
//		
//		
//		Cookie[] c = req.getCookies();
//		
//		
//		for (Cookie cc : c) {
//			if (!(cc.getName().equals("JSESSIONID"))) {
//				int regNum = Integer.parseInt(cc.getValue());
//				map = lDao.getLatelyList(regNum);
//				if(map==null)
//					map = new HashMap<>();
//				System.out.println(cc.getValue());
//
//				String ar = mDao.OneImage(String.valueOf(regNum));
//				map.put("url", ar);
//				System.out.println(ar);
//				list.add(map);
//			}
//		}
//		List news = nDao.get_news();
//		
//		mav.addObject("news",news);
//		mav.addObject("size", list.size());
//		mav.addObject("list", list);
//		
//
//		return mav;
//	}

	@RequestMapping("/recent")
	public ModelAndView testHandler(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("t_latelyList");
		List<Map> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map1 = new HashMap<>();
		List news = nDao.get_news();
		
		String p = req.getParameter("page") == null ? "1" : req.getParameter("page");
		int pp = Integer.parseInt(p);
		int start = 0;
		int end = 0;
		int end1 = (pp - 1) * 5;
		if (pp == 1) {
			start = pp - 1;
			end = pp * 5;
		} else {
			start = end1;
			end = Integer.parseInt(p) * 5;
		}
		Cookie[] c = req.getCookies();
		if(c.length>1){
		for (int i = start; end > c.length ? i < c.length : i < end; i++) {

			if (c.length < end) {
				int a = c.length - start - 1;
				map1.put("aaaa", a);
				System.out.println("aaaaaaa : "+a);
				

			}

			if (!(c[i].getName().equals("JSESSIONID"))) {
				int regNum = Integer.parseInt(c[i].getValue());
				map = lDao.getLatelyList(regNum);
				String ss = mDao.OneImage(String.valueOf(regNum));
				map.put("url", ss);
				System.out.println(ss+"!!!!!!!!!!!!");

				list.add(map);

			}

		}

		int cnt = c.length-1;
		System.out.println(cnt + "," + start + "," + end);
		int size = cnt % 5 == 0 ? cnt / 5 : cnt / 5 + 1;
		mav.addObject("size", size);
		
		mav.addObject("page", p);
		mav.addObject("list", list);
		mav.addObject("map", map1);
		System.out.println(map1.toString());
	}else{
		mav.addObject("msg","�ֱ� �� ���� �����ϴ�.");
		mav.setViewName("t_main");
	}	
		mav.addObject("news",news);
		List information = infoDao.getTitle();
		mav.addObject("infolist",information);
		mav.addObject("news",news);
		return mav;
	}
}
