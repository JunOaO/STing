package STservice;

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
	public STMemberVO selectOne(STMemberVO vo) {
		return dao.selectOne(vo);
	}

} // class
