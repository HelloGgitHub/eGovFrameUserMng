package egovframework.com.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberDao {
	
	//회원목록 조회
	List<HashMap<Object, Object>> selectDataMaria(Map<Object, Object> param);
	List<HashMap<Object, Object>> selectDataOracle(Map<Object, Object> param);
	
	//상세정보 조회
	List<HashMap<Object, Object>> selectMemberDetailMaria(Map<Object, Object> param);
	List<HashMap<Object, Object>> selectMemberDetailOracle(Map<Object, Object> param);
	
	//회원가입 신청
	int insertMemberDetailMaria(Map<Object, Object> param);
	int insertMemberDetailOracle(Map<Object, Object> param);
	
	//회원정보 변경
	int updateMemberDetailMaria(Map<Object, Object> param);
	int updateMemberDetailOracle(Map<Object, Object> param);
	
	//회원정보 삭제
	int deleteMemberMaria(Map<Object, Object> param);
	int deleteMemberOracle(Map<Object, Object> param);

	//회원가입 상태 변경
	int updateMemberStateMaria(Map<Object, Object> param);
	int updateMemberStateOracle(Map<Object, Object> param);

	
	
	int deleteData(HashMap<Object, Object> param) throws Exception;
    int updateData(HashMap<Object, Object> param) throws Exception;
    int insertData(HashMap<Object, Object> param) throws Exception;
    
}
