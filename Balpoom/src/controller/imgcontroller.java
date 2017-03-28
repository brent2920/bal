package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

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
		File file1 = new File("/images/사진/" + req.getParameter("num"));
		if(!file1.exists()){
			file1.mkdirs();
		}
		
		byte[] fileData = file.getBytes();
		FileOutputStream fos = null;
		for(int i =0; i<ar.length; i++)
		fos = new FileOutputStream("/images/사진/"+req.getParameter("num")+i);
		fos.write(fileData);
	
	}
}
