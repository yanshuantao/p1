package com.yst.dao;

import java.util.List;
import java.util.Map;

import com.yst.dto.SysModule;
import com.yst.dto.SysUser;

public interface SysUserMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);
    
    SysUser getUserByUserNameAndPwd(SysUser record);
    
    List<SysModule> getMenuList(String username);
    
    List<SysUser> getUserList(Map map);
    
    SysUser getUserByUserName(String userName);
    
    int getUserList_count(Map map);

}