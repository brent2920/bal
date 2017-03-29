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

import models.mypageDao;
import utils.Urlpicture;

@Controller
@RequestMapping("/")
public class mypage_controller {
	@Autowired
	mypageDao mdao;
	@Autowired
	Urlpicture upic;

	@RequestMapping("/mypage")
	@ResponseBody
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("email");
		Map map = new HashMap();
		map.put("id", id);
		List<HashMap> list = mdao.mypagelist(map);
		ArrayList<HashMap> arrList = new ArrayList<>();
		String input = null;
		System.out.println("List Size : " + list.size());
		for (HashMap Imap : list) {
			input = "http://www.zigbang.com/items1/" + Imap.get("SELL_NUM").toString();
			System.out.println("URL : " + input);
			map.put("IMAGE", (upic.get_main_url(input)));
			String sell = Imap.get("SELL_NUM").toString();
			System.out.println("sell num ssibal ==> "+sell);
			arrList.add(Imap);
		}

		if (arrList.size() == 0) {
			mav.addObject("listzero", 0);
		} else {
			mav.addObject("list", arrList);

		}

		mav.setViewName("mypage");
		return mav;
	}

	@RequestMapping("/complate")
	@ResponseBody
	public String complate(HttpSession session, @RequestParam (name="sell")String sell) {
		String yesNo = "";
		String id = (String) session.getAttribute("email");
		Map map = new HashMap();
		map.put("id", id);
		map.put("sell", sell);
		int r = mdao.complate(map);
		System.out.println("complate? ===> "+r);

		if (r == 1) {
			yesNo = "CY";
		} else {

		}
		return yesNo;
	}

}
