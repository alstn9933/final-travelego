package kr.or.iei.admin.model.vo;

import lombok.Data;

@Data
public class SearchAdmin extends AdminPage {
	private String searchType="";
	private String keyword ="";
	
	@Override
	public String toString() {
		return "SearchAdmin [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
