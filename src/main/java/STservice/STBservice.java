package STservice;

import java.util.List;

import cri.SearchCriteria;
import vo.STBoardVO;

public interface STBservice {

	List<STBoardVO> searchList(SearchCriteria cri);
	
	int searchRowCount(SearchCriteria cri);

	STBoardVO fbdetail(STBoardVO vo);

	int baseballInsert(STBoardVO vo);

	List<STBoardVO> baseBallselectList(STBoardVO vo);

	List<STBoardVO> baseBallselectList();

}