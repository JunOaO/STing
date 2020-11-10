package STservice;

import vo.STMemberVO;

public interface STMservice {

	int insert(STMemberVO vo);

	STMemberVO selectOne(STMemberVO vo);

}