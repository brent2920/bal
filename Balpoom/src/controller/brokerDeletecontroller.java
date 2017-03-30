package controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import models.brokerdeleteDao;
import models.imgDao;

@Controller
@RequestMapping("/")
public class brokerDeletecontroller {

	@Autowired
	brokerdeleteDao bDao;
	@Autowired
	imgDao iDao;
	
	@RequestMapping("/brokerdelete")
	public ModelAndView BrokerDelete( HttpServletRequest req
			,HttpSession session){
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap<>();
		String brokerid = (String) session.getAttribute("brokerid");
		String password = req.getParameter("delpass");
		map.put("brokerid", brokerid);
		map.put("password", password);
		
		int r = bDao.brokerDelete(map);
		System.out.println(r);
		File file2 = new File("/images/사진/");
		String file22 = file2.getPath();
		String realpath2 = (String)req.getRealPath(file22);
		
		if(r>0){
			
			iDao.imageDelete2(realpath2,brokerid);
			int a =bDao.roomDelete(map);
			mav.addObject("dmsg","회원탈퇴가 정상적으로 처리되었습니다.");
			mav.setViewName("t_main");
			session.removeAttribute("brokerid");
			session.removeAttribute("id1");
		}else{
			mav.addObject("dmsg","회원탈퇴가 실패했습니다.");
			mav.setViewName("t_main");
			}
		
		return mav;
		
	}
	
}
