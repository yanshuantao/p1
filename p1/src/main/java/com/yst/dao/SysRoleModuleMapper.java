package com.yst.dao;

import com.yst.dto.SysRoleModule;

public interface SysRoleModuleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysRoleModule record);

    int insertSelective(SysRoleModule record);

    SysRoleModule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysRoleModule record);

    int updateByPrimaryKey(SysRoleModule record);
}