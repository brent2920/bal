package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import models.CLOBDao;
import models.massageDao;
import models.zzimlistDao;
import utils.Urlpicture;

@Controller
@RequestMapping("/")
public class zzimlist_controller {
	@Autowired
	zzimlistDao zdao;
	@Autowired
	Urlpicture upic;
	@Autowired
	CLOBDao cdao;
	
	@Autowired
	massageDao msgdao;
	
	@RequestMapping("/zzimlist")
	public ModelAndView zzimlsit(HttpSession session) throws JsonProcessingException{
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		Map zzimD = new HashMap();
		zzimD.put("email", email);
		
		
		
		zdao.zzimlistdel(zzimD);
		mav.setViewName("zzimlist");
		
		
		// 메세지.=========================
		List list1 = new ArrayList();
		Map msgmap = new HashMap();
		String eemail ="";
		if(session.getAttribute("email") != null){
		eemail =(String)session.getAttribute("email");
		}
		msgmap.put("email", eemail);
		list1 = msgdao.msgfind(msgmap);
		if(list1 != null){
			System.out.println("잘들어갓냐?");
			mav.addObject("msglist",list1);
		
		}else{
			System.out.println("잘안들어갔나?");
			
		}
		// 메세지.=========================
		
		
		// 留ㅻЪ踰덊샇瑜� �씠�슜�븳 �궗吏� 遺덈윭�삤湲�
		List<HashMap> list = zdao.zzimlist(email);
		ArrayList<HashMap> arrList = new ArrayList<>();
		String input = null;
		System.out.println("List Size : " + list.size());
		for(HashMap  map : list) {
			input = "http://www.zigbang.com/items1/"+ map.get("SELL_NUM").toString();
			System.out.println("URL : " + input);
			map.put("IMAGE", (upic.get_main_url(input)));
			arrList.add(map);
		}
		
				
		if(arrList.size() == 0){
			mav.addObject("listsize",0);
		}else{
			mav.addObject("zzimlist", arrList);
		}
		return mav;
		
	}
	
	@RequestMapping("/zzimadd")
	@ResponseBody
	public String zzimadd(@RequestParam (name="roomnumber") int num, HttpSession session){
		String yesNo = "";
		int r = 0;
		String email = (String)session.getAttribute("email");
		Map map = zdao.zzimfind(num);
		map.put("sessionid", email);
		
		if(map.get("B_GLIST") == null){
			map.put("B_GLIST", "없음");
		}
		if(map.get("B_OPTION") == null){
			map.put("B_OPTION", "없음");
		}
	
		if(map != null){
			r = zdao.zzimadd(map);
			if(r == 1){
				yesNo = "ZY";
			}
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
