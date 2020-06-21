package kr.or.iei.member.model.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String member_id;
	private String member_pw;
	private String member_nickname;
	private String member_name;
	private int age;
	private char gender;
	private String phone;
	private String email;
	private int level;
	
}
