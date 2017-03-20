package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.agentDao;

@Controller
@RequestMapping("/broker_join")
public class broker_join_controller {
	@Autowired
	agentDao aDao;

	@RequestMapping("/click_wrap")
	public ModelAndView wrap_join(){
		ModelAndView mav = new ModelAndView("t_clickwrapjoin");
		return mav;
	}
	
	@RequestMapping("/join")
	public ModelAndView broker_join(){
		ModelAndView mav = new ModelAndView("t_brokerjoin");
		
		
		return mav;
	}
	@RequestMapping("/data")
	public ModelAndView broker_join_data(HttpServletRequest req, @RequestParam Map map){
		
		ModelAndView mav = new ModelAndView();
		String[] ar = req.getParameterValues("bk_agentnum");
		String bk_agentnum = ar[0]+"-"+ar[1]+"-"+ar[2];
		String[] arr = req.getParameterValues("bk_contact");
		String bk_contact = arr[0]+"-"+arr[1]+"-"+arr[2];
		map.put("bk_contact", bk_contact);
		map.put("bk_agentnum", bk_agentnum);
		int r = aDao.insertOneAgent(map);
		System.out.println(ar[0]+"-"+ar[1]+"-"+ar[2]);
		if(r==1){
			mav.setViewName("/broker_join/welcome");
		}else{
			mav.setViewName("/broker_join/fail");
		}
		return mav;
	}
	
}
