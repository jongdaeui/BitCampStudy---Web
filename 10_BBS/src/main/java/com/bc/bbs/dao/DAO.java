package com.bc.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.bbs.mybatis.DBService;
import com.bc.bbs.vo.BBSVO;
import com.bc.bbs.vo.CommentVO;

public class DAO {

	// 게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("bbs.totalCount");
		ss.close();
		return totalCount;
	}
	// 현재페이지에 해당하는 글목록(게시글) 가져오기
	public static List<BBSVO> getList(int begin, int end) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		List<BBSVO> list = ss.selectList("bbs.list", map);
		ss.close();
		return list;
		
	}
	// 게시글 하나 조회
	public static BBSVO selectOne(int b_idx)	{
		SqlSession ss = DBService.getFactory().openSession();
		BBSVO vo = ss.selectOne("bbs.one", b_idx);
		ss.close();
		return vo;
	}
	
	// ========= 댓글관련 기능 ===============
	public static List<CommentVO> getCommList(int b_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CommentVO> list = ss.selectList("bbs.commList", b_idx);
		ss.close();
		return list;
	}
}
