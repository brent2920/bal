package controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import models.databaseDao;
import models.mongoDao;

@Controller
@RequestMapping("/database")
public class database_controller {
	
	@Autowired
	databaseDao dDao;
	
	@Autowired
	mongoDao mDao;
	
	
	
	//초기 데이터 매물정보 등록입니다.
	@RequestMapping("/sell_info")
	public void Test01() throws Exception{
	int r = dDao.Test01();
	}
	
	// 초기 부동산 정보 등록입니다.
	@RequestMapping("/agent_info")
	public void Test02() throws Exception{
		int r = dDao.Test02();
	}
	
	//몽고에 방 매물번호에 따른 이미지를 등록합니다.
	@RequestMapping("/mongo_imginsert")
	public void Mongo01() throws IOException{
		int r = mDao.inserImg();
	}
}
