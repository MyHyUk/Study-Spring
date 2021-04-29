package khu.jsp.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import khu.jsp.common.dao.AbstractDao;

@Repository("boardDao")
public class BoardDao extends AbstractDao{
	
	private final static String namespace = "board.";
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>)selectList(namespace+"selectBoardList", map);
	}

	
	public void insertBoard(Map<String, Object> map) throws Exception{
	    insert(namespace+"insertBoard", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
	    update(namespace+"updateHitCnt", map);
	}
	 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne(namespace+"selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update(namespace+"updateBoard", map);
		
	}

	public void deleteBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete(namespace+"deleteBoard", map);
	}

	public Map<String, Object> checkBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 return (Map<String, Object>) selectOne(namespace+"checkBoard", map);
	}

	public void repleBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert(namespace+"repleBoard", map);
	}


	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert(namespace+"insertFile", map);
	}


	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		 return (List<Map<String, Object>>)selectList(namespace+"selectFileList", map);
	}
	
	public void deleteFileList(Map<String, Object> map) throws Exception{
	    update(namespace+"deleteFileList", map);
	}
	 
	public void updateFile(Map<String, Object> map) throws Exception{
	    update(namespace+"updateFile", map);
	}


	public Map<String, Object> selectUserDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne(namespace+"selectUserDetail",map);
	}


	public void insertUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert(namespace+"insertUser",map);
		
	}


	
}
