package khu.jsp.common.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import khu.jsp.common.dao.CommonDao;
 
@Service("commonService")
public class CommonServiceImpl implements CommonService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="commonDao")
    private CommonDao commonDao;

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return commonDao.selectFileInfo(map);
	}
	
}


