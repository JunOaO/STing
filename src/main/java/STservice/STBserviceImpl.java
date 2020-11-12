package STservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cri.Criteria;
import cri.SearchCriteria;
import jdbcUtil.STBoardDAO;
import vo.STBoardVO;
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
	public List<STBoardVO> searchList(SearchCriteria cri){
		return dao.searchList(cri);
	}
	
	@Override
	public STBoardVO fbdetail(STBoardVO vo) {
		return dao.fbdetail(vo);
	}
	
	@Override
	public int baseballInsert(STBoardVO vo) {  
		return dao.baseballInsert(vo);  // 처리된 row 갯수 return	 
	} // insert
	
	@Override
	public List<STBoardVO> baseballSelectList(Criteria cri){
		return dao.baseballSelectList(cri);
	}

	@Override
	public STBoardVO baseballSelectOne(STBoardVO vo) {
		return dao.baseballSelectOne(vo);
	}

	@Override
	public int boardRowCount(SearchCriteria cri) {
		return dao.boardRowCount(cri);
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
}
