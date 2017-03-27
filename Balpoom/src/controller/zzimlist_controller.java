package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import models.zzimlistDao;

@Controller
@RequestMapping("/")
public class zzimlist_controller {
	@Autowired
	zzimlistDao zdao;
	
	@RequestMapping("/zzimadd")
	@ResponseBody
	public String zzimadd(@RequestParam (name="roomnumber") int num, HttpSession session){
		String yesNo = "";
		int r = 0;
		String email = (String)session.getAttribute("email");
		Map map = zdao.zzimfind(num);
		map.put("sessionid", email);
		String t = (String)map.get("B_TITLE");
		if(map != null){
			r = zdao.zzimadd(map);
			if(r == 1){
				yesNo = "ZY";
			}else{	
			}
		}else{
			
		}

		return yesNo;
	}
	@RequestMapping("/zzimdel")
	@ResponseBody
	public String zzimdel(@RequestParam (name="roomnumber")int num, HttpSession session){
		String yesNo = "";
		int r = 0;
		String email = (String)session.getAttribute("email");
		Map map = new HashMap();
		map.put("num", num);
		map.put("sessionid", email);
		 r = zdao.zzimdel(map);
		 if ( r == 1){
			 yesNo = "ZN";
		 }
		
		
		return yesNo;
	}
}
