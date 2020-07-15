package egovframework.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller 
public class UserPageController {
	
	@RequestMapping("/") 
	public String Main(Model model) {
		model.addAttribute("msg", "jstl");
		return "MainPage"; 
	}
	
	@RequestMapping("/FrameDown") 
	public String Main3(Model model) {
		model.addAttribute("msg", "jstl");
		return "FrameDown"; 
	}

	@RequestMapping("/FrameLeft") 
	public String FrameLeft(Model model) {
		model.addAttribute("msg", "jstl");
		return "FrameLeft"; 
	}
	@RequestMapping("/FrameTop") 
	public String FrameTop(Model model) {
		model.addAttribute("msg", "jstl");
		return "FrameTop"; 
	}
	
	@RequestMapping("/Login") 
	public String Login(Model model) {
		model.addAttribute("msg", "jstl");
		return "Login"; 
	}

	@RequestMapping("/UserList") 
	public String welcomeA(Model model) {
		model.addAttribute("msg", "jstl");
		return "/usr/UserList"; 
	} 
	
	@RequestMapping("/UserInfo") 
	public String UserInfo(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "userId") String userId) {
		model.addAttribute("msg", "jstl");
		model.addAttribute("callType", 	callType);
		model.addAttribute("userId", 		userId);
		
		return "/usr/UserInfo"; 
	}

	@RequestMapping("/GroupList") 
	public String GroupList(Model model) {
		return "/grp/GroupList"; 
	}

	@RequestMapping("/GroupInfo") 
	public String GroupInfo(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "groupId") String groupId) {

		model.addAttribute("msg", "jstl");
		model.addAttribute("callType", 	callType);
		model.addAttribute("groupId", 	groupId);

		return "/grp/GroupInfo"; 
	}

	@RequestMapping("/GroupUserSet") 
	public String GroupUserSet(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "userId") String userId) {
		model.addAttribute("msg", "jstl");
		model.addAttribute("callType", 	callType);
		model.addAttribute("userId", 		userId);
		
		return "/grp/GroupUserSet"; 
	}
	
	@RequestMapping("/UserGroupSet") 
	public String UserGroupSet(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "groupId") String groupId) {
		model.addAttribute("msg", "jstl");
		model.addAttribute("callType", 	callType);
		model.addAttribute("groupId", 		groupId);
		
		return "/grp/UserGroupSet"; 
	}
	
	@RequestMapping("/DoroName") 
	public String DoroName(Model model) {
		model.addAttribute("msg", "jstl");
		return "/cmm/DoroName"; 
	}

	@RequestMapping("/jusoPopup") 
	public String jusoPopup(Model model) {
		model.addAttribute("msg", "jstl");
		return "cmm/jusoPopup"; 
	}

	@RequestMapping("/doroSample") 
	public String doroSample(Model model) {
		model.addAttribute("msg", "jstl");
		return "cmm/Sample"; 
	}
	
}
