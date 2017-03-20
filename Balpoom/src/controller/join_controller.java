package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.joinDao;

@Controller

//@RequestMapping("/")
public class join_controller {
	@Autowired
	joinDao jdao;
	
		@RequestMapping("/join")
		public ModelAndView join(@RequestParam Map map){
			ModelAndView mav = new ModelAndView();
			String num1 = (String)map.get("telenum1");
			String num2 = (String)map.get("telenum2");
			String num3 = (String)map.get("telenum3");
			String telenum = 	num1+"-"+num2+"-"+num3;
			String uimg = "/images/profile.jpg";
			map.put("uimg", uimg);
			map.put("telenum", telenum);
			int r = jdao.join(map);
			if(r==1){
				mav.setViewName("t_main");	
			}
			//mav.setViewName();
			return mav;
		}
		
//		@RequestMapping("/checkAjax")
//		public ModelAndView idajax(@RequestParam (name="id") String id){
//			ModelAndView mav = new ModelAndView();
//			String n = "NNNNN";
//			String y ="YYYYY";
//			int r = jdao.passajax(id);
//			if(r==1){
//				mav.addObject("NNNNN",n);
//				
//			}else{
//				mav.addObject("YYYYY",y);
//			}
//			return mav;
//		}
		
		
		
//		@RequestMapping("/Ajax")
//		@ResponseBody
//		public ModelAndView emailajax(@RequestParam (name="Eemail") String email){
//			ModelAndView mav = new ModelAndView();
//			int r = jdao.eamilajax(email);
//			if(r==1){
//				mav.addObject("NNNNN");				
//			}else{
//				mav.addObject("YYYYY");
//			}	
//			return mav;
//		}
		
		@RequestMapping("/EmailcheckAjax")
		@ResponseBody	
		public String EmailcheckAjax(@RequestParam(name="Eemail") String Eemail) {
			ModelAndView mav = new ModelAndView("t_join02");
			// boolean rst = mdao.useAvailableCheck(id);
			boolean rst = jdao.emailajax(Eemail);
			
			// 'YYYYY' or 'NNNNN'  이런 문자만 출력해주면 된다.
			if(rst) 
				return "YYYYY";
			else
				return "NNNNN";
		}
	}



















