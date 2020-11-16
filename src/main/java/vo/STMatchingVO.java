package vo;

public class STMatchingVO{
	private int seq;
	private String leader_id;
	private String matching_id;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getLeader_id() {
		return leader_id;
	}

	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}

	public String getMatching_id() {
		return matching_id;
	}

	public void setMatching_id(String matching_id) {
		this.matching_id = matching_id;
	}

	@Override
	public String toString() {
		return "STMatchingVO [seq=" + seq + ", leader_id=" + leader_id + ", matching_id=" + matching_id + "]";
	}
}
