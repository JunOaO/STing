package vo;

public class STMatchingVO {
	private int seq;
	private String leaderid;
	private String matchingid;
	private int seq_step;

	public int getSeq_step() {
		return seq_step;
	}

	public void setSeq_step(int seq_step) {
		this.seq_step = seq_step;
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
		return "STMatchingVO [seq=" + seq + ", leaderid=" + leaderid + ", matchingid=" + matchingid + ", seq_step="
				+ seq_step + "]";
	}

}
