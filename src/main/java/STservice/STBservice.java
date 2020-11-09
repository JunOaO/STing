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

	List<STBoardVO> baseBallselectList(Criteria cri);

}