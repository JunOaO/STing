package cri;

public class Criteria {

	private int currPage;  //출력할 PageNo
	private int perPageRow; // 1페이지당 보여줄 Row(Record, 튜플) 갯수
	private int sno; //startRowNum
	private int eno; //endRowNum
	// 생성자
	public Criteria() {
		this.currPage = 1;
		this.perPageRow = 10;
	}

	public void setCurrPage(int currPage) {
		if(currPage>1) {
			this.currPage = currPage;			
		}else {
			this.currPage = 1;
		}
	}
	public void setPerPageRow(int perPageRow) {
		if(perPageRow<1 || perPageRow>50) {
			this.perPageRow = 10;
		}else {
			this.perPageRow = perPageRow;			
		}
	}
	public void setSnoEno() {
		if (sno<1) {
			sno = 1;
		}
		sno =(currPage-1)* perPageRow +1;
		eno =sno+perPageRow-1;
	}
	public int getcurrPage() {
		return currPage;
	}
	public int getPerPageRow() {
		return perPageRow;
	}
	public int getSno() {
		return sno;
	}
	public int getEno() {
		return eno;
	}
	@Override
	public String toString() {
		return "Criteria [currPage=" + currPage + ", perPageRow=" + perPageRow + ", sno=" + sno + ", eno=" + eno + "]";
	}
	
}
