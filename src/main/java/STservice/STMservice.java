package STservice;

import java.util.List;

import vo.STBoardVO;
import vo.STMatchingVO;
import vo.STMemberVO;

public interface STMservice {

	int insert(STMemberVO vo);

	STMemberVO selectOne(STMemberVO vo);

	int delete(STMemberVO vo);
	
	List<STMemberVO> selectList();

	int profileUpdate(STMemberVO vo);
	int profileReple(STMemberVO vo);
	
	STBoardVO matchingTitle(STBoardVO bvo);

	int update(STMemberVO vo);

	
	

}