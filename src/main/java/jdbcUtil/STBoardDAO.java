package jdbcUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cri.SearchCriteria;
import vo.STBoardVO;
import vo.STPageVO;

// ** Board Table 의 CRUD 구현
// => selectList, selectOne, insert,update, delete

@Repository
public class STBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS ="com.ncs.BoardMapper." ;
		// ** searchList
		public int searchRowCount(SearchCriteria cri) {
			return sqlSession.selectOne(NS+ "searchRowCount",cri);
		}
	
		public List<STBoardVO> searchList(SearchCriteria cri) {
			return sqlSession.selectList(NS + "searchList", cri);
		}
		public STBoardVO fbdetail(STBoardVO vo) {
			return sqlSession.selectOne(NS+"fbdetail",vo);
		}
		
		public int baseballInsert(STBoardVO vo) {
			return sqlSession.update(NS + "baseballInsert",vo);
		}
		
		public List<STBoardVO> baseBallselectList(){
			return sqlSession.selectList(NS + "baseBallselectList");
		}
		
}// class
