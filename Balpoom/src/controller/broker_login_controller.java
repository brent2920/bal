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
		List news = nDao.get_news();
		mav.addObject("news",news);
		mav.addObject("size", latelylist.size());
		mav.addObject("list", latelylist);
		return mav;
		}
	
	//=====================================중개사 정보 수정
	@RequestMapping("/brokerchange")
	public ModelAndView brokerChange(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String brokerid = (String) session.getAttribute("brokerid");
		
		
		
		Map map = bDao.brokerList(brokerid);
		String[] bk_num = map.get("BK_AGENTNUM").toString().split("-");
		String[] bk_contact = map.get("BK_CONTACT").toString().split("-");
		
		map.put("bk_contact0", bk_contact[0]);
		map.put("bk_contact1", bk_contact[1]);
		map.put("bk_contact2", bk_contact[2]);
		
		map.put("bk_num0", bk_num[0]);
		map.put("bk_num1", bk_num[1]);
		map.put("bk_num2", bk_num[2]);
		
		
		mav.addObject("list",map);
		mav.setViewName("t_brokerchange");
		
		return mav;
		
	}
	@RequestMapping("/brokerChangeResult")
	public ModelAndView brokerChangeResult(@RequestParam Map map, HttpServletRequest req
			,HttpSession session){
		ModelAndView mav = new ModelAndView();
	String[] ar = req.getParameterValues("bk_agentnum");
		
		String bk_agentnum = ar[0]+"-"+ar[1]+"-"+ar[2];
		String[] arr = req.getParameterValues("bk_contact");
		String bk_contact = arr[0]+"-"+arr[1]+"-"+arr[2];
		String[] ar1 = req.getParameterValues("bk_address");
		String bk_address = ar1[0]+" "+ar1[1];
		String brokerid = (String) session.getAttribute("brokerid");
		
		
		map.put("bk_address", bk_address);
		map.put("bk_contact", bk_contact);
		map.put("bk_agentnum", bk_agentnum);
		map.put("brokerid", brokerid);
		
		int r = bDao.brokerchange(map);
		if(r==1){
			mav.setViewName("t_main");
			mav.addObject("msg","정보가 수정되었습니다.");
		}else{
			mav.setViewName("t_brokerchange");
			mav.addObject("fail","다시 입력하세요.");
			
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

						String ar11 = mDao.OneImage(String.valueOf(regNum));
						latelymap.put("url", ar11);
						System.out.println(ar11);
						latelylist.add(latelymap);
						
					}
				}
			}

		}
		List news = nDao.get_news();
		mav.addObject("news",news);
		mav.addObject("size", latelylist.size());
		mav.addObject("list", latelylist);
		
		return mav;
	}
	
	
	
	
}
