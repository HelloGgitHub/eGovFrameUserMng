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
		System.out.println("++++++++++++++++Main Page++++++++++++");
		return "MainPage"; 
	}

	@RequestMapping("/FrameLeft") 
	public String FrameLeft(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++LeftMenu Page++++++++++++");
		return "FrameLeft"; 
	}
	@RequestMapping("/FrameTop") 
	public String FrameTop(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++LeftTop Page++++++++++++");
		return "FrameTop"; 
	}
	
	@RequestMapping("/Login") 
	public String Login(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++UserInfo Page++++++++++++");
		return "Login"; 
	}

	@RequestMapping("/UserList") 
	public String welcomeA(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++++UserList Page+++++++++++");
		return "UserList"; 
	} 
	
	@RequestMapping("/UserInfo") 
	public String MemberInfo(Model model
			, @RequestParam(value = "callType") String callType
			, @RequestParam(value = "userId") String userId) {
		model.addAttribute("msg", "jstl");
		model.addAttribute("callType", 	callType);
		model.addAttribute("userId", 		userId);
		
		System.out.println("++++++++++++++++UserInfo Page++++++++++++userId::"+ userId + "===callType :: "+callType);
		return "UserInfo"; 
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
