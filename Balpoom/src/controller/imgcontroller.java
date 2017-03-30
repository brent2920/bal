package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import models.imgDao;

@Controller
@RequestMapping("/")
public class imgcontroller {
	@Autowired
	imgDao iDao;
	
	@RequestMapping("/i")
	public ModelAndView image(){
		ModelAndView mav = new ModelAndView("/testing/test3_hyunwon");
		
		return mav;
		
	}
	@RequestMapping("/img")
	public void imgData(@RequestParam("file")MultipartFile file,
			HttpServletRequest req) throws IllegalStateException, IOException{
		
		String[] ar = req.getParameterValues("file");
		File file1 = new File("/images/�궗吏�/" + req.getParameter("num"));
		if(!file1.exists()){
			file1.mkdirs();
		}
		
		byte[] fileData = file.getBytes();
		FileOutputStream fos = null;
		for(int i =0; i<ar.length; i++)
		fos = new FileOutputStream("/images/�궗吏�/"+req.getParameter("num")+i);
		fos.write(fileData);
	
	}
	@RequestMapping("/delete")
	public void imagedelete(HttpServletRequest req){
		List<Map> list = new ArrayList<>();
		list = iDao.imageDelete();
		File file2 = new File("/images/사진/");
		String file22 = file2.getPath();
		String realpath2 = (String)req.getRealPath(file22);
		for(Map map : list){
		String str = map.get("SELL_NUM").toString();
		File file = new File(realpath2+"\\"+str);
		
		File[] files = file.listFiles();
		System.out.println(file.getAbsolutePath());
		for(File f :  files){
			boolean b = f.delete();
			
		}
		 boolean b = file.delete();
		
		
		}
	}
	
}
