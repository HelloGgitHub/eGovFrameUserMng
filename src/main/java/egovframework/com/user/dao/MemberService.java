package egovframework.com.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
	
	@Autowired
    private MemberDao mapper;
	
	//회원목록 조회
	public List<HashMap<Object, Object>> selectDataMaria(Map<Object, Object> param) {
        return mapper.selectDataMaria(param);
    }
	public List<HashMap<Object, Object>> selectDataOracle(Map<Object, Object> param) {
        return mapper.selectDataOracle(param);
    }
	
	//상세정보 조회
	public List<HashMap<Object, Object>> selectMemberDetailMaria(Map<Object, Object> param) {
        return mapper.selectMemberDetailMaria(param);
    }
	public List<HashMap<Object, Object>> selectMemberDetailOracle(Map<Object, Object> param) {
        return mapper.selectMemberDetailOracle(param);
    }

	//회원가입신청
	public int insertMemberDetailMaria(Map<Object, Object> param) {
        return mapper.insertMemberDetailMaria(param);
    }
	public int insertMemberDetailOracle(Map<Object, Object> param) {
        return mapper.insertMemberDetailOracle(param);
    }

	//회원정보 변경
	public int updateMemberDetailMaria(Map<Object, Object> param) {
        return mapper.updateMemberDetailMaria(param);
    }
	public int updateMemberDetailOracle(Map<Object, Object> param) {
        return mapper.updateMemberDetailOracle(param);
    }
	
	//회원정보 삭제
	public int deleteMemberMaria(Map<Object, Object> param) {
        return mapper.deleteMemberMaria(param);
    }
	public int deleteMemberOracle(Map<Object, Object> param) {
        return mapper.deleteMemberOracle(param);
    }

	//회원가입 상태 변경
	public int updateMemberStateMaria(Map<Object, Object> param) {
        return mapper.updateMemberStateMaria(param);
    }
	public int updateMemberStateOracle(Map<Object, Object> param) {
        return mapper.updateMemberStateOracle(param);
    }

	
    public int deleteData(HashMap<Object, Object> param) throws Exception {
        return mapper.deleteData(param);
    }

    public int insertData(HashMap<Object, Object> param) throws Exception {
        return mapper.insertData(param);
    }

    public int updateData(HashMap<Object, Object> param) throws Exception {
        return mapper.updateData(param);
    }
}
