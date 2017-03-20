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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import models.roomDao;
import utils.Urlpicture;
import utils.Urlpictures;

@Controller
public class main_controller {
	
	@Autowired
	roomDao rd;
	@Autowired
	Urlpicture urp;
	@Autowired
	Urlpictures urps;
	
	@RequestMapping("/")
	public ModelAndView mainHandler() {
		ModelAndView mav = new ModelAndView("t_main");
		return mav;
	}
	
	@RequestMapping("/search")
	public ModelAndView searchHandler() throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("t_search");
		List<HashMap<String, Object>> mlist = rd.test_room(); // 데이터 베이스 처리 결과 input
// ===================================================== /search 처리 코드 
		List<Integer> numbers =new ArrayList<>();
		int defnum = 7682481;
		List<String> urlcol = new ArrayList<>();
		JSONArray urlcolj= null;
		JSONArray numbersj = null;
	

		JSONArray json_arr = new JSONArray();// Json 객체 로 만들기
		for (Map<String, Object> map : mlist) {
			JSONObject json_obj = new JSONObject();
			String url = null;
			String input = null;
			//System.out.println(map.get("SELL_NUM"));
			int num = 7666495;
			num = Integer.parseInt(map.get("SELL_NUM") + "");
			input = "https://www.zigbang.com/items1/" + num;
		
			try {
				//System.out.println("urp=" + urp.get_main_url(input));
				url = (urp.get_main_url(input));
				numbers.add(num);} catch (Exception e) {
			
				//e.printStackTrace();
				url = "http://z1.zigbang.com/items/"+defnum +"/538ec7a16033f0c32eac29ac50deb04a1e6bf3ba.jpg?h=800&q=60";
			}
			//System.out.println(url);
			urlcol.add(url);
			urlcolj = new JSONArray(urlcol);
			numbersj = new JSONArray(numbers);
			String temp=new ObjectMapper().writeValueAsString(urlcol);
			//System.out.println(temp);
			//System.out.println("urlcolj="+urlcolj.toString());
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();

				try {

					json_obj.put(key, value);
				} catch (Exception e) {
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
//=========================================================================search code처리 
		return mav;

	}

	@RequestMapping("/detail")
	public ModelAndView detailViewHandler(@RequestParam Map n, HttpServletRequest req) {
		//사진처리 
		JSONArray picturesJ= null;
		Urlpictures ulps = new Urlpictures();
		int num = Integer.parseInt(n.get("num")+"");
	
		
		System.out.println("num======================>"+num);
		List<String> all=  ulps.get_picture_urls("https://www.zigbang.com/items1/"+num);
		picturesJ = new JSONArray(all);
		ModelAndView mav = new ModelAndView("t_detail");
		mav.addObject("pj", all);	
	
		return mav;

	}

	//test 용 신경쓰지 말것
	@RequestMapping("/testing")
	public ModelAndView testing(){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> mlist = rd.test_room();
	
		mav.addObject("mlist",mlist);
		mav.addObject("mlistsize",mlist.size());
		mav.setViewName("/testing/test");
		return mav;
	}

}
