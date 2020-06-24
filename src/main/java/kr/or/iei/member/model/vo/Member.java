package kr.or.iei.member.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
 private String memberId;
 private String memberPw;
 private String memberName;
 private String memberNickname;
 private int age;
 private String email;
 private String phone;
 private String gender;
 private int memberLevel;
 private Date regDate;
}
