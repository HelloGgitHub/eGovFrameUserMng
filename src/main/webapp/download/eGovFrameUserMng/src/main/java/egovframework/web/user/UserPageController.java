package egovframework.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller 
public class UserPageController {
	
	@RequestMapping("/") 
	public String Main(Model model) {
		return "MainPage"; 
	}
	
	@RequestMapping("/FrameDown") 
	public String Main3(Model model) {
		return "FrameDown"; 
	}

	@RequestMapping("/FrameLeft") 
	public String FrameLeft(Model model) {
		return "FrameLeft"; 
	}
	@RequestMapping("/FrameTop") 
	public String FrameTop(Model model) {
		return "FrameTop"; 
	}
	
	@RequestMapping("/Login") 
	public String Login(Model model) {
		return "Login"; 
	}

	@RequestMapping("/UserList") 
	public String welcomeA(Model model) {
		return "/usr/UserList"; 
	}
	
	@RequestMapping("/UserInfo") 
	public String UserInfo(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "userId") String userId) {
		model.addAttribute("callType", 	callType);
		model.addAttribute("userId", 		userId);
		
		return "/usr/UserInfo"; 
	}

	@RequestMapping("/UserModyStt") 
	public String UserModyStt(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "userId") String userId) {
		model.addAttribute("callType", 	callType);
		model.addAttribute("userId", 		userId);
		
		return "/usr/UserModyStt"; 
	}
	
	@RequestMapping("/GroupList") 
	public String GroupList(Model model) {
		return "/grp/GroupList"; 
	}

	@RequestMapping("/GroupInfo") 
	public String GroupInfo(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "groupId") String groupId) {

		model.addAttribute("callType", 	callType);
		model.addAttribute("groupId", 	groupId);

		return "/grp/GroupInfo"; 
	}

	@RequestMapping("/GroupUserSet") 
	public String GroupUserSet(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "userId") String userId) {
		model.addAttribute("callType", 	callType);
		model.addAttribute("userId", 		userId);
		
		return "/grp/GroupUserSet"; 
	}
	
	@RequestMapping("/UserGroupSet") 
	public String UserGroupSet(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "groupId") String groupId) {
		model.addAttribute("callType", 	callType);
		model.addAttribute("groupId", 		groupId);
		
		return "/grp/UserGroupSet"; 
	}
	
	@RequestMapping("/DoroName") 
	public String DoroName(Model model) {
		return "/cmm/DoroName"; 
	}

	@RequestMapping("/jusoPopup") 
	public String jusoPopup(Model model) {
		return "cmm/jusoPopup"; 
	}
	
//	@RequestMapping("/dblogin") 
//	public String dblogin(Model model) {
//		return "/dblogin"; 
//	}

}
