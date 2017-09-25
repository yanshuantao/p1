package com.yst.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yst.base.BaseAction;
import com.yst.dto.SysUser;
import com.yst.service.SysUserService;
import com.yst.util.Pagination;

@Controller
@RequestMapping("users")
public class UserAction extends BaseAction{
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private  HttpServletRequest request;
	
	
	@RequestMapping("list.action")
	public String list(@RequestParam(value="page",required=false)Pagination page){
		if(page==null){
			page=new Pagination();
		}
		page.setParams(request.getParameterMap());
		page=sysUserService.getUserList(page);
		page.setActionUrl("list.action");
		request.setAttribute("page", page);
		return "/user/user_list";
	}
	@RequestMapping("update.action")
	public String toUpdate(@RequestParam(value="id")Integer id){
		SysUser user = sysUserService.getUserById(id);
		request.setAttribute("user", user);
		return "/user/user_edit";
	}
	@ResponseBody
	@RequestMapping("updateDo.action")
	public String updateDo(){
		return "";
	}

}
