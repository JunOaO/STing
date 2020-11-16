package STservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jdbcUtil.STMemberDAO;
import vo.STMemberVO;

//@Component
@Service
public class STMServiceImpl implements STMservice {
	
	@Autowired
	STMemberDAO dao;
	
	@Override
	public int insert(STMemberVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public List<STMemberVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public STMemberVO selectOne(STMemberVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int delete(STMemberVO vo) {
		return dao.delete(vo);
	}


} // class
