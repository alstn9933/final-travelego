package kr.or.iei.together.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("togetherDao")
public class TogetherDao {
	
	@Autowired
	SqlSessionTemplate session;

}
