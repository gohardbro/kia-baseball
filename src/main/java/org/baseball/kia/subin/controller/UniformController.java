package org.baseball.kia.subin.controller;

import org.baseball.kia.subin.entity.UniformInfoVo;
import org.baseball.kia.subin.service.UniformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UniformController {
	
	@Autowired
	UniformService uniformService;
	
	@RequestMapping(value = "/admin/uniformInfo")
	public String uniformHandle(Model model) { // 상품 관리 페이지 호출
		model.addAttribute("menu", "uniform");
		return "/admin/uniformInfo";
	}

	@RequestMapping(value = "/admin/uniformInfo/search")
	public String uniformInfoSearchHandle(@RequestParam(required = false) String type, @RequestParam(required = false) String word, Model model) { // 유니폼 검색
		UniformInfoVo vo = new UniformInfoVo();
		if (type != null) {
			if (type.equals("uniformName")) {
				vo.setUniformName(word);

			} else if (type.equals("color")) {
				vo.setColor(word);
				
			}
			model.addAttribute("uniformInfoList", uniformService.selectUniformInfo(vo));
			return "/admin/uniformInfo-list";

		} else {
			model.addAttribute("uniformInfoList", uniformService.selectUniformInfo(null));
			return "/admin/uniformInfo-list";

		}
	}

	@RequestMapping(value = "/admin/uniformInfo/update", method = RequestMethod.GET)
	public String uniformInfoUpdateHandle(@RequestParam int uniInfoNo, Model model) { // 유니폼 정보 수정 페이지 요청
		UniformInfoVo vo = new UniformInfoVo();
		vo.setUniInfoNo(uniInfoNo);
		model.addAttribute("uniformInfo", uniformService.selectUniformInfo(vo).get(0));
		model.addAttribute("menu", "uniform");
		return "/admin/uniformInfo-update";
	}

	@RequestMapping(value = "/admin/uniformInfo/update", method = RequestMethod.POST)
	public String uniformInfoUpdatePostHandle(@ModelAttribute UniformInfoVo vo, @RequestParam MultipartFile attach) { // 유니폼 정보 수정
		if (uniformService.updateUniformInfo(vo, attach)) {
			return "redirect: /admin/uniformInfo";
		} else {
			return "redirect: /admin/uniformInfo/update?uniInfoNo=" + vo.getUniInfoNo();
		}
	}

	@RequestMapping(value = "/admin/uniformInfo/insert", method = RequestMethod.GET)
	public String uniformInfoInsertHandle(@ModelAttribute UniformInfoVo vo, Model model) { // 유니폼 정보 등록 페이지 요청
		
		model.addAttribute("menu", "uniform");
		return "/admin/uniformInfo-insert";
	}

	@RequestMapping(value = "/admin/uniformInfo/insert", method = RequestMethod.POST)
	public String uniformInfoInsertPostHandle(@ModelAttribute UniformInfoVo vo, @RequestParam MultipartFile attach) { // 유니폼 정보 등록
		if (uniformService.insertUniformInfo(vo, attach)) {
			return "redirect: /admin/uniformInfo";
		} else {
			return "redirect: /admin/uniformInfo/insert";
		}
	}

	@RequestMapping(value = "/admin/uniformInfo/delete")
	public String uniformInfoDeletePostHandle(@RequestParam int uniInfoNo) { // 유니폼 정보 삭제
		if (uniformService.deleteUniformInfo(uniInfoNo)) {
			return "redirect: /admin/uniformInfo";
		} else {
			return "redirect: /admin/uniformInfo/update?uniInfoNo=" + uniInfoNo;
		}
	}
}
