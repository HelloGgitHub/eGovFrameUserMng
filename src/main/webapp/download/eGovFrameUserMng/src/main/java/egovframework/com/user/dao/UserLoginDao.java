package egovframework.com.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @title : 사용자 ID/PW로그인 처리 Dao 
 * @package : egovframework.com.user.dao
 * @filename : UserLoginDao.java
 * @author : "egov"
 * @since : 2020. 6. 11.
 * @version : 1.0
 * @desc : 사용자 ID/PW로그인에 관련된 CRUD 모음.
 * 
 *  ======= 변경이력 =======
 * 
 * 날자                       변경자                  설명
 * ----------         -------           ------------------------------------
 * 2020. 6. 11.         "egov"           최초 생성(ver 1.0)
 * 
 */
@Repository
@Mapper
public interface UserLoginDao {
	
	HashMap<Object, Object> selectUserDetail(Map<Object, Object> param);
	
	HashMap<String, Object> selectUserPwCk(Map<Object, Object> param);
    
}
