package kr.or.iei.together.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Region;

@Repository("togetherDao")
public class TogetherDao {
	
	@Autowired
	SqlSessionTemplate session;

	public List selectRegionByKeyword(String keyword) {
		return session.selectList("selectRegionByKeyword", keyword);
	}

}
