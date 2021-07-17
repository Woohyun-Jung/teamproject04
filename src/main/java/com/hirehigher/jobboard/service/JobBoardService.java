package com.hirehigher.jobboard.service;

import java.util.ArrayList;

import com.hirehigher.command.JobBoardVO;
import com.hirehigher.util.JobCriteria;

public interface JobBoardService {
		//public int regist(JobBoardVO jvo); //등록
		//public int update(jobBoardVO jvo); //수정
		
		public int getTotal(JobCriteria cri); //총 게시글 수
		public ArrayList<JobBoardVO> getList(JobCriteria cri); //조회
		
		//public JobBoardVO getDetail(int bno); //상세
		//public int delete(int bno); //삭제
}
