package vo;

public class STCommentVO {

	private int seq;
	private int root;
	private String id;
	private String nickname;
	private String regdate;
	private String recontent;
	private String sports;
	private String profile;
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
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
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	
	@Override
	public String toString() {
		return "STCommentVO [seq=" + seq + ", root=" + root + ", id=" + id + ", nickname=" + nickname + ", regdate="
				+ regdate + ", recontent=" + recontent + ", sports=" + sports + ", profile=" + profile + "]";
	}
	
	
}
