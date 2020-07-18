package egovframework.com.user.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.com.cmm.ComUtil;

/**
 * @title : 사용자 정보 관리 Service
 * @package : egovframework.com.user.dao
 * @filename : UserInfoService.java
 * @author : "egov"
 * @since : 2020. 6. 11.
 * @version : 1.0
 * @desc : 사용자 정보 관리에 필요한 기능 모음.
 * 
 *  ======= 변경이력 =======
 * 
 * 날자                       변경자                  설명
 * ----------         -------           ------------------------------------
 * 2020. 6. 11.         "egov"           최초 생성(ver 1.0)
 * 
 */
@Service
@Transactional
public class UserInfoService {
	
	@Autowired
    private UserInfoDao mapper;
	
	/**
	 * @name : selectDataMaria(사용자목록 조회)
	 * @date : 2020. 6. 11.
	 * @author : "egov"
	 * @return_type : List<HashMap<Object,Object>>
	 */
	public List<HashMap<Object, Object>> selectData() {
		
		List<HashMap<Object, Object>> rtnLst = new ArrayList<HashMap<Object, Object>> ();
		List<HashMap<Object, Object>> sqlLst = new ArrayList<HashMap<Object, Object>> ();
		
		sqlLst = mapper.selectUserList();
		for(int i = 0; sqlLst.size() > i; i++) {
			HashMap<Object, Object> rtnMap= new HashMap<Object, Object>();
			rtnMap = sqlLst.get(i);
			rtnMap.put("changedt", ComUtil.dbDatetoDataFrm(rtnMap.get("changedt").toString()));
			rtnLst.add(rtnMap);
		}
        return rtnLst;
    }
	
	/**
	 * @name : selectUserDetail(사용자 상세정보 조회)
	 * @date : 2020. 6. 12.
	 * @author : "egov"
	 * @return_type : List<HashMap<Object,Object>>
	 */
	public List<HashMap<Object, Object>> selectUserDetail(Map<Object, Object> param) {
        return mapper.selectUserDetail(param);
    }

	/**
	 * @name : insertUserDetail(사용자 등록)
	 * @date : 2020. 6. 12.
	 * @author : "egov"
	 * @return_type : int
	 */
	public int insertUserDetail(Map<Object, Object> param) {
        return mapper.insertUserDetail(param);
    }
 
	/**
	 * @name : updateUserDetail(사용자 정보 변경)
	 * @date : 2020. 6. 12.
	 * @author : "egov"
	 * @return_type : int
	 */
	public int updateUserDetail(Map<Object, Object> param) {
        return mapper.updateUserDetail(param);
    }
	
	/**
	 * @name : deleteUser(사용자 정보 삭제)
	 * @date : 2020. 6. 12.
	 * @author : "egov"
	 * @return_type : int
	 */
	public int deleteUser(Map<Object, Object> param) {
        return mapper.deleteUser(param);
    }

	/**
	 * @name : updateUserState(사용자 가입 상태 변경)
	 * @date : 2020. 6. 12.
	 * @author : "egov"
	 * @return_type : int
	 */
	public int updateUserState(Map<Object, Object> param) {
        return mapper.updateUserState(param);
    }

	/**
	 * @name : updateUserPassword(사용자 비밀번호 변경)
	 * @date : 2020. 6. 12.
	 * @author : "egov"
	 * @return_type : int
	 */
	public int updateUserPassword(Map<Object, Object> param) {
        return mapper.updateUserPassword(param);
    }

	
}
