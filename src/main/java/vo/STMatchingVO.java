package vo;

public class STMatchingVO {
	private int seq;
	private String leaderid;
	private String matchingid;
	private String sports;
	
	public String getSports() {
		return sports;
	}

	public void setSports(String sports) {
		this.sports = sports;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getLeaderid() {
		return leaderid;
	}

	public void setLeaderid(String leaderid) {
		this.leaderid = leaderid;
	}

	public String getMatchingid() {
		return matchingid;
	}

	public void setMatchingid(String matchingid) {
		this.matchingid = matchingid;
	}

	@Override
	public String toString() {
		return "STMatchingVO [seq=" + seq + ", leaderid=" + leaderid + ", matchingid=" + matchingid + ", sports="
				+ sports + "]";
	}

}
