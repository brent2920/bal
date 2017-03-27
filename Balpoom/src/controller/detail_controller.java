package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.alterDao;
import models.roomDao;
import models.CLOBDao;
import utils.APIKeys;
import utils.Urlpicture;

@Controller
public class detail_controller {

	@Autowired
	roomDao rd;
	@Autowired
	Urlpicture urp;
	@Autowired
	alterDao aDao;
	@Autowired
	CLOBDao tDao;
	@Autowired
	APIKeys apiKey;

	@RequestMapping("/detail")
	public ModelAndView detailViewHandler(@RequestParam Map n, 
			HttpServletRequest req, HttpServletResponse resp) {
		
		// 사진처리
		JSONArray picturesJ = null;
		int num = Integer.parseInt(n.get("num") + "");

		Cookie c = new Cookie(String.valueOf(n.get("num")), String.valueOf(n.get("num")));
		c.setMaxAge(60 * 60);
		resp.addCookie(c);

		
		List<String> all = urp.get_picture_urls("https://www.zigbang.com/items1/" + num);
		picturesJ = new JSONArray(all);
		
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap<>();
		map=rd.getSelectedRoomInfo(num);
		String aterid= map.get("ID").toString();
		Map map1 = new HashMap<>();
		map1.put("alterid",aterid);
		
		map1.put("sell_num", num);
		Map map2 = new HashMap<>();
		map2 = tDao.test(map1);
		Map agentmap = new HashMap<>();
		Map personmap = new HashMap<>();
		agentmap = aDao.agentInfo(map1);
		personmap = aDao.personInfo(map1);
		
	
		if(agentmap != null){
		
			if(agentmap.get("BK_REGNAME").toString().length()>3){
				String REGNAME = agentmap.get("BK_REGNAME").toString();
			String BK_REGNAME =	REGNAME.substring( 
					agentmap.get("BK_REGNAME").toString().indexOf("(")+1,
					agentmap.get("BK_REGNAME").toString().indexOf(")"));
			
				agentmap.put("BK_REGNAME", BK_REGNAME);
			}
			
			String BK_OFFICENAME = agentmap.get("BK_OFFICENAME").toString().substring(
				agentmap.get("BK_OFFICENAME").toString().indexOf("(")+1,
				agentmap.get("BK_OFFICENAME").toString().indexOf(")")
			);
			agentmap.put("reg", BK_OFFICENAME);
			mav.addObject("list",agentmap);
			mav.setViewName("t_detail");
		
		}else{
			
			mav.addObject("list",personmap);
			mav.setViewName("t_detail1");
		}
		mav.addObject("list2",map2);
		mav.addObject("list1",map);
		mav.addObject("pj", all);
		mav.addObject("apiKey", apiKey.getGOOGLE_MAP_KEY());

		return mav;
	}
}
