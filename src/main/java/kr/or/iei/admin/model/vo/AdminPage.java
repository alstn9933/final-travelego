package kr.or.iei.admin.model.vo;

import java.util.List;

import kr.or.iei.member.model.vo.Member;
import lombok.Data;

@Data
public class AdminPage {
	private List<Member>list;
	private String pageNavi;



}
