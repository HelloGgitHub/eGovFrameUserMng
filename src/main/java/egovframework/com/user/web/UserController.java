package egovframework.com.user.web;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.SecuritySha;
import egovframework.com.user.dao.UserInfoService;
import egovframework.com.user.dao.UserModifyInfoVo;
import egovframework.com.user.dao.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * @title : 사용자 정보 관리
 * @package : egovframework.com.user.web
 * @filename : UserController.java
 * @author : "egov"
 * @since : 2020. 6. 11.
 * @version : 1.0
 * @desc : 사용자 정보 관리에 필요한 api를 restful형태로 제공한다.
 * 
 *  ======= 변경이력 =======
 * 
 * 날자                       변경자                  설명
 * ----------         -------           ------------------------------------
 * 2020. 6. 11.         "egov"           최초 생성(ver 1.0)
 * 
 */
@RestController
@Api(value = "UserController", description = "사용자 정보 관리 REST API")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserInfoService userService;
	
	/**
	 * @name : UserList(사용자 목록조회)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자 목록을 조회한다.
	 */
	@ApiOperation(value = "사용자 목록조회")
	@GetMapping(path = "/list")
	public String UserList() {
		
		String rtn = "";
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		Map<Object, Object> param = new HashMap<Object, Object>();
		List<HashMap<Object, Object>> lst = new ArrayList<HashMap<Object, Object>>();
		ObjectMapper om = new ObjectMapper();
		
		lst = userService.selectData(param);
		
		
		try {
			rtn = om.writeValueAsString(lst);
		} catch (JsonProcessingException e) {
			rtn = "json Mapper Error.";
			e.printStackTrace();
		}
		
		return rtn;
	}
	
	/**
	 * @name : UserDetailInfo(사용자 조회)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자ID를 input값으로 받아 사용자에 대한 정보를 조회한다.
	 */
	@ApiOperation(value = "사용자 조회")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "userId", value = "사용자ID", required = true, dataType = "string", paramType = "path", defaultValue = "")
    })
	@GetMapping(path = "/detailInfo/{userId}")
	public String UserDetailInfo(@PathVariable("userId") String userId) throws Exception {
		String rtn = "";
		ObjectMapper om = new ObjectMapper();
		List<HashMap<Object, Object>> lst = new ArrayList<HashMap<Object, Object>>();
		
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("USR_ID", URLDecoder.decode(userId		,"UTF-8"));
		
		lst = userService.selectUserDetail(sqlInpt);
		
		try {
			rtn = om.writeValueAsString(lst);
		} catch (JsonProcessingException e) {
			rtn = "json Mapper Error.";
			e.printStackTrace();
		}
		
		return rtn;
	}
	
	/**
	 * @name : UserAprovRequest( 사용자 등록 )
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자 정보를 DB에 insert한다.
	 */
	@ApiOperation(value = "사용자 가입요청", notes = "사용자 가입 요청을 합니다.")
	@PostMapping(path = "/arovRequest")
	public String UserAprovRequest(@RequestBody UserVo param) throws Exception {
		String rtn = "";
//		String data = URLDecoder.decode(rtn,"UTF-8");
		ObjectMapper om = new ObjectMapper();
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("USR_ID", param.getUsrId());
		if(null != param.getPassword() && !"".equals(param.getPassword()) && !"null".equals(param.getPassword())) {
			String pw = SecuritySha.SHA256(param.getPassword());			//SHA-256 암호화
			sqlInpt.put("PASSWORD", pw);
		}
		sqlInpt.put("PASSWORD_HINT", param.getPasswordHint());
		sqlInpt.put("PASSWORD_CNSR", param.getPasswordCnsr());
		sqlInpt.put("USR_NM", param.getUsrNm());
		sqlInpt.put("ZIP", param.getZip());
		sqlInpt.put("ADRES", param.getAdres());
		sqlInpt.put("AREA_NO", param.getAreaNo());
		sqlInpt.put("USR_STTUS", param.getUsrSttus());
		sqlInpt.put("DETAIL_ADRES", param.getDetailAdres());
		sqlInpt.put("END_TELNO", param.getEndTelno());
		sqlInpt.put("MBTLNUM", param.getMoblphonNo());
		sqlInpt.put("USR_FXNUM", param.getUsrFxnum());
		sqlInpt.put("USR_EMAIL_ADRES", param.getUsrEmailAdres());
		sqlInpt.put("MIDDLE_TELNO", param.getMiddleTelno());
		sqlInpt.put("SEXDSTN_CODE", param.getSexdstnCode());
		sqlInpt.put("LOCK_AT", "N");
		sqlInpt.put("LOCK_CNT", 0);
		sqlInpt.put("LOCK_LAST_PNTTM", "");

		List<HashMap<Object, Object>> lst = new ArrayList<HashMap<Object, Object>>();
		lst = userService.selectUserDetail(sqlInpt);
		int usrCnt = lst.size();

		Map<Object, Object> rtnMap = new HashMap<Object, Object>();
		if(usrCnt == 0) {
			int inputCnt = userService.insertUserDetail(sqlInpt);
			if (inputCnt > 0) {
				rtnMap.put("RESULTCD", "0");
				rtnMap.put("RESULTMSG", "정상 처리 되었습니다.");
			} else {
				rtnMap.put("RESULTCD", "1");
				rtnMap.put("RESULTMSG", "사용자 정보 등록에 실패 하였습니다.");
			}
		}else{
			rtnMap.put("RESULTCD", "1");
			rtnMap.put("RESULTMSG", "동일한 사용자가 존재 합니다.");
		}
		
		rtn = om.writeValueAsString(rtnMap);
		return rtn;
	}

	
	/**
	 * @name : UserChangeInfo(사용자정보 수정)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자 정보를 input값으로 받아 등록된 내용을 업데이트 한다.
	 */
	@ApiOperation(value = "사용자 정보수정")
	@PutMapping(path = "/modifyInfo")
	public String UserChangeInfo(@RequestBody UserModifyInfoVo param) throws Exception {
		String rtn = "";
		ObjectMapper om = new ObjectMapper();
		Map<Object, Object> rtnMap = new HashMap<Object, Object>();
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("USR_ID", param.getUsrId());
		
		if(null != param.getPassword() && !"".equals(param.getPassword()) && !"null".equals(param.getPassword())) {
			String pw = SecuritySha.SHA256(param.getPassword());			//SHA-256 암호화
			sqlInpt.put("PASSWORD", pw);
		}
		sqlInpt.put("PASSWORD_HINT", param.getPasswordHint());
		sqlInpt.put("PASSWORD_CNSR", param.getPasswordCnsr());
		sqlInpt.put("USR_NM", param.getUsrNm());
		sqlInpt.put("ZIP", param.getZip());
		sqlInpt.put("ADRES", param.getAdres());
		sqlInpt.put("AREA_NO", param.getAreaNo());
		sqlInpt.put("DETAIL_ADRES", param.getDetailAdres());
		sqlInpt.put("END_TELNO", param.getEndTelno());
		sqlInpt.put("MBTLNUM", param.getMoblphonNo());
		sqlInpt.put("USR_FXNUM", param.getUsrFxnum());
		sqlInpt.put("USR_EMAIL_ADRES", param.getUsrEmailAdres());
		sqlInpt.put("MIDDLE_TELNO", param.getMiddleTelno());
		sqlInpt.put("SEXDSTN_CODE", param.getSexdstnCode());
		sqlInpt.put("LOCK_AT", param.getLockAt());
		sqlInpt.put("LOCK_CNT", param.getLockCnt());
		sqlInpt.put("LOCK_LAST_PNTTM", param.getLockLastPnttm());
		
		int inputCnt = userService.updateUserDetail(sqlInpt);
		if(inputCnt > 0) {
			rtnMap.put("RESULTCD", "0");
			rtnMap.put("RESULTMSG", "정상 처리 되었습니다.");
		}else {
			rtnMap.put("RESULTCD", "1");
			rtnMap.put("RESULTMSG", "사용자 정보 변경에 실패 하였습니다.");
		}
		
		rtn = om.writeValueAsString(rtnMap);
		return rtn;
	}
	
	/**
	 * @name : UserDeleteInfo(사용자 정보 삭제)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자ID를 입력받아 등록된 사용자를 삭제 한다.
	 */
	@ApiOperation(value = "사용자 정보 삭제", notes = "가입 요청한 사용자정보를 삭제한다")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "userId"	, value = "사용자ID"	, required = true, dataType = "string", paramType = "query", defaultValue = "")
    })
	@DeleteMapping(path = "/deleteUsr")
	public String UserDeleteInfo(@RequestParam(value = "userId") String usrId) throws Exception {
		String rtn = "";
		ObjectMapper om = new ObjectMapper();
		Map<Object, Object> rtnMap = new HashMap<Object, Object>();
		
		String pUsrId = URLDecoder.decode(usrId,"UTF-8");
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("USR_ID", pUsrId);
		
		int inputCnt = userService.deleteUser(sqlInpt);
		if(inputCnt > 0) {
			rtnMap.put("RESULTCD", "0");
			rtnMap.put("RESULTMSG", "정상 처리 되었습니다.");
		}else {
			rtnMap.put("RESULTCD", "1");
			rtnMap.put("RESULTMSG", "삭제에 실패 하였습니다.");
		}
		
		rtn = om.writeValueAsString(rtnMap);
		return rtn;
	}
	
	/**
	 * @name : UserChangeState(사용자 가입상태 변경)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자의 회원 상태를 변경한다.
	 */
	@ApiOperation(value = "사용자 가입승인 상태변경", notes = "가입 요청한 사용자의 승인상태를 변경한다")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "userId"	, value = "사용자ID"	, required = true, dataType = "string", paramType = "query", defaultValue = "")
       ,@ApiImplicitParam(name = "usrSttus", value = "사용자상태"	, required = true, dataType = "string", paramType = "query", defaultValue = "")
    })
	@PutMapping(path = "/updateUsrState")
	public String UserChangeState(
			@RequestParam(value = "userId") String usrId,
			@RequestParam(value = "usrSttus") String usrSttus) throws Exception {
		String rtn = "";
		ObjectMapper om = new ObjectMapper();
		Map<Object, Object> rtnMap = new HashMap<Object, Object>();
		
		String pUserId 		= URLDecoder.decode(usrId		,"UTF-8");
		String pUsrSttus 		= URLDecoder.decode(usrSttus	,"UTF-8");
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("USR_ID", pUserId);							//회원ID
		sqlInpt.put("USR_STTUS", pUsrSttus);					//회원상태
		
		int inputCnt = userService.updateUserState(sqlInpt);
		if(inputCnt > 0) {
			rtnMap.put("RESULTCD", "0");
			rtnMap.put("RESULTMSG", "정상 처리 되었습니다.");
		}else {
			rtnMap.put("RESULTCD", "1");
			rtnMap.put("RESULTMSG", "사용자 상태변경에 실패 하였습니다.");
		}
		
		rtn = om.writeValueAsString(rtnMap);
		return rtn;
	}
	
	

	/**
	 * @name : UserChangePassword(사용자 패스워드 변경)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : String
	 * @desc : 사용자 패스워드를 변경한다.
	 */
	@ApiOperation(value = "사용자 패스워드 변경", notes = "사용자의 패스워드를 변경한다")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "userId"	, value = "사용자ID"		, required = true, dataType = "string", paramType = "query", defaultValue = "")
       ,@ApiImplicitParam(name = "usrPw"	, value = "사용자패스워드"	, required = true, dataType = "string", paramType = "query", defaultValue = "")
    })
	@PutMapping(path = "/updateUsrPw")
	public String UserChangePassword(
			@RequestParam(value = "userId") String usrId,
			@RequestParam(value = "usrPw") String usrPw) throws Exception {
		String rtn = "";
		ObjectMapper om = new ObjectMapper();
		Map<Object, Object> rtnMap = new HashMap<Object, Object>();
		String pUserId 		= URLDecoder.decode(usrId	,"UTF-8");
		String pUsrPw 		= URLDecoder.decode(usrPw	,"UTF-8");
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("USR_ID"		, pUserId);					//회원ID
		if(null != pUsrPw && !"".equals(pUsrPw) && !"null".equals(pUsrPw)) {
			String pw = SecuritySha.SHA256(pUsrPw);		//SHA-256 암호화
			sqlInpt.put("PASSWORD"	, pw);					//패스워드
		}		
		
		int inputCnt = userService.updateUserPassword(sqlInpt);
		if(inputCnt > 0) {
			rtnMap.put("RESULTCD", "0");
			rtnMap.put("RESULTMSG", "정상 처리 되었습니다.");
		}else {
			rtnMap.put("RESULTCD", "1");
			rtnMap.put("RESULTMSG", "사용자 상태변경에 실패 하였습니다.");
		}
		
		rtn = om.writeValueAsString(rtnMap);
		return rtn;
	}
	
}
