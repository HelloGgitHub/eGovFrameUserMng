package egovframework.com.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @title : 사용자 ID/PW로그인 처리 Service
 * @package : egovframework.com.user.dao
 * @filename : UserLoginService.java
 * @author : "egov"
 * @since : 2020. 6. 12.
 * @version : 1.0
 * @desc : 사용자 ID/PW로그인 처리 프로세스에 관련된 기능 모음.
 * 
 *  ======= 변경이력 =======
 * 
 * 날자                       변경자                  설명
 * ----------         -------           ------------------------------------
 * 2020. 6. 12.         "egov"           최초 생성(ver 1.0)
 * 
 */
@Service
@Transactional
public class UserLoginService {
	
	@Autowired
    private UserLoginDao mapper;
	
	//상세정보 조회
	/**
	 * @name : selectUserDetail(  )
	 * @date : 2020. 6. 12.
	 * @author : "egov"
	 * @return_type : HashMap<Object,Object>
	 * @desc : 
	 */
	public HashMap<Object, Object> selectUserDetail(Map<Object, Object> param) {
        return mapper.selectUserDetail(param);
    }
 
	//사용자 pw체크
	public HashMap<String, Object> selectUserPwCk(Map<Object, Object> param) {
        return mapper.selectUserPwCk(param);
    }
}
