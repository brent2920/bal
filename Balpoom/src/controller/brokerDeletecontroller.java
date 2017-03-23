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
	@RequestMapping("//brokerdelete")
	public ModelAndView BrokerDelete( HttpServletRequest req
			,HttpSession session){
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap<>();
		String brokerid = (String) session.getAttribute("brokerid");
		String password = req.getParameter("delpass");
		map.put("brokerid", brokerid);
		map.put("password", password);
		
		int r = bDao.brokerDelete(map);
		if(r==1){
			mav.addObject("dmsg","회원탈퇴가 정상적으로 처리되었습니다.");
			mav.setViewName("redirect:/");
		}
			else{
			mav.addObject("dmsg","비밀번호가 틀렸습니다.");
			mav.setViewName("redirect:/");
			}
		
		return mav;
		
	}
	
}
