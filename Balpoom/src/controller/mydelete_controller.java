package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.imgDao;
import models.mydeleteDao;

@Controller
@RequestMapping("/")
public class mydelete_controller {
		@Autowired
		mydeleteDao mdao;
		@Autowired
		imgDao iDao;
	
//		@RequestMapping("/mydelete")
//		public ModelAndView mydelete(@RequestParam Map map, HttpSession session){
//			Map dMap = new HashMap();
//			ModelAndView mav = new ModelAndView();
//			String password = (String)map.get("delpass");
//			System.out.println(password);
//			String Eemail = (String)session.getAttribute("email");
//			dMap.put("Eemail", Eemail);
//			dMap.put("password", password);
//			int r = mdao.mydelete(dMap);
//			System.out.println("딜리트 join  ===> "+r);
//			if(r == 1){
//				int b = mdao.mydeleteRoom(Eemail);
//				System.out.println("딜리트 room  ===> "+b);
//				mav.addObject("dmsg","회원탈퇴가 정상적으로 처리 되었습니다");
//				session.removeAttribute("email");
//				session.removeAttribute("id");
//				mav.setViewName("t_main");
//			}else{
//				
//			}
//			return mav;
//		}
		
	@RequestMapping("/mydelete")
	@ResponseBody
		public String mydelete(@RequestParam Map map, HttpSession session, @RequestParam(name="delpass")String password){
		Map dMap = new HashMap();
		ModelAndView mav = new ModelAndView();
		//String password = (String)map.get("delpass");
		//System.out.println(password);
		//System.out.println("패스워드 확인 딜리트 : "+password);
		String Eemail = (String)session.getAttribute("email");
		dMap.put("Eemail", Eemail);
		dMap.put("password", password);
		int r = mdao.mydelete(dMap);
		//int cnt = 0;
		String yesNo = "";
		//System.out.println("딜리트 join  ===> "+r);
		if(r == 1){
			iDao.imageDelete2();
			int b = mdao.mydeleteRoom(Eemail);
		System.out.println("딜리트 room  ===> "+b);
		session.removeAttribute("email");
		session.removeAttribute("id");
			yesNo ="YY";
		}else if(r == 0){
			//cnt ++;
			//System.out.println("cnt 증가 여부 : "+cnt);
			//mav.addObject("passerror","비밀번호를 잘못 입력하셨습니다");
			yesNo = "NN";
		}
		return yesNo;
	
		
	}
		
}

















