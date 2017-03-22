package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.HashBiMap;

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
		ModelAndView mav = new ModelAndView("searchlist");
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
		 * search 처리 코드
		 */
		List<Integer> numbers = new ArrayList<>();
		int defnum = 7682481;// 에러시 이번호도 처리가 안되는거라서 바꿔줘야함
		List<String> urlcol = new ArrayList<>();
		JSONArray urlcolj = null;
		JSONArray numbersj = null;

		JSONArray json_arr = new JSONArray();// Json 객체 로 만들기
		for (Map<String, Object> map : mlist) {
			JSONObject json_obj = new JSONObject();
			String url = null;
			String input = null;
			// System.out.println(map.get("SELL_NUM"));
			int num = defnum;
			num = Integer.parseInt(map.get("SELL_NUM") + "");
			input = "https://www.zigbang.com/items1/" + num;

			try {
				// System.out.println("urp=" + urp.get_main_url(input));
				// url = (urp.get_main_url(input));
				numbers.add(num);
			} catch (Exception e) {

				// e.printStackTrace();
				url = "http://z1.zigbang.com/items/" + defnum
						+ "/538ec7a16033f0c32eac29ac50deb04a1e6bf3ba.jpg?h=800&q=60";
			}
			//System.out.println("numbers=>"+ numbers);
			urlcol.add(url);
			urlcolj = new JSONArray(urlcol);
			numbersj = new JSONArray(numbers);
			String temp = new ObjectMapper().writeValueAsString(urlcol);

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();

				try {
					json_obj.put(key, value);
				} catch (Exception e) {
					// TODO Auto-gen erated catch block
					// e.printStackTrace();
				}
			}
			(json_arr).put(json_obj);

		}

		//System.out.println("numbersj= "+ numbersj.toString());
		mav.addObject("dn", defnum);
		mav.addObject("nj", numbersj);
		mav.addObject("mpic", urlcolj);
		mav.addObject("mlist", json_arr.toString());
		mav.addObject("msize", mlist.size());
		mav.setViewName("t_search");

		return mav;

	}

	@RequestMapping("/detail")
	public ModelAndView detailViewHandler(@RequestParam Map n, HttpServletRequest req, HttpServletResponse resp) {
		// 사진처리

		JSONArray picturesJ = null;
		int num = Integer.parseInt(n.get("num") + "");

		Cookie c = new Cookie(String.valueOf(n.get("num")), String.valueOf(n.get("num")));
		c.setMaxAge(60 * 60);
		resp.addCookie(c);

		
		List<String> all = urp.get_picture_urls("https://www.zigbang.com/items1/" + num);
		picturesJ = new JSONArray(all);
		ModelAndView mav = new ModelAndView("t_detail");
		mav.addObject("pj", all);

		return mav;

	}

	// search paging ajax 처리
	@RequestMapping("/testing")
	@ResponseBody
	public HashMap testing(@RequestParam Map n) {
		ModelAndView mav = new ModelAndView();
		int cur = Integer.parseInt((String) n.get("curr"));
		String list = (String) n.get("list");
		String[] arr = list.split(",");
		String input = null;

		List<String> ur = new ArrayList<>();
		HashMap map = new HashMap();

		for (int i = 0; i <= 3; i++) {

			input = "https://www.zigbang.com/items1/" + arr[i];
			map.put(i, (urp.get_main_url(input)));

		}
		return map;
	}
	
	@RequestMapping("/searchTest")
	@ResponseBody
	public List<HashMap<String, Object>> roomListHandler(
			@RequestParam(name="mKind") String mKind, 
			@RequestParam(name="rKind[]") List<String> rKind, 
			@RequestParam(name="deposit_from") String deposit_from, 
			@RequestParam(name="deposit_to") String deposit_to, 
			@RequestParam(name="mpay_from") String mpay_from, 
			@RequestParam(name="mpay_to") String mpay_to, 
			@RequestParam(name="parking", required=false, defaultValue="all") String parking, 
			@RequestParam(name="pet", required=false, defaultValue="all") String pet, 
			@RequestParam(name="lhok", required=false, defaultValue="all") String lhok, 
			@RequestParam(name="area[]" , required=false, defaultValue="all") List<String> area, 
			@RequestParam(name="floor[]", required=false, defaultValue="all") List<String> floor,
			@RequestParam(name="east") String east,
			@RequestParam(name="west") String west,
			@RequestParam(name="south") String south,
			@RequestParam(name="north") String north
			) {
		
		// 보증금 세팅 - 문자제거
		String[] d_from = deposit_from.split("\\s");
		String[] d_to = deposit_to.split("\\s");
		
		// 월세 세팅 - 문자제거
		String[] m_from = mpay_from.split("\\s");
		String[] m_to = mpay_from.split("\\s");
		
		// 평수 세팅
		// 0 : 전체 / 1 : 5평 이하 / 2 : 5~10평 / 3 : 10평 이상 
		int areaFlag = 0;
		for(String m : area) {
			if(m.equals("lt_5"))
				areaFlag = 1;
			else if(m.equals("bt_5_10"))
				areaFlag = 2;
			else if(m.equals("gt_10"))
				areaFlag = 3;
		}
		
		HashMap<String, Object> searchConditions = new HashMap<>();
			searchConditions.put("mKind", mKind);
			searchConditions.put("rKind", rKind);
			searchConditions.put("deposit_from", d_from[0]);
			searchConditions.put("deposit_to", d_to[0]);
			searchConditions.put("mpay_from", m_from[0]);
			searchConditions.put("mpay_to", m_to[0]);
			searchConditions.put("parking", parking);
			searchConditions.put("pet", pet);
			searchConditions.put("lhok", lhok);
			searchConditions.put("area", areaFlag);
			searchConditions.put("floor", floor);
			searchConditions.put("east", east);
			searchConditions.put("west", west);
			searchConditions.put("south", south);
			searchConditions.put("north", north);
		
		List<HashMap<String, Object>> rList = rd.getRoomList(searchConditions);
		System.out.println("Room List Size : " + rList.size());
		return rList;
	}
}
