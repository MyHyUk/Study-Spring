package khu.jsp.board.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import khu.jsp.board.dao.BoardDao;
import khu.jsp.common.util.FileUtils;


@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="boardDao")
    private BoardDao boardDao;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;


	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
	    return boardDao.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		boardDao.insertBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
        	boardDao.insertFile(list.get(i));
        }
		
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		boardDao.updateHitCnt(map);
		
	    Map<String, Object> resultMap = new HashMap<String,Object>();
	    Map<String, Object> tempMap = boardDao.selectBoardDetail(map);
	    resultMap.put("map",tempMap);

	    List<Map<String, Object>> list = boardDao.selectFileList(map);
	    resultMap.put("list", list);


	    return resultMap;

	}

	
	@Override
	public void updateBoard(Map<String, Object> map,HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		boardDao.updateBoard(map);
		
		//boardDao.deleteFileList(map);
	    List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
	    Map<String,Object> tempMap = null;
	    for(int i=0, size=list.size(); i<size; i++){
	        tempMap = list.get(i);
	        if(tempMap.get("IS_NEW").equals("Y")){
	        	boardDao.insertFile(tempMap);
	        }
	        else{
	        	boardDao.updateFile(tempMap);
	        }
	    }


	}


	@Override
	public void deleteBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDao.deleteBoard(map);
		
	}

	@Override
	public Map<String, Object> checkBoard(Map<String, Object> map) {
	    Map<String, Object> resultMap = boardDao.checkBoard(map);
		return resultMap;
	}


	@Override
	public void repleBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDao.repleBoard(map);
		
	}

	@Override
	public  Map<String, Object> selectUserDetail(Map<String, Object> map) throws Exception {
		return boardDao.selectUserDetail(map);
	}

	@Override
	public void insertUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDao.insertUser(map);
		
		
	}





	
	





}