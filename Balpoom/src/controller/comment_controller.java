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

import models.commentDao;

@Controller
@RequestMapping("/")
public class comment_controller {
		@Autowired
		commentDao cdao;
		
		@RequestMapping("/comment")
		@ResponseBody
		public String comment(@RequestParam Map map, HttpSession session, @RequestParam (name="rcomment")String rcomment,
				@RequestParam (name="roomnumber") String roomnumber){
			Map Cmap = new HashMap();
			ModelAndView mav = new ModelAndView();
			String yesNo = "";
			String email = (String)session.getAttribute("email");
			String id = (String)session.getAttribute("id");
			//String comment = (String)map.get("comment");
			Cmap.put("id",id);
			Cmap.put("email", email);
			Cmap.put("rcomment", rcomment);
			Cmap.put("roomnumber", roomnumber); // 매물 번호
			
			System.out.println("코멘트 이메일 : "+email);
			System.out.println("코멘트 아이디 : "+id);
			System.out.println("코멘트 : "+rcomment);
			System.out.println("매물 번호 : "+roomnumber);
			int r = cdao.comment(Cmap);
			System.out.println("성공 여부 "+r);
			if(r == 1){
				System.out.println("YYY???");
				yesNo = "YYY";
				
			}else{
				System.out.println("NNN???");
				yesNo = "NNN";
			}
			return yesNo;

		}
		
		@RequestMapping("/commentdel")
		@ResponseBody
		public String commentdel(HttpSession session, @RequestParam(name="num")int num){
			String yesNo = "";
			String id = (String)session.getAttribute("email");
			int r = cdao.Delcomment(num, id);
			if(r == 1){
				yesNo = "YY";			
			}else{
				yesNo="NN";
			}
			return yesNo;
			
		}
	
}










