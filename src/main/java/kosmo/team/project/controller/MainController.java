package kosmo.team.project.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.CustomerServiceDetailDTO;
import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.dto.MainSearchDTO;
import kosmo.team.project.service.MainService;
import kosmo.team.project.utility.Page;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;

	@RequestMapping(value = "/main/mainForm.do")
	public ModelAndView mainForm(MainDTO mainDTO, MainSearchDTO mainSearchDTO) {

	    ModelAndView mav = new ModelAndView();

	    // 갤러리 section
	    int imageBoardListCnt = this.mainService.getImageBoardListCnt(mainDTO);
	    List<MainDTO> imageBoardList = this.mainService.getImageBoardList(mainDTO);
	    mav.addObject("imageBoardList", imageBoardList);

	    // 대회 일정 section
	    List<MainDTO> mainTournamentList = this.mainService.getMainTournamentList(mainDTO);
	    mav.addObject("mainTournamentList", mainTournamentList);

	    mav.setViewName("/main/mainForm.jsp");

	    return mav;
	}


	@RequestMapping(value = "/main/loginForm.do")
	public ModelAndView loginForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/loginForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/main/customerServiceForm.do")
	public ModelAndView customerServiceForm(MainDTO mainDTO, MainSearchDTO mainSearchDTO) {

		int customerServiceQnABoardListAllCnt = this.mainService.getCustomerServiceQnABoardListAllCnt();
		
		int customerServiceQnABoardListCnt = this.mainService.getCustomerServiceQnABoardListCnt(mainSearchDTO);
		
		ModelAndView mav = new ModelAndView();
		
		// FAQ 페이지
		
		List<MainDTO> customerServiceList = this.mainService.getCustomerServiceList(mainDTO);
		
		mav.addObject("customerServiceList", customerServiceList);
		
		List<MainDTO> customerServiceCategoryList = this.mainService.getCustomerServiceCategoryList(mainDTO);
		
		mav.addObject("customerServiceCategoryList", customerServiceCategoryList);
		
		// QnA 페이지
		Map<String, Integer> customerServiceQnABoardMap = Page.getPagingMap(
				mainSearchDTO.getSelectPageNo(),
				mainSearchDTO.getRowCntPerPage(),
				customerServiceQnABoardListCnt
		);
		
		mainSearchDTO.setSelectPageNo((int) customerServiceQnABoardMap.get("selectPageNo"));
		mainSearchDTO.setRowCntPerPage((int) customerServiceQnABoardMap.get("rowCntPerPage"));
		mainSearchDTO.setBegin_rowNo((int) customerServiceQnABoardMap.get("begin_rowNo"));
		mainSearchDTO.setEnd_rowNo((int) customerServiceQnABoardMap.get("end_rowNo"));
		
		List<MainDTO> customerServiceQnABoardList = this.mainService.getCustomerServiceQnABoardList(mainSearchDTO);
		
		mav.addObject("customerServiceQnABoardList", customerServiceQnABoardList);
		
		mav.addObject("customerServiceQnABoardListCnt", customerServiceQnABoardListCnt);
		
		mav.addObject("customerServiceQnABoardListAllCnt", customerServiceQnABoardListAllCnt);
		
		mav.addObject("customerServiceQnABoardMap", customerServiceQnABoardMap);
		
		mav.setViewName("/main/customerServiceForm.jsp");

		return mav;
	}

	// QnA 글쓰기 페이지
	
	@RequestMapping(value = "/main/newCustomerServiceQnAForm.do")
    public ModelAndView newCustomerServiceQnAForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("/main/newCustomerServiceQnAForm.jsp");
    	
        return mav;
    }
	
	// QnA Detail 페이지
	
	@RequestMapping(value = "/main/customerServiceQnADetailForm.do")
	public ModelAndView customerServiceQnADetail(@RequestParam(value="b_no") int b_no) {
		
		CustomerServiceDetailDTO customerServiceDetailDTO = this.mainService.getCustomerServiceDetail(b_no);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("customerServiceDetailDTO", customerServiceDetailDTO);
		
		mav.setViewName("/main/customerServiceQnADetailForm.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/QnABoardRegProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String,String> boardRegProc(MainDTO mainDTO) {
	
		Map<String,String> resultMap = new HashMap<String,String>();
		
		int QnABoardRegCnt = this.mainService.insertQnABoard(mainDTO);
		
		if(mainDTO.getWriter() == null) {
			System.out.println(1);
		}
			
		resultMap.put("result", QnABoardRegCnt + "");
		
		return resultMap;
		
	}
}