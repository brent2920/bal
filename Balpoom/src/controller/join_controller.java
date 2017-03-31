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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.joinDao;
import models.latelyDao;
import models.mongoDao;
import models.newsDao;

@Controller

//@RequestMapping("/")
public class join_controller {
	@Autowired
	joinDao jdao;
	@Autowired
	latelyDao lDao;
	@Autowired
	mongoDao mDao;
	@Autowired
	newsDao nDao;
		@RequestMapping("/join")
		public ModelAndView join(@RequestParam Map map,HttpServletRequest req){
			ModelAndView mav = new ModelAndView();
			String num1 = (String)map.get("telenum1");
			String num2 = (String)map.get("telenum2");
			String num3 = (String)map.get("telenum3");
			String telenum = 	num1+"-"+num2+"-"+num3;
			String uimg = "/images/profile.jpg";
			map.put("uimg", uimg);
			map.put("telenum", telenum);
			int r = jdao.join(map);
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
			List news = nDao.get_news();
			mav.addObject("news",news);
			mav.addObject("size", latelylist.size());
			mav.addObject("list", latelylist);
			
			if(r==1){
				mav.setViewName("t_main");	
			}
			//mav.setViewName();
			return mav;
		}
		
//		@RequestMapping("/checkAjax")
//		public ModelAndView idajax(@RequestParam (name="id") String id){
//			ModelAndView mav = new ModelAndView();
//			String n = "NNNNN";
//			String y ="YYYYY";
//			int r = jdao.passajax(id);
//			if(r==1){
//				mav.addObject("NNNNN",n);
//				
//			}else{
//				mav.addObject("YYYYY",y);
//			}
//			return mav;
//		}
		
		
		
//		@RequestMapping("/Ajax")
//		@ResponseBody
//		public ModelAndView emailajax(@RequestParam (name="Eemail") String email){
//			ModelAndView mav = new ModelAndView();
//			int r = jdao.eamilajax(email);
//			if(r==1){
//				mav.addObject("NNNNN");				
//			}else{
//				mav.addObject("YYYYY");
//			}	
//			return mav;
//		}
		
		@RequestMapping("/EmailcheckAjax")
		@ResponseBody	
		public String EmailcheckAjax(@RequestParam(name="Eemail") String Eemail) {
			ModelAndView mav = new ModelAndView("t_join02");
			// boolean rst = mdao.useAvailableCheck(id);
			boolean rst = jdao.emailajax(Eemail);
			int rrr = jdao.brokerajax(Eemail);
			// 'YYYYY' or 'NNNNN'  �̷� ���ڸ� ������ָ� �ȴ�.
			if(rst || rrr==1) 
				return "YYYYY";
			else
				return "NNNNN";
		}
	}



















