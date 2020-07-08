package kr.or.iei.mypage.model.vo;



import java.sql.Date;

import lombok.Data;

@Data
public class QNA {
	private int qnaNo;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private Date askDate;
	private String qnaAnswer;
	private Date answerDate;
}
