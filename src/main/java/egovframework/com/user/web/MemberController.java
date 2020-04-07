package egovframework.com.user.web;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.SecuritySha;
import egovframework.com.user.dao.MemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@Api(value = "MemberController", description = "회원정보 관리 REST API")
@RequestMapping("/member")
public class MemberController {
	
	@Value("${server.port}")
	private String serverPort;
	
	@Value("${spring.profiles}")
	private String serverState;
	
	@Autowired
	MemberService memberService;
	
	@ApiOperation(value = "회원목록조회")
	@GetMapping(path = "/list")
	public String MemberList() {
		System.out.println("\nMember/List");
		
		String rtn = "";
		Map<Object, Object> param = new HashMap<Object, Object>();
		List<HashMap<Object, Object>> lst = new ArrayList<HashMap<Object, Object>>();
		
		System.out.println("properties Test :: "+serverPort + "\t\t ServerState :: " + serverState);
		
		if("maria".equals(serverState)) {
			lst = memberService.selectDataMaria(param);
		} else {
			lst = memberService.selectDataOracle(param);
		}
		System.out.println(lst);
		
		ObjectMapper om = new ObjectMapper();
		try {
			rtn = om.writeValueAsString(lst);
		} catch (JsonProcessingException e) {
			rtn = "json Mapper Error.";
			e.printStackTrace();
		}
		
		return rtn;
	}
	
	@ApiOperation(value = "회원조회")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "memberId", value = "사용자ID", required = true, dataType = "string", paramType = "path", defaultValue = "")
    })
	@GetMapping(path = "/detailInfo/{memberId}")
	public String MemberDetailInfo(@PathVariable("memberId") String memberId) {
//		@RequestBody
		System.out.println("\nMember/DetailInfo === reqData :: " + memberId);
		
		String rtn = "";
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("mberId", memberId);
		
		List<HashMap<Object, Object>> lst = new ArrayList<HashMap<Object, Object>>();
		
		System.out.println("properties Test :: "+serverPort + "\t\t ServerState :: " + serverState);
		
		if("maria".equals(serverState)) {
			lst = memberService.selectMemberDetailMaria(sqlInpt);
		} else {
			lst = memberService.selectMemberDetailOracle(sqlInpt);
		}
		
		System.out.println(lst);
		
		
		ObjectMapper om = new ObjectMapper();
		try {
			rtn = om.writeValueAsString(lst);
		} catch (JsonProcessingException e) {
			rtn = "json Mapper Error.";
			e.printStackTrace();
		}
		
		return rtn;
	}
	
	@ApiOperation(value = "회원가입요청", notes = "회원가입 요청을 합니다.")
    @ApiImplicitParams({
//	    @ApiImplicitParam(name = "param", value = "회원가입정보", required = true, dataType = "json", paramType = "query"
//	    	, defaultValue = "{\n\"mberId\":\"userId\"\n\t,\"mberNm\":\"홍길동\"\n\t,\"password\":\"password11\"\n\t,\"passwordHint\":\" P01\"\n\t,\"passwordCnsr\":\"을지로\"\n\t,\"sexdstnCode\":\"M\"\n\t,\"areaNo\":\"010\"\n\t,\"middleTelno\":\"2239\"\n\t,\"endTelno\":\"3312\"\n\t,\"mberFxnum\":\"02-22-3334\"\n\t,\"moblphonNo\":\"01022393312\"\n\t,\"mberEmailAdres\":\"testMail@test.com\"\n\t,\"zip\":\"52313\"\n\t,\"adres\":\"서울특별시 중구 \""\n\t,\"detailAdres\":\"플젝시작\"\n\t,\"mberSttus\":\"A\"\n}")
    	@ApiImplicitParam(name = "mberId", value = "회원ID", required = true, dataType = "string", paramType = "path" , defaultValue = "홍길동")
    	,@ApiImplicitParam(name = "mberNm", value = "회원명", required = false, dataType = "string", paramType = "path" , defaultValue = "홍길동")
	    ,@ApiImplicitParam(name = "password", value = "비밀번호", required = true, dataType = "string", paramType = "path" , defaultValue = "password11")
	    ,@ApiImplicitParam(name = "passwordHint", value = "비밀번호 힌트 코드", required = false, dataType = "string", paramType = "path" , defaultValue = "P01")
	    ,@ApiImplicitParam(name = "passwordCnsr", value = "비밀번호 힌트", required = false, dataType = "string", paramType = "path" , defaultValue = "을지로")
	    ,@ApiImplicitParam(name = "sexdstnCode", value = "성별", required = false, dataType = "string", paramType = "path" , defaultValue = "M")
	    ,@ApiImplicitParam(name = "areaNo", value = "지역번호", required = false, dataType = "string", paramType = "path" , defaultValue = "010")
	    ,@ApiImplicitParam(name = "middleTelno", value = "중간 전화번호", required = false, dataType = "string", paramType = "path" , defaultValue = "2239")
	    ,@ApiImplicitParam(name = "endTelno", value = "마지막 전화번호", required = false, dataType = "string", paramType = "path" , defaultValue = "3312")
	    ,@ApiImplicitParam(name = "mberFxnum", value = "팩스번호", required = false, dataType = "string", paramType = "path" , defaultValue = "02-22-3334")
	    ,@ApiImplicitParam(name = "moblphonNo", value = "핸드폰번호", required = false, dataType = "string", paramType = "path" , defaultValue = "01022393312")
	    ,@ApiImplicitParam(name = "mberEmailAdres", value = "전자메일 주소", required = false, dataType = "string", paramType = "path" , defaultValue = "testMail@test.com")
	    ,@ApiImplicitParam(name = "zip", value = "우편번호", required = false, dataType = "string", paramType = "path" , defaultValue = "52313")
		,@ApiImplicitParam(name = "adres", value = "주소", required = false, dataType = "string", paramType = "path" , defaultValue = "서울특별시 중구")
		,@ApiImplicitParam(name = "detailAdres", value = "상세주소", required = false, dataType = "string", paramType = "path" , defaultValue = "플젝시작")
		,@ApiImplicitParam(name = "mberSttus", value = "회원상태", required = false, dataType = "string", paramType = "path" , defaultValue = "A")
    })
    @ApiResponses({
            @ApiResponse(code = 200, message = "OK !!"),
            @ApiResponse(code = 500, message = "Internal Server Error !!"),
            @ApiResponse(code = 404, message = "Not Found !!")
    })
	@PostMapping(path = "/AprovRequest")
	public String MemberAprovRequest(@RequestBody String param) throws Exception {
		String rtn = "";
		String data = URLDecoder.decode(param,"UTF-8");
		System.out.println("Member/AprovRequest\tproperties Test :: "+serverPort + "\t ServerState :: " + serverState +"\n" + data);
		
		ObjectMapper om = new ObjectMapper();
		Map<String, String> map = om.readValue(data, Map.class);
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("MBER_ID", map.get("mberId"));								//회원ID.........................................................
		
		//SpringSecurity 암호화 메서드 사용
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		String pw = passwordEncoder.encode(map.get("password"));
//		sqlInpt.put("PASSWORD", pw);						//비밀번호.................................................................
		
		//SHA-256 암호화
		String pw = SecuritySha.SHA256(map.get("password"));
		sqlInpt.put("PASSWORD", pw);						//비밀번호.................................................................
		
//		sqlInpt.put("PASSWORD", map.get("password"));						//비밀번호.................................................................
		sqlInpt.put("PASSWORD_HINT", map.get("passwordHint"));			//비밀번호힌트.................................................................
		sqlInpt.put("PASSWORD_CNSR", map.get("passwordCnsr"));			//비밀번호정답.................................................................
//		sqlInpt.put("IHIDNUM", map.get("memberId);								//주민등록번호
		sqlInpt.put("MBER_NM", map.get("mberNm"));							//회원명.................................................................
		sqlInpt.put("ZIP", map.get("zip"));											//우편번호.................................................................
		sqlInpt.put("ADRES", map.get("adres"));									//주소.................................................................
		sqlInpt.put("AREA_NO", map.get("areaNo"));								//지역번호.................................................................
		sqlInpt.put("MBER_STTUS", map.get("mberSttus"));					//회원상태
		sqlInpt.put("DETAIL_ADRES", map.get("detailAdres"));					//상세주소.................................................................
		sqlInpt.put("END_TELNO", map.get("endTelno"));						//끝전화번호.................................................................
		sqlInpt.put("MBTLNUM", map.get("moblphonNo"));						//이동전화번호.................................................................
//		sqlInpt.put("GROUP_ID", map.get("memberId);							//그룹ID
		sqlInpt.put("MBER_FXNUM", map.get("mberFxnum"));        			//회원팩스번호.................................................................
		sqlInpt.put("MBER_EMAIL_ADRES", map.get("mberEmailAdres"));	//회원이메일주소.................................................................
		sqlInpt.put("MIDDLE_TELNO", map.get("middleTelno"));				//중간전화번호.................................................................
//		sqlInpt.put("SBSCRB_DE", map.get("memberId);							//가입일자
		sqlInpt.put("SEXDSTN_CODE", map.get("sexdstnCode"));				//성별코드.................................................................
//		sqlInpt.put("ESNTL_ID", map.get("memberId);							//고유ID
		sqlInpt.put("LOCK_AT", "N");													//잠금여부.................................................................
		sqlInpt.put("LOCK_CNT", 0);													//잠금회수.................................................................
		sqlInpt.put("LOCK_LAST_PNTTM", "");										//잠금최종시점.................................................................
		
		int inputCnt = 0;
		if("maria".equals(serverState)) {
			inputCnt = memberService.insertMemberDetailMaria(sqlInpt);
		} else {
			inputCnt = memberService.insertMemberDetailOracle(sqlInpt);
		}
		
		rtn = om.writeValueAsString(inputCnt);
		System.out.println(inputCnt);
		return rtn;
	}
	
	@ApiOperation(value = "회원정보수정")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "param", value = "회원가입정보", required = true, dataType = "json", paramType = "query", defaultValue = "")
    })
	@PutMapping(path = "/changeMbrInfo")
	public String MemberChangeInfo(@RequestBody String param) throws Exception {
		String rtn = "";
		String data = URLDecoder.decode(param,"UTF-8");
		System.out.println("Member/changMbrInfo\tproperties Test :: "+serverPort + "\t ServerState :: " + serverState +"\n" + data);
		
		ObjectMapper om = new ObjectMapper();
		Map<String, String> map = om.readValue(data, Map.class);
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("MBER_ID", map.get("mberId"));								//회원ID.........................................................
		sqlInpt.put("PASSWORD", map.get("password"));						//비밀번호.................................................................
		sqlInpt.put("PASSWORD_HINT", map.get("passwordHint"));			//비밀번호힌트.................................................................
		sqlInpt.put("PASSWORD_CNSR", map.get("passwordCnsr"));			//비밀번호정답.................................................................
//		sqlInpt.put("IHIDNUM", map.get("memberId);								//주민등록번호
		sqlInpt.put("MBER_NM", map.get("mberNm"));							//회원명.................................................................
		sqlInpt.put("ZIP", map.get("zip"));											//우편번호.................................................................
		sqlInpt.put("ADRES", map.get("adres"));									//주소.................................................................
		sqlInpt.put("AREA_NO", map.get("areaNo"));								//지역번호.................................................................
		sqlInpt.put("DETAIL_ADRES", map.get("detailAdres"));					//상세주소.................................................................
		sqlInpt.put("END_TELNO", map.get("endTelno"));						//끝전화번호.................................................................
		sqlInpt.put("MBTLNUM", map.get("moblphonNo"));						//이동전화번호.................................................................
//		sqlInpt.put("GROUP_ID", map.get("memberId);							//그룹ID
		sqlInpt.put("MBER_FXNUM", map.get("mberFxnum"));        			//회원팩스번호.................................................................
		sqlInpt.put("MBER_EMAIL_ADRES", map.get("mberEmailAdres"));	//회원이메일주소.................................................................
		sqlInpt.put("MIDDLE_TELNO", map.get("middleTelno"));				//중간전화번호.................................................................
//		sqlInpt.put("SBSCRB_DE", map.get("memberId);							//가입일자
		sqlInpt.put("SEXDSTN_CODE", map.get("sexdstnCode"));				//성별코드.................................................................
//		sqlInpt.put("ESNTL_ID", map.get("memberId);							//고유ID
		sqlInpt.put("LOCK_AT", "N");													//잠금여부.................................................................
		sqlInpt.put("LOCK_CNT", 0);													//잠금회수.................................................................
		sqlInpt.put("LOCK_LAST_PNTTM", "");										//잠금최종시점.................................................................
		
		int inputCnt = 0;
		if("maria".equals(serverState)) {
			inputCnt = memberService.updateMemberDetailMaria(sqlInpt);
		} else {
			inputCnt = memberService.updateMemberDetailOracle(sqlInpt);
		}
		
		rtn = om.writeValueAsString(inputCnt);
		System.out.println(inputCnt);
		return rtn;
	}
	
	@ApiOperation(value = "회원정보 삭제")
	@DeleteMapping(path = "/deleteMbrInfo")
	public String MemberDeleteInfo(@RequestBody String param) throws Exception {
		String rtn = "";
		String data = URLDecoder.decode(param,"UTF-8");
		System.out.println("Member/deleteMbrInfo\tproperties Test :: "+serverPort + "\t ServerState :: " + serverState +"\n" + data);
		
		ObjectMapper om = new ObjectMapper();
		Map<String, String> map = om.readValue(data, Map.class);
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("MBER_ID", map.get("mberId"));								//회원ID.........................................................
		
		int inputCnt = 0;
		if("maria".equals(serverState)) {
			inputCnt = memberService.deleteMemberMaria(sqlInpt);
		} else {
			inputCnt = memberService.deleteMemberOracle(sqlInpt);
		}
		
		rtn = om.writeValueAsString(inputCnt);
		System.out.println(inputCnt);
		return rtn;
	}
	
	@ApiOperation(value = "회원가입상태변경")
	@PutMapping(path = "/changeMbrState")
	public String MemberChangeState(@RequestBody String param) throws Exception {
		String rtn = "";
		String data = URLDecoder.decode(param,"UTF-8");
		System.out.println("Member/changeMbrState\tproperties Test :: "+serverPort + "\t ServerState :: " + serverState +"\n" + data);
		
		ObjectMapper om = new ObjectMapper();
		Map<String, String> map = om.readValue(data, Map.class);
		
		//입력값 파라미터 정의
		Map<Object, Object> sqlInpt = new HashMap<Object, Object>();
		sqlInpt.put("MBER_ID", map.get("mberId"));								//회원ID.........................................................
		sqlInpt.put("MBER_STTUS", map.get("mberSttus"));					//회원상태
		
		int inputCnt = 0;
		if("maria".equals(serverState)) {
			inputCnt = memberService.updateMemberStateMaria(sqlInpt);
		} else {
			inputCnt = memberService.updateMemberStateOracle(sqlInpt);
		}
		
		rtn = om.writeValueAsString(inputCnt);
		System.out.println(inputCnt);
		return rtn;
	}
}
