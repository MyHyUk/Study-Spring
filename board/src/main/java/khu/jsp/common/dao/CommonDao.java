package khu.jsp.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("commonDao")
public class CommonDao extends AbstractDao {

	public Map<String, Object> selectFileInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("board.selectFileInfo", map);
	}

}
