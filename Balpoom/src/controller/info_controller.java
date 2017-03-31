package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import models.infoporfileChange;
import models.infoDao;

@Controller
@RequestMapping("/")
public class info_controller {
	@Autowired
	infoDao idao;
	
	
	@Autowired
	infoporfileChange iffc;


	
	
	@RequestMapping("/t_info")
	public ModelAndView infomain(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		System.out.println(email+"...................");
		Map info = idao.info(email);
		String tele = (String)info.get("TELENUM");
		String tele1 =tele.split("-")[0];
		String tele2 =tele.split("-")[1];
		String tele3 =tele.split("-")[2];
		mav.addObject("tele1",tele1);
		mav.addObject("tele2",tele2);
		mav.addObject("tele3",tele3);
		mav.addObject("info",info);
		mav.setViewName("t_info");

		return mav;
	}
	@RequestMapping("/infochange")
	public ModelAndView infochange(@RequestParam Map map, HttpSession session) throws Exception{
		//Map img = iffc.execute(file);
		//String uimg = (String)img.get("filelink");
		//map.put("uimg", uimg);
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		String num1 = (String)map.get("telenum1");
		String num2 = (String)map.get("telenum2");
		String num3 = (String)map.get("telenum3");
		String telenum = 	num1+"-"+num2+"-"+num3;
		map.put("telenum", telenum);
		map.put("sid", id);
		System.out.println(map.toString());
		int r  = idao.infochange(map);
		if(r==1){
			session.removeAttribute("id");
			session.setAttribute("id", map.get("id"));
			mav.setViewName("t_main");			
		}	
		return mav;
	}
	

//	@RequestMapping("/passcheckAjax")
//	public ModelAndView PcheckAjax(@RequestParam (name="PASS") String password, HttpSession session){
//		ModelAndView mav = new ModelAndView();
//		System.out.println(password);
//		String id = (String)session.getAttribute("id");
//		Map map = new HashMap();
//		map.put("id", id);
//		map.put("password", password);
//		int r = idao.passcheckAjax(map);
//		System.out.println("���Ǿ��̵� : "+id);
//		System.out.println(r+"???????????");
//		String n = "NNNNN";
//		String y ="YYYYY";
//	
//		if(r==1){
//			mav.addObject("NNNNN");
//			mav.setViewName("t_info");
//			
//		}else{
//			mav.addObject("YYYYY");
//			mav.setViewName("t_info");
//		}
//		return mav;
//	}
	

	@RequestMapping("/passcheckAjax")
	@ResponseBody
	public String PcheckAjax(@RequestParam (name="Pass") String password, HttpSession session){
		ModelAndView mav = new ModelAndView("");
		System.out.println(password);
		String id = (String)session.getAttribute("id");
		Map map = new HashMap();
		map.put("id", id);
		map.put("password", password);
		int r = idao.passcheckAjax(map);
		System.out.println("���Ǿ��̵� : "+id);
		System.out.println(r+"???????????");
	
		if(r==1){
			return "YYYYY";
			
		}else{
			return "NNNNN";
		}
		
	}
	
	
}











