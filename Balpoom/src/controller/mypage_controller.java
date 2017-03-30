package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.imgDao;
import models.mongoDao;
import models.mypageDao;
import utils.Urlpicture;

@Controller
@RequestMapping("/")
public class mypage_controller {
	@Autowired
	mypageDao mdao;
	@Autowired
	Urlpicture upic;
	@Autowired
	mongoDao mDao;
	@Autowired
	imgDao iDao;
	
	
	
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

		mav.setViewName("mypage");
		return mav;
	}

	@RequestMapping("/complate")
	@ResponseBody
	public String complate(HttpSession session, @RequestParam (name="sell")String sell,
			HttpServletRequest req) {
		String yesNo = "";
		String id = (String) session.getAttribute("email");
		Map map = new HashMap();
		map.put("id", id);
		map.put("sell", sell);
		int r = mdao.complate(map);
		System.out.println("complate? ===> "+r);
		File file2 = new File("/images/사진/");
		String file22 = file2.getPath();
		String realpath2 = (String)req.getRealPath(file22);
		int num = Integer.parseInt(sell);
		if (r == 1) {
			//방 삭제 되었을때 사진 폴더 삭제하는 메서드
			iDao.imageDelete3(realpath2,id,num);
			yesNo = "CY";
		} else {

		}
		return yesNo;
	}

}
