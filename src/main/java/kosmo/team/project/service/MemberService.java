package kosmo.team.project.service;

import java.util.List;
import java.util.Map;


import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.TeamDTO;
import kosmo.team.project.dto.bookingDTO;

public interface MemberService {

	int insertMember(MemberDTO memberDTO);
	
	int getmid(Map<String,String> mid);
	
	MemberDTO updateMem(String mid);
	
	//마이페이지에 있는 내 정보 가져오기
    MemberDTO getMyInfo(int m_no);
    //마이페이지에 있는 내 기록 가져오기
    MemberDTO getMyStat(String mid);
    
    int updateMem(MemberDTO memberDTO);
    
    List<bookingDTO> getBookedStadium(int m_no);
    //팀 생성
    int registTeam(TeamDTO teamDTO);
}
