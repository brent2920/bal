package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.informationDao;
import models.latelyDao;
import models.mongoDao;
import models.newsDao;

@Controller
@RequestMapping("/")
public class logout_controller {
	@Autowired
	newsDao ndao;
	@Autowired
	mongoDao mDao;
	@Autowired
	latelyDao lDao;
	@Autowired
	informationDao infoDao;
	
	
	
		@RequestMapping("/logout")
		public ModelAndView logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
			ModelAndView mav = new ModelAndView();
			List<Map> news = ndao.get_news();
			mav.addObject("news",news);
			Cookie[] cookies = req.getCookies();
			Map latelymap = new HashMap<>();
			List latelylist = new ArrayList<>();
			
			if (cookies != null) {
				int rr = cookies.length;
				System.out.println(rr);
				if (rr > 1) {
					for (Cookie cc : cookies) {
						cc.setMaxAge(0);
						resp.addCookie(cc);
					}
				}

			}
			mav.addObject("news",news);
			mav.addObject("size", latelylist.size());
			mav.addObject("list", latelylist);
			
		
			
			
			session.removeAttribute("id");
			session.removeAttribute("id1");
			session.removeAttribute("email");
			session.removeAttribute("brokerid");
			List list = infoDao.getTitle();
			mav.addObject("infolist",list);
			mav.setViewName("t_main");
			return mav;
		}
		
		
		
		
}
