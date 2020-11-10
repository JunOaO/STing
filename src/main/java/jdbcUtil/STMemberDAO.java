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
	
	public int insert(STMemberVO vo) {
		return sqlSession.insert(NS+"insert",vo);
	}
	
	public STMemberVO selectOne(STMemberVO vo) {
		return sqlSession.selectOne(NS+"selectOne",vo);
	} // selectOne

} // class
