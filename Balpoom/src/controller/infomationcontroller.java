package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView InfoAllList(HttpServletRequest req){
		ModelAndView mav = new ModelAndView("t_infolist");
		List list = infoDao.getTitle();
		mav.addObject("infolist",list);
		List pagelist = new ArrayList<>();
		int cnt = list.size();
		int size = cnt % 10 == 0 ? cnt / 10 : cnt / 10 + 1;
		String p = req.getParameter("page") == null ? "1" : req.getParameter("page");
		int pp = Integer.parseInt(p);
		int start = 0;
		int end = 0;
		int end1 = (pp - 1) * 10;
		if (pp == 1) {
			start = pp - 1;
			end = pp * 10;
		} else {
			start = end1;
			end = Integer.parseInt(p) * 10;
		}
		pagelist.removeAll(pagelist);
		for(int i=start; end>list.size()? i<list.size() : i<end; i++){
			pagelist.add(list.get(i));
		}
	
		mav.addObject("size",size);
		mav.addObject("cnt",cnt);
		mav.addObject("page", p);
		mav.addObject("pagelist", pagelist);
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
	@RequestMapping("/informationdelete")
	public String deleteinfomation(@RequestParam Map map){
		int r =0;
		String str ="";
		
		 r = infoDao.deleteData(map);
		 System.out.println(r);
		 if(r>0){
			 System.out.println("yyy?");
			 str="YYY";
		 }else{
			 System.out.println("nnn?");
			 str ="NNN";
		 }
		return str;
	}
	
}
