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
    //팀원 승낙테이블의 개수가 몇개인지 확인
    int getWaitingCnt(int m_no);
    
    //용병 승낙테이블의 개수가 몇개인지 확인
	int getMercWaitingCnt(int m_no);
    
    //팀원승낙 대기인원 정보가져오기
	 List<TeamDTO> getWaitingList(int m_no);
	//팀원승낙 수락 할때
	 int regTeamMem(TeamDTO teamDTO);
	//팀원승낙 거절 할때
	 int refuseTeamMem(TeamDTO teamDTO);
	 
	//마이페이지에 있는 내 정보에서 팀을 클릭하면 팀 멤버목록 출력.
	 List<TeamDTO> getTeamInfo(int m_no);
	 
	//내가 팀장일때 매칭 신청이 들어왔을때
	 int getmatchWaitingCnt(int m_no);
	 
	//매칭승낙 대기팀 정보 가져오기
	 List<TeamDTO> getMatchWaitingList(int m_no);
	 
	//매칭수락
	int matchReg(TeamDTO teamDTO);
	
	//다음 경기 일정 가져오기
	 List<TeamDTO> getTeamMatchDay(int m_no);
	
}
