package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.agentDao;
import models.joinDao;

@Controller
@RequestMapping("/broker_join")
public class broker_join_controller {
	@Autowired
	agentDao aDao;
	
	@Autowired
	joinDao jDao;

	
	
	@RequestMapping("/join")
	public ModelAndView broker_join(){
		ModelAndView mav = new ModelAndView("t_brokerjoin");
		
		
		return mav;
	}
	@RequestMapping("/data")
	public ModelAndView broker_join_data(HttpServletRequest req, @RequestParam Map map){
		
		ModelAndView mav = new ModelAndView("t_brokerjoin");
		String[] ar = req.getParameterValues("bk_agentnum");
		
		String bk_agentnum = ar[0]+"-"+ar[1]+"-"+ar[2];
		String[] arr = req.getParameterValues("bk_contact");
		String bk_contact = arr[0]+"-"+arr[1]+"-"+arr[2];
		String[] ar1 = req.getParameterValues("bk_address");
		String bk_address = ar1[0]+""+ar1[1];
		
		map.put("bk_address", bk_address);
		map.put("bk_contact", bk_contact);
		map.put("bk_agentnum", bk_agentnum);
		int r = aDao.insertOneAgent(map);
		
		if(r==1){
			mav.setViewName("/broker_join/welcome");
		}else{
			
			mav.addObject("fail","fail");
		}
		return mav;
	}
	@RequestMapping("/brokercheckAjax")
	public void brokerCheckAjax(HttpServletRequest req, HttpServletResponse response) throws IOException{
		
		String id = req.getParameter("id123");
		PrintWriter writer = response.getWriter();

				
		int rst = jDao.brokerajax(id);
		if(rst==1)
			 writer.write("y");
		else
			writer.write("n");
		
		writer.flush();
		writer.close();
	}
	
}
