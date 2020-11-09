package STservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<STBoardVO> baseBallselectList(){
		return dao.baseBallselectList();
	}

	@Override
	public List<STBoardVO> baseBallselectList(STBoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}