package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import models.brokerdeleteDao;

@Controller
@RequestMapping("/")
public class brokerDeletecontroller {

	@Autowired
	brokerdeleteDao bDao;
	@RequestMapping("/brokerdelete")
	public ModelAndView BrokerDelete( HttpServletRequest req
			,HttpSession session){
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap<>();
		String brokerid = (String) session.getAttribute("brokerid");
		String password = req.getParameter("delpass");
		map.put("brokerid", brokerid);
		map.put("password", password);
		
		int r = bDao.brokerDelete(map);
		System.out.println(r);
		if(r>0){
			int a =bDao.roomDelete(map);
			mav.addObject("dmsg","회원탈퇴가 정상적으로 처리되었습니다.");
			mav.setViewName("t_main");
			session.removeAttribute("brokerid");
			session.removeAttribute("id1");
		}else{
			mav.addObject("dmsg","회원탈퇴가 실패했습니다.");
			mav.setViewName("t_main");
			}
		
		return mav;
		
	}
	
}
