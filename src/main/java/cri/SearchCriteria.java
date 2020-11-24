package cri;

//DTO, VO 에서는 상속을 많이 활용함.  
public class SearchCriteria extends Criteria {

	private String searchType = "";
	private String keyword = "";
	private String sports;
	private int seq;
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getSports() {
		return sports;
	}

	public void setSports(String sports) {
		this.sports = sports;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", sports=" + sports + ", seq="
				+ seq + "]";
	}

} // class
