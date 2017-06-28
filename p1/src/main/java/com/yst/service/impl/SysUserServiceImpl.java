package com.yst.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yst.dao.SysUserMapper;
import com.yst.dto.SysModule;
import com.yst.dto.SysUser;
import com.yst.service.SysUserService;
import com.yst.util.Pagination;

@Service
public class SysUserServiceImpl implements SysUserService{
	@Autowired
	SysUserMapper userMapper;
	
	/**
	 * 验证用户名密码
	 * @param userName
	 * @param password
	 * @return
	 */
	public SysUser getUserByUserNameAndPwd(String userName,String password){
		SysUser user=new SysUser();
		user.setUsername(userName);
		user.setPwd(password);
		return userMapper.getUserByUserNameAndPwd(user);
	}
	/**
	 * @return(0 添加成功；-1 该用户已存在)
	 */
	public int addUser(String userName,String pwd){
		//判断该用户是否已经存在
		SysUser exsitUser=userMapper.getUserByUserName(userName);
		if(exsitUser==null){
			SysUser user=new SysUser();
			user.setUsername(userName);
			user.setPwd(pwd);
			userMapper.insertSelective(user);
		}else{
			return -1;
		}
		return 0;
	}

	public List<SysModule> getMenuList(String username){
		List<SysModule> list = userMapper.getMenuList(username);
		return list;
	}
	public Pagination getUserList(Pagination pagination){
   	    Map<String, Object> map = new HashMap<String, Object>();
   	    map.put("start", pagination.getLimit().get("start"));
        map.put("end", pagination.getLimit().get("end"));
        map.putAll(pagination.getQuery());
        map.putAll(pagination.queryOtherParam());
        map.putAll(pagination.getSysCodeMap());
        int count=userMapper.getUserList_count(map);
        List<SysUser> list = userMapper.getUserList(map);
        pagination.setTotalRecord(count);
        pagination.setItems(list);
		return pagination;
	}
	@Override
	/**
	 * 删除用户
	 */
	public void deleteUser(List<Integer> userIdStr) {
		for(Integer userId:userIdStr){
			userMapper.deleteByPrimaryKey(userId);
		}
	}
	@Override
	public int addUser(SysUser user) {
		// TODO Auto-generated method stub
		return 0;
	}
}
