package cri;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalRow; // Table의 전체 row 갯수
	private int sPageNo; // View에 표시할 첫 PageNo
	private int ePageNo; // View에 표시할 끝 PageNo
	private boolean prev; // 이전 Page블럭 으로
	private boolean next; // 다음 Page블럭 으로
	private int displayPageNo = 3; // View에 표시할 PageNo의 갯수
	private int lastPageNo;
	// 출력 가능한 마지막 PageNo (totalRow, perPageRow 로 계산)
	
	private SearchCriteria cri;

	public int getTotalRow() {
		return totalRow;
	}


	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	
	public void calcData() {
		// 2.1)
		// CurrPageNO 가 속한 출력할 PageBlock 의 ePageNo 를 계산
		// => 모든 출력할 PageBlock 의 ePageNo는 displayPageNo 의 배수임.
		// displayPageNo=3 이면 3, 6, 9, 12, ......
		// => ex) 17 page 요청 , displayPageNo=3, 일때 17이 몇번째 그룹 인지 계산하려면,
		// 17/3 -> 5 나머지 2 결론은 정수 나누기 후 나머지가 있으면 +1 이 필요함
		// -> Math.ceil(17/3) -> Math.ceil(5.73..) -> 6.0 -> 6번쨰 그룹 16,17,18
		// 즉, 17이 몇번째 그룹 인지 계산하고, 여기에 * displayPageNo 를 하면 됨.

		ePageNo = (int) (Math.ceil(cri.getCurrPage() / (double) displayPageNo) * displayPageNo);
		// Math.ceil(c) : 매개변수 c 보다 크면서 같은 가장 작은 정수를 double 형태로 반환 
		//                ceil -> 천장   ,  예) 11/3=3.666..  lastPage=4
		// => Math.ceil(12.345) => 13.0
		sPageNo = (ePageNo-displayPageNo)+1; 
		
		// 2.2) lastPageNo 와  ePageNo 확인
		// 계산된 ePageNo 가 totalRow로 계산한 전체 Page 갯수인  lastPageNo 보다 큰 경우에는 
		// lastPageNo 를  ePage 로 함.
		// => 예를 들면 lastPageNo=8 인데, ePage=9 인 경우 등등...
		lastPageNo = (int)Math.ceil( totalRow/ (double)cri.getPerPageRow());
		// => 예를 들면  totalRow 21개, PerPageRow=5 , lastPageNo=5
		if (ePageNo>lastPageNo)  ePageNo=lastPageNo;
		
		// 2.3) prev, next
		prev = sPageNo==1 ? false : true;
		next = ePageNo==lastPageNo ? false : true;
		
	} // calcData()


	public int getsPageNo() {
		return sPageNo;
	}


	public void setsPageNo(int sPageNo) {
		this.sPageNo = sPageNo;
	}


	public int getePageNo() {
		return ePageNo;
	}


	public void setePageNo(int ePageNo) {
		this.ePageNo = ePageNo;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getDisplayPageNo() {
		return displayPageNo;
	}


	public void setDisplayPageNo(int displayPageNo) {
		this.displayPageNo = displayPageNo;
	}


	public int getLastPageNo() {
		return lastPageNo;
	}


	public void setLastPageNo(int lastPageNo) {
		this.lastPageNo = lastPageNo;
	}


	public SearchCriteria getCri() {
		return cri;
	}


	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}
	
	public String makeQuery(int currPage) {
		
		// ver02 : 요청 uri 에 search 기능 추가
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("currPage", currPage)
				.queryParam("perPageRow", cri.getPerPageRow())
				.build();
		return uriComponents.toString();
	} // makeQuery

	// searchQuery
	public String searchQuery(int currPage) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("currPage", currPage)
				.queryParam("perPageRow",cri.getPerPageRow())
				.queryParam("searchType",cri.getSearchType())
				.queryParam("keyword", cri.getKeyword())
				.build();
		return uriComponents.toString();
	}// searchQuery


	@Override
	public String toString() {
		return "PageMaker [totalRow=" + totalRow + ", sPageNo=" + sPageNo + ", ePageNo=" + ePageNo + ", prev=" + prev
				+ ", next=" + next + ", displayPageNo=" + displayPageNo + ", lastPageNo=" + lastPageNo + ", cri=" + cri
				+ "]";
	}
}
