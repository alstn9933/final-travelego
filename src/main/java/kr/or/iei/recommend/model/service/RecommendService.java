package kr.or.iei.recommend.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.recommend.model.dao.RecommendDao;

@Service("recommendService")
public class RecommendService {
	@Autowired
	@Qualifier("recommendDao")
	private RecommendDao dao;

	public ArrayList<Region> selectAllRegion() {
		List list = dao.selectAllRegion();
		return (ArrayList<Region>)list;
	}
}
