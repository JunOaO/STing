package jdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.STBoardVO;
import vo.STMatchingVO;
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
	
	public List<STMemberVO> selectList() {
		return sqlSession.selectList(NS+"selectList");
	}
	
	public STMemberVO selectOne(STMemberVO vo) {
		return sqlSession.selectOne(NS+"selectOne",vo);
	} // selectOne
	
	public int delete(STMemberVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	}
	
	public int profileUpdate(STMemberVO vo) {
		return sqlSession.update(NS+"profileUpdate",vo);
	}
	public int profileReple(STMemberVO vo) {
		return sqlSession.update(NS+"profileReple",vo);
	}
	
	public STBoardVO matchingTitle(STBoardVO bvo) {
		return sqlSession.selectOne(NS+"matchingTitle",bvo);
	}

	public int update(STMemberVO vo) {
		return sqlSession.update(NS+"update",vo);
	}
	public STBoardVO selectInfo(STBoardVO vo) {
		return sqlSession.selectOne(NS+"selectInfo",vo);
	}

} // class
