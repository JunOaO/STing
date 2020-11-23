package cri;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	  private int totalRow; // Table의 전체 row 갯수
	  private int sPageNo; //view표시할 첫 pageNo
	  private int ePageNo; //view표시할 끝 pageNo 
	  private boolean prev; // 이전page블럭으로
	  private boolean next; // 다음page블럭으로
	  private int displayPageNo=3; // //view에 표시할 pageNo의 갯수
	  private int lastPageNo; // 출력 가능한 마지막 PageNo (totalRow, perPageRow 로 계산)
	  //private Criteria cri; // ver01
	  private SearchCriteria cri; //ver02
	public void setCri(SearchCriteria cri) {
			this.cri = cri;
		}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		calcData();
	}
	public void calcData() {
		ePageNo = (int)(Math.ceil(cri.getcurrPage()/(double)displayPageNo) * displayPageNo);
		sPageNo = (ePageNo-displayPageNo)+1;
		lastPageNo = (int)Math.ceil(totalRow/(double)cri.getPerPageRow());
		if(ePageNo>lastPageNo) {
			ePageNo = lastPageNo;
		}
		prev = sPageNo==1 ? false : true;
		next = ePageNo==lastPageNo ? false : true;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public int getsPageNo() {
		return sPageNo;
	}
	public int getePageNo() {
		return ePageNo;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getDisplayPageNo() {
		return displayPageNo;
	}

	public int getLastPageNo() {
		return lastPageNo;
	}

	public SearchCriteria getCri() {
		return cri;
	}

	/*ver01
	 * public String makeQuery(int currPage) { UriComponents uriComponents =
	 * UriComponentsBuilder.newInstance().queryParam("currPage", currPage)
	 * .queryParam("PerPageRow", cri.getPerPageRow()).build(); return
	 * uriComponents.toString(); }
	 */
		public String searchmakeQuery(int currPage) { 
			UriComponents uriComponents =
				  UriComponentsBuilder.newInstance()
				  .queryParam("currPage", currPage)
				  .queryParam("PerPageRow", cri.getPerPageRow())
				  .queryParam("searchType", cri.getSearchType())
				  .queryParam("keyword", cri.getKeyword())
				  .build();
		return uriComponents.toString();
	}
		public String makeQuery(int currPage) { 
			UriComponents uriComponents =
				  UriComponentsBuilder.newInstance()
				  .queryParam("currPage", currPage)
				  .queryParam("PerPageRow", cri.getPerPageRow())
				  .build();
		return uriComponents.toString();
	}
	  
}
