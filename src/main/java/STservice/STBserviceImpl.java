package STservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cri.Criteria;
import cri.SearchCriteria;
import jdbcUtil.STBoardDAO;
import vo.STBoardVO;
import vo.STCommentVO;
import vo.STMatchingVO;
import vo.STMemberVO;
@Service
public class STBserviceImpl implements STBservice{
	
	@Autowired
	STBoardDAO dao;

	// ** SearchCriteria List
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return dao.searchRowCount(cri);
	}
	@Override
	public int repleRowCount(SearchCriteria cri) {
		return dao.repleRowCount(cri);
	}

	@Override
	public List<STBoardVO> searchList(SearchCriteria cri){
		return dao.searchList(cri);
	}
	@Override
	public List<STCommentVO> repleList(SearchCriteria cri){
		return dao.repleList(cri);
	}

	@Override
	public int baseballInsert(STBoardVO vo) {  
		return dao.baseballInsert(vo);  // 처리된 row 갯수 return	 
	} // insert
	@Override
	public int footballInsert(STBoardVO vo) {  
		return dao.footballInsert(vo);  // 처리된 row 갯수 return	 
	} // insert
	@Override
	public int basketballInsert(STBoardVO vo) {  
		return dao.basketballInsert(vo);  // 처리된 row 갯수 return	 
	} // insert
	@Override
	public int tennisInsert(STBoardVO vo) {  
		return dao.tennisInsert(vo);  // 처리된 row 갯수 return	 
	} // insert
	@Override
	public int bicycleInsert(STBoardVO vo) {  
		return dao.bicycleInsert(vo);  // 처리된 row 갯수 return	 
	} // insert
	
	/******************* 모집글 횟수 start *******************/
	@Override
	public int boardLeaderUpdate(STBoardVO vo) {  
		return dao.boardLeaderUpdate(vo);  // 처리된 row 갯수 return	 
	} // boardLeaderUpdate
	/******************* 모집글 횟수 end *******************/
	
	//********************* 게시판 출력 start *********************
	@Override
	public List<STBoardVO> baseballSelectList(Criteria cri){
		return dao.baseballSelectList(cri);
	}
	@Override
	public List<STBoardVO> footballSelectList(Criteria cri){
		return dao.footballSelectList(cri);
	}
	@Override
	public List<STBoardVO> basketballSelectList(Criteria cri){
		return dao.basketballSelectList(cri);
	}
	@Override
	public List<STBoardVO> tennisSelectList(Criteria cri){
		return dao.tennisSelectList(cri);
	}
	@Override
	public List<STBoardVO> bicycleSelectList(Criteria cri){
		return dao.bicycleSelectList(cri);
	}
	
	//********************* 게시판 출력 end *********************

	@Override
	public STBoardVO boardSelectOne(STBoardVO vo) {
		return dao.boardSelectOne(vo);
	}

	/************************** 최신글 새로 고침 start ******************************/
	@Override
	public List<STBoardVO> baseballSelectList() {
		return dao.baseballSelectList();
	}
	
	@Override
	public List<STBoardVO> footballSelectList() {
		return dao.footballSelectList();
	}

	@Override
	public List<STBoardVO> basketballSelectList() {
		return dao.basketballSelectList();
	}

	@Override
	public List<STBoardVO> tennisSelectList() {
		return dao.tennisSelectList();
	}

	@Override
	public List<STBoardVO> bicycleSelectList() {
		return dao.bicycleSelectList();
	}
	/************************** 최신글 새로 고침 end ******************************/

	/************************** 수정 & 삭제 start ******************************/
	@Override
	public int baseballUpdate(STBoardVO vo) {  
		return dao.baseballUpdate(vo);  	 
	} // baseballUpdate
	
	@Override
	public int baseballDelete(STBoardVO vo) {  
		return dao.baseballDelete(vo);  	 
	} // baseballDelete
	
	@Override
	public int footballUpdate(STBoardVO vo) {  
		return dao.footballUpdate(vo);  	 
	} // footballUpdate
	
	@Override
	public int footballDelete(STBoardVO vo) {  
		return dao.footballDelete(vo);  	 
	} // footballUpdate
	@Override
	public int basketballUpdate(STBoardVO vo) {  
		return dao.basketballUpdate(vo);  	 
	} // footballUpdate
	
	@Override
	public int basketballDelete(STBoardVO vo) {  
		return dao.basketballUpdate(vo);  	 
	} // footballUpdate
	@Override
	public int tennisUpdate(STBoardVO vo) {  
		return dao.tennisUpdate(vo);  	 
	} // footballUpdate
	
	@Override
	public int tennisDelete(STBoardVO vo) {  
		return dao.tennisDelete(vo);  	 
	} // footballUpdate
	@Override
	public int bicycleUpdate(STBoardVO vo) {  
		return dao.bicycleUpdate(vo);  	 
	} // footballUpdate
	
	@Override
	public int bicycleDelete(STBoardVO vo) {  
		return dao.bicycleDelete(vo);  	 
	} // footballUpdate
	/************************** 수정 & 삭제 end ******************************/

	/************************** board 매칭 start ******************************/
	@Override
	public int matchingInsert(STMatchingVO mvo) {
		return dao.matchingInsert(mvo);
	}
	
	@Override
	public List<STMatchingVO> matchingSelect(STMatchingVO mvo) {
		return dao.matchingSelect(mvo);
	}
	
	@Override
	public STMatchingVO idcheckSelect2(STMatchingVO mvo) {
		return dao.idcheckSelect2(mvo);
	}
	
	@Override
	public int matchingUpdate(STMemberVO memvo) {
		return dao.matchingUpdate(memvo);
	}
	
	@Override
	public int memberpartyplay(STMatchingVO mvo) {
		return dao.memberpartyplay(mvo);
	}
	@Override
	public int partyplayD(STMatchingVO mvo) {
		return dao.partyplayD(mvo);
	}
	/************************** board 매칭 end ******************************/

	/************************** 댓글입력 & 삭제 start ******************************/
	@Override
	public List<STCommentVO> clist(STBoardVO vo) {
		return dao.clist(vo);
	}
	@Override
	public String clistID(STBoardVO vo) {
		return dao.clistID(vo);
	}

	@Override
	public int commentInsert(STCommentVO cvo) {
		return dao.commentInsert(cvo);
	}

	@Override
	public int commentDelete(STCommentVO cvo) {
		return dao.commentDelete(cvo);
	}

	/************************** 댓글 입력 & 삭제 end ******************************/
	
	@Override
	public STMemberVO profileSelect(STMemberVO memvo) {
		return dao.profileSelect(memvo);
	}
	@Override
	public STBoardVO profileSelect2(STBoardVO vo) {
		return dao.profileSelect2(vo);
	}
	
	@Override
	public STMemberVO profileSelectOne(STMemberVO memvo) {
		return dao.pfofileSelectOne(memvo);
	}

	@Override
	public int countUP(STBoardVO vo) {
		return dao.countUP(vo);
	}
	
}
