package com.hirehigher.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hirehigher.command.JobBoardDetailVO;
import com.hirehigher.command.JobBoardVO;
import com.hirehigher.jobboard.service.JobBoardService;
import com.hirehigher.util.JobCriteria;
import com.hirehigher.util.JobPageVO;

@Controller
@RequestMapping("/jobBoard")
public class JobBoardController {
	
	//-----------------------------SERVICE 연결-----------------------------
	
	@Autowired
	@Qualifier("jobBoardService")
	private JobBoardService jobBoardService;
	
	//-----------------------------SERVICE 연결-----------------------------
	
	
	//--------------------------------화면 처리-------------------------------
	//등록 화면
	@RequestMapping("/jobRegist")
	public String jobRegist() {
		return "jobBoard/jobRegist";
	}
	
	//리스트 화면
	@RequestMapping("/jobList")
	public String jobList(Model model, JobCriteria cri) { //Model은 스프링에서 자동 주입, jobList.jsp 검색, 댓글 form 태그에서 값 받음
		
		ArrayList<JobBoardVO> jobVOList = jobBoardService.getList(cri);
		int total = jobBoardService.getTotal(cri);
		JobPageVO jobPageVO = new JobPageVO(cri, total); //(기준 페이지, 총 페이지 수)
		
		//model에 담아서 화면으로
		model.addAttribute("jobPageVO", jobPageVO); //페이지 네이션 전달
		model.addAttribute("jobVOList", jobVOList); //게시글 리스트 전달
		
		return "jobBoard/jobList";
	}
	
	//상세 화면, 수정 화면
	@RequestMapping({"/jobDetail", "/jobModify"})
	public void jobDetail(@RequestParam("bno") int bno, Model model) {

		//System.out.println(bno);
		//System.outprintln(jobBoardDetailVO.toString());
		JobBoardDetailVO jobBoardDetailVO = jobBoardService.getDetail(bno);
		model.addAttribute("jobBoardDetailVO", jobBoardDetailVO);	
	}

	//--------------------------------화면 처리-------------------------------
	
	//--------------------------------기능 처리-------------------------------
	
	//등록요청
	@RequestMapping("/registRequest")
	public String registRequest(JobBoardDetailVO jobBoardDetailVO,
							 RedirectAttributes RA) {
		
		int result = jobBoardService.regist(jobBoardDetailVO);
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "등록 처리 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "등록에 실패했습니다. 다시 시도하세요");
		}
		
		
		return "redirect:/jobBoard/jobList"; //다시컨트롤러를 태움
	}
	
	//업데이트 처리
	@RequestMapping("/jobUpdate")
	public String jobUpdate(JobBoardDetailVO jobBoardDetailVO,
							 RedirectAttributes RA) {
		
		int result = jobBoardService.update(jobBoardDetailVO);
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "수정을 완료했습니다.");
		} else {
			RA.addFlashAttribute("msg", "수정에 실패했습니다.");
		}
		
		
		return "redirect:/jobBoard/jobList";
	}
	
	//--------------------------------기능 처리-------------------------------
}