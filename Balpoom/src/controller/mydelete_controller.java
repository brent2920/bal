package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.mydeleteDao;

@Controller
@RequestMapping("/")
public class mydelete_controller {
		@Autowired
		mydeleteDao mdao;
	
		@RequestMapping("/mydelete")
		public ModelAndView mydelete(@RequestParam Map map, HttpSession session){
			ModelAndView mav = new ModelAndView();
			String password = (String)map.get("delpass");
			String email = (String)session.getAttribute("email");
			int r = mdao.deletepassfind(map);
			if(r == 1){
				mav.addObject("dmsg","회원탈퇴가 정상적으로 처리 되었습니다");
				mav.setViewName("/");
			}else{
				
			}
			return mav;
		}
}
