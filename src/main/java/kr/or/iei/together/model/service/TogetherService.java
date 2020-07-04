package kr.or.iei.together.model.service;

import java.util.ArrayList;

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

	public ArrayList<Region> selectRegionByKeyword(String keyword) {
		return (ArrayList<Region>)dao.selectRegionByKeyword(keyword);
	}

	public int insertBoard(TogetherBoardVO board) {
		return dao.insertBoard(board);
	}
	
}
