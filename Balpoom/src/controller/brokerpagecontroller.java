package controller;

import java.io.File;
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

import models.brokerpageDao;
import models.imgDao;
import models.mongoDao;
import models.mypageDao;
import utils.Urlpicture;

@Controller
@RequestMapping("/broker")
public class brokerpagecontroller {
	@Autowired
	brokerpageDao bdao;
	@Autowired
	Urlpicture upic;
	@Autowired
	mongoDao mDao;
	@Autowired
	imgDao iDao;

	@RequestMapping("/page")
	@ResponseBody
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("brokerid");
		Map map = new HashMap();
		map.put("id", id);
		List<HashMap> list = bdao.brokerlist(map);
		ArrayList<HashMap> arrList = new ArrayList<>();
		String input = null;
		System.out.println("List Size : " + list.size());
		//몽고에서 이미지 하나 가져오기
		for (HashMap Imap : list) {
			String num = Imap.get("SELL_NUM").toString();
			
			String img = mDao.OneImage(num);
			Imap.put("IMAGE", img);
			arrList.add(Imap);
		}

		if (arrList.size() == 0) {
			mav.addObject("listzero", 0);
		} else {
			mav.addObject("list", arrList);

		}

		mav.setViewName("brokerpage");
		return mav;
	}

	@RequestMapping("/complate")
	@ResponseBody
	public String complate(HttpSession session, @RequestParam (name="sell")String sell) {
		String yesNo = "";
		String id = (String) session.getAttribute("brokerid");
		Map map = new HashMap();
		map.put("id", id);
		map.put("sell", sell);
		int r = bdao.complate(map);
		System.out.println("complate? ===> "+r);

		if (r == 1) {
			iDao.imageDelete2();
			yesNo = "CY";
		} else {

		}
		return yesNo;
	}
}
