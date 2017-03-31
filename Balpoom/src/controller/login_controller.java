package controller;

import java.io.IOException;
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

import models.latelyDao;
import models.loginDao;
import models.mongoDao;
import models.newsDao;

@Controller
@RequestMapping("/")
public class login_controller {
	@Autowired
	loginDao ldao;
	@Autowired
	newsDao ndao;
	@Autowired
	mongoDao mDao;
	@Autowired
	latelyDao lDao;
	
	
		@RequestMapping("/login")
		public ModelAndView mav(@RequestParam Map map, HttpSession session,HttpServletRequest req  ) throws IOException {
			ModelAndView mav = new ModelAndView();
			Map id = ldao.login(map);	
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
			mav.addObject("news",news);
			mav.addObject("size", latelylist.size());
			mav.addObject("list", latelylist);
			
			if(id != null){
				String uid = (String)id.get("ID");
				String eemail =(String)id.get("EEMAIL");
				System.out.println(eemail);
				session.setAttribute("id", uid);
				session.setAttribute("email", eemail);
				mav.setViewName("t_main");
			}else{
				mav.addObject("msg","이메일 이나 패스워드가 잘못되었습니다");
				mav.setViewName("t_main");
			
				
			}
			return mav;
		}
}
