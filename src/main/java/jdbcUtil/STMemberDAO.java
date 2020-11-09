package jdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.STMemberVO;
import vo.STPageVO;

// ** Mybatis CRUD 구현
// => 직접 처리 하지 않고 Mybatis에 맡김 -> Sqlsession

@Repository
public class STMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS = "com.ncs.MemberMapper.";
	
	static Connection cn = DBConnection.getConnection();
	static ResultSet rs;
	static PreparedStatement pst;
	static Statement st;
	String sql;
	
	
	public int insert(STMemberVO vo) {
		sql="insert into stmember values(?,?,?,?,?,?,?)";
		try {
			pst=cn.prepareStatement(sql);
			
			pst.setString(1, vo.getId());
			pst.setString(2, vo.getPassword());
			pst.setString(3, vo.getName());
			pst.setString(4, vo.getNickname());
			pst.setString(5, vo.getEmail());
			pst.setString(6, vo.getBirthd());
			pst.setString(7, vo.getGender());
			
			return pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert Exception =>"+e.toString());
		}
		return 0;
	}
	
	public STMemberVO selectOne(STMemberVO vo) {
		sql = "select * from stmember where id=?";
		// Statement 비교
		// => "select * from member where id='"+vo.getId()+"'"
		try {
			pst = cn.prepareStatement(sql);
			pst.setString(1, vo.getId());
			// select * from member where id='banana' ;
			rs = pst.executeQuery();
			if (rs.next()) {
				vo.setId(rs.getString(1));
				vo.setPassword(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNickname(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setBirthd(rs.getString(6));
				vo.setGender(rs.getString(7));
				vo.setMatching(rs.getString(8));
				vo.setPartyplay(rs.getString(9));
				vo.setProfile(rs.getString(10));
			} else {
				vo = null;
			}
		} catch (Exception e) {
			System.out.println("** selectOne Exception=>" + e.toString());
			vo = null;
		}
		return vo;
	} // selectOne

} // class
