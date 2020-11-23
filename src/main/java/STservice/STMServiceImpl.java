package STservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jdbcUtil.STMemberDAO;
import vo.STBoardVO;
import vo.STMatchingVO;
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
	
	@Override
	public int profileUpdate(STMemberVO vo) {
		return dao.profileUpdate(vo);
	}
	@Override
	public int profileReple(STMemberVO vo) {
		return dao.profileReple(vo);
	}

	@Override
	public STBoardVO matchingTitle(STBoardVO bvo) {
		return dao.matchingTitle(bvo);
	}
	
	@Override
	public int update(STMemberVO vo) {
		return dao.update(vo);
	}


} // class
