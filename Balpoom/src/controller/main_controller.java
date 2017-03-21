package controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import models.roomDao;
import utils.Urlpicture;


@Controller
public class main_controller {
	
	@Autowired
	roomDao rd;
	@Autowired
	Urlpicture urp;

	
	@RequestMapping("/")
	public ModelAndView mainHandler() {
		ModelAndView mav = new ModelAndView("t_main");
		return mav;
	}
	
	@RequestMapping("/searchlist")
	public ModelAndView slHandler() {
		ModelAndView mav = new ModelAndView("/search/searchlist");
		return mav;
	}
	
	@RequestMapping("/search")
	public ModelAndView searchHandler() throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("t_search");
		/*-------------------------------------------------
		 * List<HashMap<String, Object>> mlist = database result 값 
		 * 
		 * 
		 * ------------------------------------------------*/
		List<HashMap<String, Object>> mlist = rd.test_room();
		/*
		 *  search 처리 코드 
		 */
		List<Integer> numbers =new ArrayList<>();
		int defnum = 7682481;//에러시 이번호도 처리가 안되는거라서 바꿔줘야함 
		List<String> urlcol = new ArrayList<>();
		JSONArray urlcolj= null;
		JSONArray numbersj = null;
	

		JSONArray json_arr = new JSONArray();// Json 객체 로 만들기
		for (Map<String, Object> map : mlist) {
			JSONObject json_obj = new JSONObject();
			String url = null;
			String input = null;
			//System.out.println(map.get("SELL_NUM"));
			int num = defnum;
			num = Integer.parseInt(map.get("SELL_NUM") + "");
			input = "https://www.zigbang.com/items1/" + num;
		
			try {
				//System.out.println("urp=" + urp.get_main_url(input));
				//url = (urp.get_main_url(input));
				numbers.add(num);} catch (Exception e) {
			
				//e.printStackTrace();
				url = "http://z1.zigbang.com/items/"+defnum +"/538ec7a16033f0c32eac29ac50deb04a1e6bf3ba.jpg?h=800&q=60";
			}
			
			urlcol.add(url);
			urlcolj = new JSONArray(urlcol);
			numbersj = new JSONArray(numbers);
			String temp=new ObjectMapper().writeValueAsString(urlcol);
			
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();

				try {json_obj.put(key, value);} catch (Exception e) {
					// TODO Auto-gen erated catch block
					//e.printStackTrace();
				}
			}
			(json_arr).put(json_obj);

		}

	
		//System.out.println("numbers= "+ numbersj.toString());
		mav.addObject("dn", defnum );
		mav.addObject("nj",numbersj);
		mav.addObject("mpic", urlcolj);
		mav.addObject("mlist", json_arr.toString());
		mav.addObject("msize", mlist.size());
		mav.setViewName("t_search");

		return mav;

	}

	@RequestMapping("/detail")
	public ModelAndView detailViewHandler(@RequestParam Map n, HttpServletRequest req) {
		//사진처리 
		JSONArray picturesJ= null;
		int num = Integer.parseInt(n.get("num")+"");
	
		
		System.out.println("num======================>"+num);
		List<String> all=  urp.get_picture_urls("https://www.zigbang.com/items1/"+num);
		picturesJ = new JSONArray(all);
		ModelAndView mav = new ModelAndView("t_detail");
		mav.addObject("pj", all);	
	
		return mav;

	}

	//test 용 신경쓰지 말것
	@RequestMapping("/testing")
	@ResponseBody
	public HashMap testing(@RequestParam Map n){
		ModelAndView mav = new ModelAndView();
		int cur = Integer.parseInt( (String) n.get("curr"));
		String list = (String) n.get("list");
		String[] arr = list.split(",");
		String input = null;
	
		List<String> ur = new ArrayList<>();
		HashMap map = new HashMap();
	
		for(int i= 0 ; i <= 3 ; i++){
			
			input = "https://www.zigbang.com/items1/" + arr[i];
			map.put(i,(urp.get_main_url(input)));
			
		}return map;}

//	@RequestMapping("/chatajax")
//	@ResponseBody
//	public void chatAjax(@RequestParam Map n, HttpSession session, HttpServletRequest request) {
//		System.out.println("=============chatAjax=============");
//		ModelAndView mav = new ModelAndView();
//		String msg = request.getParameter("msg");
//		String id = (String) session.getAttribute("id");
//		System.out.println("msg->" + msg + "id->" + id);
//		HashMap map = new HashMap();
//		
//		map.put("id", id);
//		map.put("msg", msg);
//		chatlog.add(map);
//		session.setAttribute("listc", chatlog);
//		System.out.println("chatlogsize=" + chatlog.toString());
//
//	}
}
