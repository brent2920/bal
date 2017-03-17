package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.infoDao;

@Controller
@RequestMapping("/")
public class info_controller {
	@Autowired
	infoDao idao;
	
	@RequestMapping("/myinfo")
	public ModelAndView mav(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		Map map = idao.info(id);
		mav.setViewName("t_main");

		return mav;
	}
}
