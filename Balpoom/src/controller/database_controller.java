package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import models.databaseDao;

@Controller
@RequestMapping("/")
public class database_controller {
	
	@Autowired
	databaseDao dDao;
	
	
	@RequestMapping("/database")
	public void Test01() throws Exception{
		dDao.Test01();
	}
	
}
