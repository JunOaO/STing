package STservice;

import java.util.List;

import cri.Criteria;
import cri.SearchCriteria;
import vo.STBoardVO;

public interface STBservice {

	List<STBoardVO> searchList(SearchCriteria cri);
	
	int searchRowCount(SearchCriteria cri);

	STBoardVO fbdetail(STBoardVO vo);

	int baseballInsert(STBoardVO vo);

	STBoardVO baseballSelectOne(STBoardVO vo);

	List<STBoardVO> baseballSelectList(Criteria cri);

	/************************** 최신글 새로 고침 start **************************/
	List<STBoardVO> baseballSelectList();
	List<STBoardVO> footballSelectList();
	List<STBoardVO> basketballSelectList();
	List<STBoardVO> tennisSelectList();
	List<STBoardVO> bicycleSelectList();
	/************************** 최신글 새로 고침 end **************************/

	int boardRowCount(SearchCriteria cri);

}