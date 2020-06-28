package egovframework.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class UserPageController {
	
	@RequestMapping("/corsTest") 
	public String crosTest(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++ddddddddddddddddddd++corsTest Page++++++++++++");
		return "corsTest"; 
	} 
	
	
	@RequestMapping("/UserListPageJson") 
	public String welcome(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("+++++++++++++++++MemberListPage Page++++++++++++");
		return "UserList"; 
	} 
	
	@RequestMapping("/UserList") 
	public String welcomeA(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++++MemberListPageA Page+++++++++++");
		return "EgovUsrManage"; 
	} 

	@RequestMapping("/UserInfo") 
	public String MemberInfo(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++MemberInfo Page++++++++++++");
		return "UserInfo"; 
	}

	@RequestMapping("/Login") 
	public String Login(Model model) {
		model.addAttribute("msg", "jstl");
		System.out.println("++++++++++++++++MemberInfo Page++++++++++++");
		return "IDPWLogin"; 
	}
	
}
