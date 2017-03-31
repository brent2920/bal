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

import models.informationDao;
import models.latelyDao;
import models.loginDao;
import models.massageDao;
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
	@Autowired
	informationDao infoDao;
	@Autowired
	massageDao msgdao;
	
	
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
			List list = infoDao.getTitle();
			mav.addObject("infolist",list);
			mav.addObject("news",news);
			mav.addObject("size", latelylist.size());
			mav.addObject("list", latelylist);
			
			if(id != null){
				String uid = (String)id.get("ID");
				String eemail =(String)id.get("EEMAIL");
				System.out.println(eemail);
				session.setAttribute("id", uid);
				session.setAttribute("email", eemail);
				// 쪽지.=========================
				List list1 = new ArrayList();
				Map msgmap = new HashMap();
			
				msgmap.put("email", eemail);
				list1 = msgdao.msgfind(msgmap);
				if(list1 != null){
					
					mav.addObject("msglist",list1);
					
				}else{
					
				}
				
				// 쪽지....=========================
				mav.setViewName("t_main");
			}else{
				mav.addObject("msg","�씠硫붿씪 �씠�굹 �뙣�뒪�썙�뱶媛� �옒紐삳릺�뿀�뒿�땲�떎");
				mav.setViewName("t_main");
			
				
			}
			
			return mav;
		}
}
