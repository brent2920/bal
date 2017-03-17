package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.infoDao;

@Controller
@RequestMapping("/")
public class info_controller {
	@Autowired
	infoDao idao;
	
	@RequestMapping("/t_info")
	public ModelAndView infomain(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		Map info = idao.info(id);
		mav.addObject("info",info);
		mav.setViewName("t_info");

		return mav;
	}
	@RequestMapping("/infochange")
	public ModelAndView infochange(@RequestParam Map map, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		String num1 = (String)map.get("telenum1");
		String num2 = (String)map.get("telenum2");
		String num3 = (String)map.get("telenum3");
		String telenum = 	num1+num2+num3;
		map.put("telenum", telenum);
		map.put("sid", id);
		System.out.println(map.toString());
		int r  = idao.infochange(map);
		if(r==1){
			session.removeAttribute("id");
			session.setAttribute("id", map.get("id"));
			mav.setViewName("t_main");			
		}	
		return mav;
	}
}
