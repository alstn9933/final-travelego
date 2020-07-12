package kr.or.iei.together.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class TogetherCommentListVO {
	private ArrayList<TogetherCommentVO> commentList;
	private int commentCount; 
}
