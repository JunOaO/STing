package STservice;

import java.util.List;

import cri.Criteria;
import cri.SearchCriteria;
import vo.STBoardVO;
import vo.STCommentVO;
import vo.STMatchingVO;
import vo.STMemberVO;

public interface STBservice{

	List<STBoardVO> searchList(SearchCriteria cri);
	List<STCommentVO> repleList(SearchCriteria cri);
	
	int searchRowCount(SearchCriteria cri);
	int repleRowCount(SearchCriteria cri);

	int baseballInsert(STBoardVO vo);
	int footballInsert(STBoardVO vo);
	int basketballInsert(STBoardVO vo);
	int tennisInsert(STBoardVO vo);
	int bicycleInsert(STBoardVO vo);

	/******************* 모집글 횟수 start *******************/
	int boardLeaderUpdate(STBoardVO vo);
	/******************* 모집글 횟수 end *******************/

	STBoardVO boardSelectOne(STBoardVO vo);

	List<STBoardVO> baseballSelectList(Criteria cri);
	List<STBoardVO> footballSelectList(Criteria cri);
	List<STBoardVO> basketballSelectList(Criteria cri);
	List<STBoardVO> tennisSelectList(Criteria cri);
	List<STBoardVO> bicycleSelectList(Criteria cri);

	/************************** 최신글 새로 고침 start **************************/
	List<STBoardVO> baseballSelectList();
	List<STBoardVO> footballSelectList();
	List<STBoardVO> basketballSelectList();
	List<STBoardVO> tennisSelectList();
	List<STBoardVO> bicycleSelectList();
	/************************** 최신글 새로 고침 end **************************/
	
	/************************** 수정 & 삭제 start **************************/
	int baseballUpdate(STBoardVO vo);
	int baseballDelete(STBoardVO vo);
	
	int footballUpdate(STBoardVO vo);
	int footballDelete(STBoardVO vo);
	
	int basketballUpdate(STBoardVO vo);
	int basketballDelete(STBoardVO vo);
	
	int tennisUpdate(STBoardVO vo);
	int tennisDelete(STBoardVO vo);
	
	int bicycleUpdate(STBoardVO vo);
	int bicycleDelete(STBoardVO vo);
	/************************** 수정 & 삭제 end **************************/
	
	/**************************  매칭 start ******************************/
	int matchingInsert(STMatchingVO mvo);
	List<STMatchingVO> matchingSelect(STMatchingVO mvo);
	STMatchingVO idcheckSelect2(STMatchingVO mvo);
	
	int matchingUpdate(STMemberVO memvo);
	
	int memberpartyplay(STMatchingVO mvo);
	int partyplayD(STMatchingVO mvo);
	/**************************  매칭 end ******************************/
	
	/************************** 댓글 입력 & 삭제 start **************************/
	  List<STCommentVO> clist(STBoardVO vo);
	  String clistID(STBoardVO vo);
	  int commentInsert(STCommentVO cvo);
	  int commentDelete(STCommentVO cvo);
	/************************** 댓글 입력 & 삭제 end **************************/
	  STMemberVO profileSelect(STMemberVO memvo);
	  STBoardVO profileSelect2(STBoardVO vo);
	  
	  STMemberVO profileSelectOne(STMemberVO memvo);
	  
	  int countUP(STBoardVO vo);


}