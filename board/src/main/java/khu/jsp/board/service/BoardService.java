package khu.jsp.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	

	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;


	void updateBoard(Map<String, Object> map,HttpServletRequest request) throws Exception ;


	void deleteBoard(Map<String, Object> map);


	Map<String, Object> checkBoard(Map<String, Object> map);


	void repleBoard(Map<String, Object> map);


	 Map<String, Object> selectUserDetail(Map<String, Object> map) throws Exception;


	void insertUser(Map<String, Object> map);



}
