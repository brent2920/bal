package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import models.mongoDao;

@Controller
@RequestMapping("/mongo")
public class mongocontroller {
	
	@Autowired
	mongoDao mDao;
	
	@RequestMapping("/database")
	public void MongoData() throws IOException{
		mDao.insert();
	}
	
	@RequestMapping("/getimg")
	public void Mongoget(HttpServletRequest req){
		String num = req.getParameter("num");
	
		mDao.OneImage(num);
		
	}
	@RequestMapping("/hospital")
	public void HosInsert() throws IOException{
		mDao.insert_hospital_api();
	}

}
