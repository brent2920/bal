package controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.brokerchangeDao;
import models.informationDao;
import models.latelyDao;
import models.loginDao;
import models.mongoDao;
import models.newsDao;


@Controller
@RequestMapping("/")
public class broker_login_controller {
	@Autowired
	latelyDao lDao;
	@Autowired
	mongoDao mDao;
	@Autowired
	newsDao nDao;
	@Autowired
	loginDao loDao;
	@Autowired	
	brokerchangeDao bDao;
	
	@Autowired
	informationDao infoDao;
	
	@RequestMapping("/brokerlogin")
	public ModelAndView brokerlogin(HttpSession session, @RequestParam Map map,
			HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		Map map1 = new HashMap<>();
		
		map1 = loDao.brokerLogin(map);
		
		System.out.println(map.toString());
		if(map1 !=null){
			session.setAttribute("id1", map1.get("BK_REGNAME"));
			session.setAttribute("brokerid", map1.get("ID"));
			
			
			mav.addObject("msg","로그인에 성공했습니다.");
			mav.setViewName("t_main");

			}else{
				
				mav.addObject("msg","이메일이나 비밀번호를 다시 입력하세요.");
				mav.setViewName("t_main");
				
			}
		Cookie[] cookies = req.getCookies();
		Map latelymap = new HashMap<>();
		List latelylist = new ArrayList<>();
		
		if (cookies != null) {
			int rr = cookies.length;
			System.out.println(rr);
			if (rr > 1) {
				for (Cookie cc : cookies) {
					if (!(cc.getName().equals("JSESSIONID"))) {
						int regNum = Integer.parseInt(cc.getValue());
						latelymap = lDao.getLatelyList(regNum);
						if(latelymap==null)
							latelymap = new HashMap<>();
						System.out.println(cc.getValue());

						String ar = mDao.OneImage(String.valueOf(regNum));
						latelymap.put("url", ar);
						System.out.println(ar);
						latelylist.add(latelymap);
					}
				}
			}

		}
		List information = infoDao.getTitle();
		mav.addObject("infolist",information);
		List news = nDao.get_news();
		mav.addObject("news",news);
		mav.addObject("size", latelylist.size());
		mav.addObject("list", latelylist);
		return mav;
		}
	
		
	
	
	
}
