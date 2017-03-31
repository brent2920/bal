package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.informationDao;

@Controller
@RequestMapping("/")
public class infomationcontroller {
	@Autowired
	informationDao infoDao;
	
	
	
	
	@RequestMapping("/informationlist")
	public ModelAndView InfoAllList(){
		ModelAndView mav = new ModelAndView("t_infolist");
		List list = infoDao.getTitle();
		mav.addObject("infolist",list);
		return mav;
	}
	@RequestMapping("/informationinsert")
	public String InfoInsert(@RequestParam Map map,HttpSession session){
		
		String id = (String) session.getAttribute("email");
		map.put("id", id);
		System.out.println(map.toString());
		int r = infoDao.insertInfomation(map);
		String str = "";
		if(r==1){
			System.out.println("YYY???");
			str = "YYY";
		}else{
			System.out.println("NNN???");
			str = "NNN";
		}
		return str;
	}
	
	@RequestMapping("/informationdetail")
	public ModelAndView DetailDate(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("t_infoidetail");
		List list = infoDao.getDetailinfo(map);
		mav.addObject("list",list);
		return mav;
	}
	
}
