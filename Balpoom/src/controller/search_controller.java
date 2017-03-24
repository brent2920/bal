package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.searchDao;

@Controller
public class search_controller {
	
	@Autowired
	searchDao sDao;
	
	@RequestMapping("/searchtst")
	public ModelAndView searchHandler(
				@RequestParam(name="keyword", defaultValue="서울시청") 
					String keyword) throws Exception {
		ModelAndView mav = new ModelAndView("t_search");
		System.out.println("Search Keyword : " + keyword);
		mav.addObject("location", sDao.getLatLng(keyword));
		
		return mav;
	}
	
}
