package org.baseball.kia.subin.controller;

import org.baseball.kia.subin.entity.UniformInfoVo;
import org.baseball.kia.subin.entity.UniformInfoPage;
import org.baseball.kia.subin.service.UniformInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller("uniformInfoConroller_subin")
public class UniformInfoController {

	@Autowired
	UniformInfoService uniformInfoService;

	@RequestMapping(value = "/admin/uniformInfo")
	public String uniformHandle(Model model) { // 상품 관리 페이지 호출
		model.addAttribute("menu", "uniform");
		return "/admin/uniformInfo";
	}

	@RequestMapping(value = "/admin/uniformInfo/search")
	public String uniformInfoSearchHandle(@ModelAttribute UniformInfoPage page, Model model) { // 유니폼 검색
		page.setTotalList(uniformInfoService.selectUniformInfoCnt()); // 검색 결과 데이터 개수
		page.setUniformInfoList(uniformInfoService.selectUniformInfo(page));
		System.out.println(page);
		model.addAttribute("page", page);
		return "/admin/uniformInfo-list";

	}

	@RequestMapping(value = "/admin/uniformInfo/update", method = RequestMethod.GET)
	public String uniformInfoUpdateHandle(@RequestParam int uniInfoNo, Model model) { // 유니폼 정보 수정 페이지 요청
		model.addAttribute("uniformInfo", uniformInfoService.selectUniformInfoOne(uniInfoNo));
		model.addAttribute("menu", "uniform");
		return "/admin/uniformInfo-update";
	}

	@RequestMapping(value = "/admin/uniformInfo/update", method = RequestMethod.POST)
	public String uniformInfoUpdatePostHandle(@ModelAttribute UniformInfoVo vo, @RequestParam MultipartFile attach) { // 유니폼 정보 수정
		if (uniformInfoService.updateUniformInfo(vo, attach)) {
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
		if (uniformInfoService.insertUniformInfo(vo, attach)) {
			return "redirect: /admin/uniformInfo";
		} else {
			return "redirect: /admin/uniformInfo/insert";
		}
	}

	@RequestMapping(value = "/admin/uniformInfo/delete")
	public String uniformInfoDeletePostHandle(@RequestParam int uniInfoNo) { // 유니폼 정보 삭제
		if (uniformInfoService.deleteUniformInfo(uniInfoNo)) {
			return "redirect: /admin/uniformInfo";
		} else {
			return "redirect: /admin/uniformInfo/update?uniInfoNo=" + uniInfoNo;
		}
	}
}
