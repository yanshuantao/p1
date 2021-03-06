package com.yst.action;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yst.dto.SysModule;
import com.yst.dto.SysUser;
import com.yst.model.SysUserModel;
import com.yst.security.Md5Encode;
import com.yst.service.SysUserService;

@Controller
@RequestMapping("user")
public class SysUserAction {

	@Autowired
	private SysUserService sysUserService;
	@ResponseBody
	@RequestMapping("login.action")
	public int login(@RequestParam(value = "name") String username,
			@RequestParam(value = "psd") String password,
			HttpServletRequest request) {
		int result=-1;
		HttpSession session = request.getSession();
		String pwdEncode = "";
		
		try {
			pwdEncode = Md5Encode.EncoderByMd5(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		SysUser userInfo = sysUserService.getUserByUserNameAndPwd(username,
				pwdEncode);
		if (userInfo != null) {
			result=0;
			session.setAttribute("userInfo", userInfo);
		} else {
			result=-2;
		}
		return result;
	}
	/**
	 * 用户名密码验证通过后跳转首页
	 * @param username
	 * @param request
	 * @return
	 */
	@RequestMapping("toHomePage.action")
	public String toHomePage(@RequestParam(value = "name") String username,HttpServletRequest request){
		List<SysModule> moduleList = sysUserService.getMenuList(username);
		List<SysModule> endModuleList = new ArrayList<SysModule>();
		for (SysModule module : moduleList) {
			Integer level = module.getLevel();
			if (level == 1) {
				endModuleList.add(module);
			}
		}
		for (SysModule parentModule : endModuleList) {
			List<SysModule> sonList=new ArrayList<SysModule>();
			for (SysModule module : moduleList) {
				Integer parentId = module.getParentId();
				Integer level = module.getLevel();
				if (level == 2) {
					if (parentModule.getId() == parentId) {
						sonList.add(module);
					}
				}
			}
			parentModule.setSonList(sonList);
		}
		HttpSession session = request.getSession();
		session.setAttribute("moduleList", moduleList);
		request.setAttribute("endModuleList", endModuleList);
		request.setAttribute("moduleList", moduleList);
		return "homePage";
	}
//	@RequestMapping("getUserList.action")
//	public String getUserList(HttpServletRequest request,HttpServletResponse response){
//		List<SysUser> userList = sysUserService.getUserList();
//		request.setAttribute("userList", userList);
//		return "userList";
//	}
/*	@ResponseBody
	@RequestMapping("getUserList.action")
	public Pagination getUserList(HttpServletRequest request,HttpServletResponse response){
		Pagination pagination = sysUserService.getUserList();
		return pagination;
	}
*/	@RequestMapping("userAdd.action")
	public String userAdd(){
		return "addUser";
	}
	@ResponseBody
	@RequestMapping("addUser.action")
	public int addUser(HttpServletRequest request,@RequestParam(value = "userName_add") String userName_add,
			@RequestParam(value = "pwd_add") String pwd_add){
		int result=-1;
		try {
			pwd_add=Md5Encode.EncoderByMd5(pwd_add);
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		try {
			SysUser user=new SysUser();
			user.setUsername(userName_add);
			user.setPwd(pwd_add);
			result = sysUserService.addUser(user);
		} catch (Exception e) {
			result=-2;
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("deleteUser.action")
	public int deleteUser(@RequestParam(value="userIdStr[]") List<Integer> userIdStr){
		int result=0;
		try {
			sysUserService.deleteUser(userIdStr);
		} catch (Exception e) {
			result=-1;
		}
		return result;
	}
	/**
	 * 将菜单集合转换成json格式传送给前端解析
	 * @param request
	 */
	@ResponseBody
	@RequestMapping("get")
	public void getModuleJson(HttpServletRequest request) {
		HttpSession session = request.getSession();
		SysUserModel userSession = (SysUserModel) session.getAttribute(session
				.getId());
		List<SysModule> moduleList = userSession.getModuleList();
		List<SysModule> endModuleList = new ArrayList<SysModule>();
		for (SysModule module : moduleList) {
			Integer level = module.getLevel();
			if (level == 1) {
				endModuleList.add(module);
			}
		}
		for (SysModule parentModule : endModuleList) {
			for (SysModule module : moduleList) {
				Integer parentId = module.getParentId();
				Integer level = module.getLevel();
				if (level == 2) {
					if (parentModule.getId() == parentId) {
						parentModule.getSonList().add(module);
					}
				}
			}
		}
	}
	public static void main(String[] args) {
		List<SysModule> list = new ArrayList<SysModule>();
		SysModule module1=new SysModule();
		module1.setId(1);
		SysModule module2=new SysModule();
		module2.setId(2);
		list.add(module1);
		list.add(module2);
		for(SysModule module:list){
			module.setLevel(22);
		}
		for(SysModule module:list){
		
		}
	}


}
