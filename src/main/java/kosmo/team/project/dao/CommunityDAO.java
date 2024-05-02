package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.CommunitySearchDTO;

@Mapper
public interface CommunityDAO {
	// ----------------------------------------
	// 공지사항
	// ----------------------------------------
	public List<CommunityDTO> getNoticeBoardList(CommunitySearchDTO communitySearchDTO);

	public int getNoticeBoardListCnt(CommunitySearchDTO communitySearchDTO);

	public int getNoticeBoardAllCnt();

	CommunityDTO getNoticeBoard(int b_no);

	int updateNoticeBoardReadCount(int b_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteNoticeBoard(CommunityDTO communityDTO);

	int getNoticeBoardCnt(int b_no);
	

	

	//----------------------------------------
	// 자유게시판
	//----------------------------------------

	public List<CommunityDTO> getFreeBoardList(CommunitySearchDTO communitySearchDTO);

	public int getFreeBoardListCnt(CommunitySearchDTO communitySearchDTO);

	public int getFreeBoardAllCnt();

	CommunityDTO getFreeBoard(int b_no);
	
	public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO);
	
	public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO);
	
	public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO);
	
	public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO);
	
	public int updateFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
	
	public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
	
	public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO);
	
	
	
	
	
	
	
	//갤러리
	public int getImageBoardListCnt(CommunityDTO communityDTO);

	public List<CommunityDTO> getImageBoardList(CommunityDTO communityDTO);
}
