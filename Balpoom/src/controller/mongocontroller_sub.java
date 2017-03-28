package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import models.mongoDao;

@Controller
@RequestMapping("/mongosub")
public class mongocontroller_sub {
	
	@Autowired
	mongoDao mDao;

	@RequestMapping("/hospital")
	public void HosInsert() throws IOException{
		mDao.insert_hospital_api();
	}

}
