package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import models.databaseDao;

@Controller
@RequestMapping("/database")
public class database_controller {
	
	@Autowired
	databaseDao dDao;
	
	
	@RequestMapping("/sell_info")
	//초기 데이터 매물정보 등록입니다.
	public void Test01() throws Exception{
	int r = dDao.Test01();
	}
	// 초기 부동산 정보 등록입니다.
	@RequestMapping("/agent_info")
	public void Test02() throws Exception{
		int r = dDao.Test02();
	}
	
}
