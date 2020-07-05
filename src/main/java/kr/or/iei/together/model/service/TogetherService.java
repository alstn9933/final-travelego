package kr.or.iei.together.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.together.model.dao.TogetherDao;
import kr.or.iei.together.model.vo.TogetherBoardVO;

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

	public ArrayList<TogetherBoardVO> selectBoardList() {
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
		return list;
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
	
}
