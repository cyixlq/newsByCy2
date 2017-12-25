package com.cy.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.cy.bean.Manager;
import com.cy.dao.ManagerDAO;
import com.opensymphony.xwork2.ActionContext;

public class ManagerAction {
	
	private Manager manager;
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	private  ManagerDAO managerDAO;
	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}
	
	private List<Manager> list;
	private HttpSession session=ServletActionContext.getRequest().getSession();

	public String login() {
		String managername=manager.getManagername();
		String password=manager.getPasswd();
		if (managerDAO.login(managername, password)) {
			session.setAttribute("isLogin", manager);
			return "login_suc";
		}
		return "login_fail";
	}
	public String findall(){
		list=managerDAO.findall();
		return "findall";
	}
	public String add(){
		if(managerDAO.add(manager)){
			return "findall_manager";
		}
		return "edit_manager";
	}
	public String findbyid(){
		manager=managerDAO.findById(manager.getManagerid());
		return "edit_manager";
	}
	public String update(){
		if(managerDAO.update(manager)){
			return "findall_manager";
		}
		return "edit_manager";
	}
	public String deletebyid(){
		if(managerDAO.deleteyid(manager.getManagerid())){
			return "findall_manager";
		}
		return "findall_manager";
	}
	public String edit(){
		int id=manager.getManagerid();
		if(manager.getManagerid()==0){
			return add();
		}
		return update();
	}
	public String signout(){
		session.removeAttribute("isLogin");
		return "singout";
	}
	
	
	
	public Manager getManager() {
		return manager;
	}
	public List<Manager> getList() {
		return list;
	}
}
