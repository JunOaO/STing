package vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class STMemberVO {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String birthd;
	private String gender;
	private int matching;
	private int partyplay;
	private String profile;

	private MultipartFile uploadfilef;
	// form 으로부터 uploadfile 정보를 읽어오기 위한 필드,member table에 추가 안함
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthd() {
		return birthd;
	}

	public void setBirthd(String birthd) {
		this.birthd = birthd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getMatching() {
		return matching;
	}

	public void setMatching(int matching) {
		this.matching = matching;
	}

	public int getPartyplay() {
		return partyplay;
	}

	public void setPartyplay(int partyplay) {
		this.partyplay = partyplay;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public MultipartFile getUploadfilef() {
		return uploadfilef;
	}

	public void setUploadfilef(MultipartFile uploadfilef) {
		this.uploadfilef = uploadfilef;
	}

	@Override
	public String toString() {
		return "STMemberVO [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", email=" + email + ", birthd=" + birthd + ", gender=" + gender + ", matching=" + matching
				+ ", partyplay=" + partyplay + ", profile=" + profile + ", uploadfilef=" + uploadfilef + "]";
	}
}