package kr.or.iei.together.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.together.model.dao.TogetherDao;
import kr.or.iei.together.model.vo.MainPageDTO;
import kr.or.iei.together.model.vo.TogetherBoardVO;
import kr.or.iei.together.model.vo.TogetherCommentListVO;
import kr.or.iei.together.model.vo.TogetherCommentVO;

@Service("togetherService")
public class TogetherService {
	
	@Autowired
	@Qualifier("togetherDao")
	TogetherDao dao;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy. MM. dd.");

	public ArrayList<Region> selectRegionByKeyword(String keyword) {
		return (ArrayList<Region>)dao.selectRegionByKeyword(keyword);
	}

	public int insertBoard(TogetherBoardVO board) {
		return dao.insertBoard(board);
	}

	public MainPageDTO selectBoardList() {
		int totalCount = dao.selectTotalCount();
		int start = totalCount - 10;
		int end = totalCount;		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<TogetherBoardVO> list =(ArrayList<TogetherBoardVO>)dao.selectBoardList(map); 
		
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherBoardVO vo : list) {
			if(vo.getTogetherDate().equals(today)) {
				vo.setTogetherDate(vo.getWriteTime());
			}
		}
		
		ArrayList<Region> regionList = (ArrayList<Region>)dao.selectRegionList();
		MainPageDTO mpd = new MainPageDTO();
		mpd.setBoardList(list);
		mpd.setRegionList(regionList);
		return mpd;
	}

	public ArrayList<TogetherBoardVO> selectBoardList(int lastNum) {
		int start = lastNum - 11;
		int end = lastNum-1;		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<TogetherBoardVO> list =(ArrayList<TogetherBoardVO>)dao.selectBoardList(map); 
		
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherBoardVO vo : list) {
			if(vo.getTogetherDate().equals(today)) {
				vo.setTogetherDate(vo.getWriteTime());
			}
		}		
		return list;
	}

	public TogetherBoardVO selectOneBoard(int togetherNo) {		
		return dao.selectOneBoard(togetherNo);
	}

	public int insertComment(TogetherCommentVO comment) {		
		return dao.insertComment(comment);
	}

	public TogetherCommentListVO selectCommentList(int boardNo) {
		
		TogetherCommentListVO listVo = new TogetherCommentListVO();
		
		ArrayList<TogetherCommentVO> list =(ArrayList<TogetherCommentVO>)dao.selectCommentList(boardNo);
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherCommentVO vo : list) {
			if(vo.getCommentDate().equals(today)) {
				vo.setCommentDate(vo.getCommentTime());
			}
		}
		
		listVo.setCommentList(list);
		listVo.setCommentCount(dao.selectCommentCount(boardNo));
		return listVo;
	}

	public int modifyBoard(TogetherBoardVO vo) {		
		return dao.modifyBoard(vo);
	}

	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}

	public ArrayList<TogetherBoardVO> selectBoardListByRegion(int regionNo) {
		int totalCount = dao.selectTotalCountByRegion(regionNo);
		int start = totalCount - 10;
		int end = totalCount;		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("regionNo", regionNo);
		
		ArrayList<TogetherBoardVO> list =(ArrayList<TogetherBoardVO>)dao.selectBoardListByRegion(map); 
		
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherBoardVO vo : list) {
			if(vo.getTogetherDate().equals(today)) {
				vo.setTogetherDate(vo.getWriteTime());
			}
		}
		
		return list;
	}

	public ArrayList<TogetherBoardVO> selectBoardListByRegion(int regionNo, int lastNum) {
		int start = lastNum - 11;
		int end = lastNum -1;		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("regionNo", regionNo);
		
		ArrayList<TogetherBoardVO> list =(ArrayList<TogetherBoardVO>)dao.selectBoardListByRegion(map); 
		
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherBoardVO vo : list) {
			if(vo.getTogetherDate().equals(today)) {
				vo.setTogetherDate(vo.getWriteTime());
			}
		}
		
		return list;
	}

	public ArrayList<TogetherBoardVO> selectBoardListByKeyword(String keyword) {
		int totalCount = dao.selectTotalCountByKeyword(keyword);
		int start = totalCount - 10;
		int end = totalCount;		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("keyword", keyword);
		
		ArrayList<TogetherBoardVO> list =(ArrayList<TogetherBoardVO>)dao.selectBoardListByKeyword(map); 
		
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherBoardVO vo : list) {
			if(vo.getTogetherDate().equals(today)) {
				vo.setTogetherDate(vo.getWriteTime());
			}
		}
		if(!list.isEmpty()) {
			list.get(list.size()-1).setKeyword(keyword);			
		}
		
		return list;
	}

	public ArrayList<TogetherBoardVO> selectBoardListByKeyword(int lastNum, String keyword) {
		int start = lastNum - 11;
		int end = lastNum -1;		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("keyword", keyword);
		
		ArrayList<TogetherBoardVO> list =(ArrayList<TogetherBoardVO>)dao.selectBoardListByKeyword(map); 
		
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherBoardVO vo : list) {
			if(vo.getTogetherDate().equals(today)) {
				vo.setTogetherDate(vo.getWriteTime());
			}
		}
		if(!list.isEmpty()) {
			list.get(list.size()-1).setKeyword(keyword);			
		}
		
		return list;
	}
	
}
