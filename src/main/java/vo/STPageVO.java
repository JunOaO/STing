package vo;

import java.util.List;

public class STPageVO {
	private List<STBoardVO> list; // 목록리스트 저장
	private List<STMemberVO> mlist; // 멤버리스트 저장
	private int sno; 			// startRno
	private int eno; 			// endRno
	private int totalCount; 	// 전체 레코드갯수
	private int currPage; 		// 현재 페이지번호
	private int perPage = 5; 	// 페이지당 보여줄 갯수
	private int perPageNo = 3;
			// 한 화면에 출력되는 PageNo 갯수
			// => paging2 에서 사용

	public List<STBoardVO> getList() {
		return list;
	}
	public List<STMemberVO> getMlist() {
		return mlist;
	}
	public void setMlist(List<STMemberVO> mlist) {
		this.mlist = mlist;
	}
	public void setList(List<STBoardVO> list) {
		this.list = list;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getPerPageNo() {
		return perPageNo;
	}
	public void setPerPageNo(int perPageNo) {
		this.perPageNo = perPageNo;
	}
	
	@Override
	public String toString() {
		return "PageVO [list=" + list + ", mlist=" + mlist + ", sno=" + sno + ", eno=" + eno + ", totalCount="
				+ totalCount + ", currPage=" + currPage + ", perPage=" + perPage + ", perPageNo=" + perPageNo + "]";
	}
} // class
