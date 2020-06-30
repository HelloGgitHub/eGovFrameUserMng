package egovframework.com.user.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.SecuritySha;
import egovframework.com.user.dao.UserLoginService;
import egovframework.com.user.dao.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * @title : 사용자 ID/PW로그인 
 * @package : egovframework.com.user.web
 * @filename : UserLoginController.java
 * @author : "egov"
 * @since : 2020. 6. 11.
 * @version : 1.0
 * @desc : 사용자의 ID/Password를 통한 로그인을 처리한다.
 * 
 *  ======= 변경이력 =======
 * 
 * 날자                       변경자                  설명
 * ----------         -------           ------------------------------------
 * 2020. 6. 11.         "egov"           최초 생성(ver 1.0)
 * 
 */
@RestController
@Api(value = "UserLoginController", description = "사용자 로그인 REST API")
@RequestMapping("/login")
public class UserLoginController {
	
	@Autowired
	UserLoginService userLoginService;
	
	/**
	 * @name : UserLogin(사용자 로그인)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자의 ID/PW input 값으로 로그인 처리를 한다.
	 *              로그인의 결과값은 사용자 정보를 출력한다.
	 */
	@ApiOperation(value = "사용자 로그인", notes = "사용자 ID/PW를 입력받아 사용자 정보를 반환합니다.")
	@PostMapping(path = "/idpw")
	public String UserLogin(@RequestBody UserVo usr) throws UnsupportedEncodingException {
		
		String rtn = "";
		String pUserId 			= URLDecoder.decode(usr.getUsrId()		,"UTF-8");
		String pPassWord 	= URLDecoder.decode(usr.getPassword()	,"UTF-8");
		
		String pw = SecuritySha.SHA256(pPassWord);		//SHA-256 암호화
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("USRID", 		pUserId);
		sqlInpt.put("USRPW", 	pw);

		int pwck = 0;
		pwck = userLoginService.selectUserPwCk(sqlInpt);
		
		Map<Object, Object> lst = new HashMap<Object, Object>();
		if(pwck > 0) {
			lst = userLoginService.selectUserDetail(sqlInpt);
			lst.put("RESULTCD", "0");
			lst.put("RESULTMSG", "정상 처리 되었습니다.");
		}else {
			lst.put("RESULTCD", "1");
			lst.put("RESULTMSG", "일치하는 사용자 정보가 없습니다.");
		}
		
		ObjectMapper om = new ObjectMapper();
		try {
			rtn = om.writeValueAsString(lst);
		} catch (JsonProcessingException e) {
			rtn = "json Mapper Error.";
			e.printStackTrace();
		}
		
		return rtn;
	}

}
