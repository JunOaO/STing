package jdbcUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cri.Criteria;
import cri.SearchCriteria;
import vo.STBoardVO;
import vo.STCommentVO;
import vo.STMatchingVO;
import vo.STMemberVO;
import vo.STPageVO;

// ** Board Table 의 CRUD 구현
// => selectList, selectOne, insert,update, delete

@Repository
public class STBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	private static final String NS = "com.ncs.BoardMapper.";

	// ** searchList
	public int searchRowCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS + "searchRowCount", cri);
	}

	public List<STBoardVO> searchList(SearchCriteria cri) {
		return sqlSession.selectList(NS + "searchList", cri);
	}

	public STBoardVO fbdetail(STBoardVO vo) {
		return sqlSession.selectOne(NS + "fbdetail", vo);
	}

	public int baseballInsert(STBoardVO vo) {
		return sqlSession.update(NS + "baseballInsert", vo);
	}

	public int footballInsert(STBoardVO vo) {
		return sqlSession.update(NS + "footballInsert", vo);
	}

	/******************* 모집글 횟수 start *******************/
	public int boardLeaderUpdate(STBoardVO vo) {
		return sqlSession.update(NS + "boardLeaderUpdate", vo);
	}

	/******************* 모집글 횟수 end *******************/

	/******************* 게시판 출력 start *******************/
	public List<STBoardVO> baseballSelectList(Criteria cri) {
		return sqlSession.selectList(NS + "baseballSelectList", cri);
	}

	public List<STBoardVO> footballSelectList(Criteria cri) {
		return sqlSession.selectList(NS + "footballSelectList", cri);
	}

	public List<STBoardVO> basketballSelectList(Criteria cri) {
		return sqlSession.selectList(NS + "basketballSelectList", cri);
	}

	/******************* 게시판 출력 start *******************/

	/************************** 최신글 새로 고침 start ******************************/

	public List<STBoardVO> baseballSelectList() {
		return sqlSession.selectList(NS + "baseballSelectList");
	}

	public List<STBoardVO> footballSelectList() {
		return sqlSession.selectList(NS + "footballSelectList");
	}

	public List<STBoardVO> basketballSelectList() {
		return sqlSession.selectList(NS + "basketballSelectList");
	}

	public List<STBoardVO> tennisSelectList() {
		return sqlSession.selectList(NS + "tennisSelectList");
	}

	public List<STBoardVO> bicycleSelectList() {
		return sqlSession.selectList(NS + "bicycleSelectList");
	}

	/************************** 최신글 새로 고침 end ******************************/

	public STBoardVO boardSelectOne(STBoardVO vo) {
		return (STBoardVO) sqlSession.selectOne(NS + "boardSelectOne", vo);
	}

	public int boardRowCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS + "boardRowCount", cri);
	}

	/************************** board 수정 & 삭제 start ******************************/
	public int baseballUpdate(STBoardVO vo) {
		return sqlSession.update(NS + "baseballUpdate", vo);
	}

	public int baseballDelete(STBoardVO vo) {
		return sqlSession.delete(NS + "baseballDelete", vo);
	}

	public int footballUpdate(STBoardVO vo) {
		return sqlSession.update(NS + "footballUpdate", vo);
	}

	public int footballDelete(STBoardVO vo) {
		return sqlSession.delete(NS + "footballDelete", vo);
	}

	/************************** board 수정 & 삭제 end ******************************/

	/************************** board 매칭 start ******************************/
	public int matchingInsert(STMatchingVO mvo) {
		return sqlSession.insert(NS + "matchingInsert", mvo);
	}

	public List<STMatchingVO> matchingSelect(STMatchingVO mvo) {
		return sqlSession.selectList(NS + "matchingSelect", mvo);
	}

	public List<STMatchingVO> idcheckSelect(STMatchingVO mvo) {
		return sqlSession.selectList(NS + "idcheckSelect", mvo);
	}

	public STMatchingVO idcheckSelect2(STMatchingVO mvo) {
		return sqlSession.selectOne(NS + "idcheckSelect2", mvo);
	}

	public int matchingUpdate(STMemberVO memvo) {
		return sqlSession.update(NS + "matchingUpdate", memvo);
	}

	public int memberpartyplay(STMatchingVO mvo) {
		return sqlSession.update(NS + "memberpartyplay", mvo);
	}

	public int partyplayD(STMatchingVO mvo) {
		return sqlSession.update(NS + "partyplayD", mvo);
	}

	/************************** board 매칭 end ******************************/

	/************************** 댓글 입력 & 삭제 start ******************************/
	public List<STCommentVO> clist(STBoardVO vo) {
		return sqlSession.selectList(NS + "clist", vo);
	}
	public String clistID(STBoardVO vo) {
		return sqlSession.selectOne(NS + "clistID", vo);
	}

	public int commentInsert(STCommentVO cvo) {
		return sqlSession.insert(NS + "commentInsert", cvo);
	}

	public int commentDelete(STCommentVO cvo) {
		return sqlSession.delete(NS + "commentDelete", cvo);
	}

	/************************** 댓글 입력 & 삭제 end ******************************/
	public STMemberVO profileSelect(STMemberVO memvo) {
		return sqlSession.selectOne(NS + "profileSelect", memvo);
	}
	public STBoardVO profileSelect2(STBoardVO vo) {
		return sqlSession.selectOne(NS + "profileSelect2", vo);
	}

	// ** totalRowCount
	public int totalRowCount() {
		return sqlSession.selectOne(NS + "totalRowCount");
	} // totalRowCount
	
	public STMemberVO pfofileSelectOne(STMemberVO memvo) {
		   return sqlSession.selectOne(NS+"profileSelectOne",memvo);
	   }

}// class
