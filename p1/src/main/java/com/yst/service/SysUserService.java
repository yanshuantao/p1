package com.yst.service;

import java.util.List;

import com.yst.dto.SysModule;
import com.yst.dto.SysUser;
import com.yst.util.Pagination;

public interface SysUserService {
	
	SysUser getUserByUserNameAndPwd(String userName,String password);
	
	int addUser(SysUser user);
	
	List<SysModule> getMenuList(String username);
	
	Pagination getUserList(Pagination pagination);
	
	void deleteUser(List<Integer> userIdStr);
	
	SysUser getUserById(int id);

}
