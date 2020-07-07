package egovframework.com.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @title : 사용자 정보 Dao 
 * @package : egovframework.com.user.dao
 * @filename : UserInfoDao.java
 * @author : "egov"
 * @since : 2020. 6. 12.
 * @version : 1.0
 * @desc : 사용자 정보 관리에 필요한 CRUD
 * 
 *  ======= 변경이력 =======
 * 
 * 날자                       변경자                  설명
 * ----------         -------           ------------------------------------
 * 2020. 6. 12.         "egov"           최초 생성(ver 1.0)
 * 
 */
@Repository
@Mapper
public interface UserInfoDao {
	
	List<HashMap<Object, Object>> selectUserList();
	
	List<HashMap<Object, Object>> selectUserDetail(Map<Object, Object> param);
	
	int insertUserDetail(Map<Object, Object> param);
	
	int updateUserDetail(Map<Object, Object> param);
	
	int deleteUser(Map<Object, Object> param);

	int updateUserState(Map<Object, Object> param);
	
	int updateUserPassword(Map<Object, Object> param);
    
}
