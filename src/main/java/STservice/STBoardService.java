package STservice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cri.SearchCriteria;
import jdbcUtil.STBoardDAO;
import vo.STBoardVO;

//** Board Table 의 CRUD 구현
//=> selectList, selectOne, insert,update, delete
/*
@Service
public class STBoardService {
	
	@Autowired
	STBoardDAO dao;
	
	public ArrayList<STBoardVO> fmainList(){
		return dao.fmainList(); 
	}
	
	public ArrayList<STBoardVO> searchList(STBoardVO stvo){
		return dao.searchList(stvo);
	}
	
}// class
*/
