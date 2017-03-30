package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.newsDao;

@Controller
@RequestMapping("/")
public class news_controller {
	@Autowired
	newsDao ndao;
	
	@RequestMapping("/news_add")
	public ModelAndView news_reg(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/news/news_add");
		return mav;
		
		
	}
	@RequestMapping("/news_list")
	public ModelAndView news_list(){
		ModelAndView mav = new ModelAndView();
		List<Map> news  = ndao.get_news();
		mav.setViewName("news_list");
		mav.addObject("news",news);
		return mav;
		
		
	}
	@RequestMapping("/news_insert")
	@ResponseBody
	public String news_insert(@RequestParam Map map){
		String yesNo = "";
		ModelAndView mav = new ModelAndView();
		int r;
		Map newsmap = new HashMap();
		String title = (String) map.get("title");
		String url = (String)map.get("url");
		System.out.println("title:"+ title + " url:"+ url);
		newsmap.put("title", title);
		newsmap.put("url", url);
		
	     r = ndao.news_insert(newsmap);
	     System.out.println(r);
	 	if(r == 1){
			System.out.println("YYY???");
			yesNo = "YYY";
			
		}else{
			System.out.println("NNN???");
			yesNo = "NNN";
		}
		return yesNo;
		
	}
	
	@RequestMapping("/get_news")
	public List<Map> get_news(@RequestParam Map map){
		ModelAndView mav = new ModelAndView();
		List<Map> news  = ndao.get_news();
		mav.addObject("news",news);
		mav.setViewName("news_list");
		return news;
		
	}


}
