package controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.brokerchangeDao;
import models.loginDao;


@Controller
@RequestMapping("/")
public class broker_login_controller {
	
	@Autowired
	loginDao lDao;
	@Autowired
	brokerchangeDao bDao;
	@RequestMapping("/brokerlogin")
	public ModelAndView brokerlogin(HttpSession session, @RequestParam Map map){
		ModelAndView mav = new ModelAndView();
		Map map1 = new HashMap<>();
		
		map1 = lDao.brokerLogin(map);
		
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
		return mav;
		}
	
	//=====================================중개사 정보 수정
	@RequestMapping("/brokerchange")
	public ModelAndView brokerChange(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String brokerid = (String) session.getAttribute("brokerid");
		
		
		
		
		Map map = bDao.brokerList(brokerid);
		
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
			
		
		
		return mav;
	}
	
	
	
	
}
