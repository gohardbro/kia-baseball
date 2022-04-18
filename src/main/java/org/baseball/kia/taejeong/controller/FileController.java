package org.baseball.kia.taejeong.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.entity.TFileVo;
import org.baseball.kia.taejeong.service.TFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	
	@Autowired
	TFileService tFileService;
	
	@RequestMapping("/modify/profile/upload")
	public String uploadHandle(@RequestParam("file") MultipartFile multipartFile, HttpSession httpSession, Model model) {
		try {
			AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
			TFileVo tFileVo = tFileService.saveFile(multipartFile);
			boolean r = tFileService.modifyProfile(loginUserVo, tFileVo);
			if(r)
				model.addAttribute("msg", "프로필 사진이 변경 되었습니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/account";
	}
}
