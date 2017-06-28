package com.yst.model;

import java.util.List;

import com.yst.dto.SysModule;
import com.yst.dto.SysUser;

public class SysUserModel {
	//用户基本信息
	private SysUser userInfo;
	//用户的菜单信息
    private List<SysModule> moduleList;


	public SysUser getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(SysUser userInfo) {
		this.userInfo = userInfo;
	}

	public List<SysModule> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<SysModule> moduleList) {
		this.moduleList = moduleList;
	}
    
}
