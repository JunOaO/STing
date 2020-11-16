package STservice;

import java.util.List;

import vo.STMemberVO;

public interface STMservice {

	int insert(STMemberVO vo);

	STMemberVO selectOne(STMemberVO vo);
	
	int delete(STMemberVO vo);
	
	List<STMemberVO> selectList();

	
	

}