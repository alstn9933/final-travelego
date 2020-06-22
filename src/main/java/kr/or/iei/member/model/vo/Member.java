package kr.or.iei.member.model.vo;

import lombok.Data;

@Data
public class Member {
 private String memberId;
 private String memberPw;
 private String memberNickname;
 private String memberName;
 private int age;
 private String gender;
 private String phone;
 private String email;
 private int memberLevel;
}