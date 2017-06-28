package com.yst.dao;

import java.util.List;

import com.yst.dto.SysModule;

public interface SysModuleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysModule record);

    int insertSelective(SysModule record);

    SysModule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysModule record);

    int updateByPrimaryKey(SysModule record);
    
}