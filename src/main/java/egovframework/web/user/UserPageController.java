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
		System.out.println("++++++++++++++++Main++++++++++++");
		return "MainPage"; 
	}
	
	@RequestMapping("/2") 
	public String Main2(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++Main++++++++++++");
		return "MainPage23"; 
	}	
	@RequestMapping("/FrameDown") 
	public String Main3(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++FrameDown++++++++++++");
		return "FrameDown"; 
	}

	@RequestMapping("/FrameLeft") 
	public String FrameLeft(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++LeftMenu++++++++++++");
		return "FrameLeft"; 
	}
	@RequestMapping("/FrameTop") 
	public String FrameTop(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++LeftTop++++++++++++");
		return "FrameTop"; 
	}
	
	@RequestMapping("/Login") 
	public String Login(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++UserInfo++++++++++++");
		return "Login"; 
	}

	@RequestMapping("/UserList") 
	public String welcomeA(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++UserList++++++++++++");
		return "UserList"; 
	} 
	
	@RequestMapping("/UserInfo") 
	public String MemberInfo(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "userId") String userId) {
		model.addAttribute("msg", "jstl");
		model.addAttribute("callType", 	callType);
		model.addAttribute("userId", 		userId);
		
		System.out.println("++++++++++++++++UserInfo++++++++++++userId::"+ userId + "===callType :: "+callType);
		return "UserInfo"; 
	}

	@RequestMapping("/GroupInfo") 
	public String GroupInfo(Model model) {
		
		System.out.println("++++++++++++++++GroupInfo++++++++++++");
		return "GroupInfo"; 
	}

	
	
	
	
	
	
	
	
	
	@RequestMapping("/corsTest") 
	public String crosTest(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++ddddddddddddddddddd++corsTest Page++++++++++++");
		return "corsTest"; 
	} 
	
	@RequestMapping("/UserListPageJson") 
	public String welcome(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("+++++++++++++++++UserListPage Page++++++++++++");
		return "UserList"; 
	} 
	
	
}
