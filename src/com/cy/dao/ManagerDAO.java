package com.cy.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.cy.bean.Manager;

@Transactional
public class ManagerDAO {
	
	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 登陆
	 * @param name
	 * @param pwd
	 * @return boolean
	 */
	public boolean login(String managername,String password){
		List<Manager> list=(List<Manager>) hibernateTemplate.find("from Manager m where m.managername=? and m.passwd=?", managername,password);
		if(list.size()>0)
			return true;
		return false;
	}
	/**
	 * 插入一条数据
	 * @param manager
	 * @return boolean
	 */
	public boolean add(Manager manager){
		Integer i=(Integer) hibernateTemplate.save(manager);
		if(i>0)
			return true;
		return false;
	}
	/**
	 * 凭借id删除数据
	 * @param id
	 * @return boolean
	 */
	public boolean deleteyid(int id){
		Manager manager=hibernateTemplate.get(Manager.class, id);
		hibernateTemplate.delete(manager);
		return true;
	}
	public Manager findById(int id){
		Manager manager=hibernateTemplate.get(Manager.class, id);
		return manager;
	}
	/**
	 * @param manager
	 * @return boolean
	 */
	public boolean update(Manager manager){
		hibernateTemplate.update(manager);
		return true;
	}
	/**
	 * 管理员全查
	 * @return List<Manager>
	 */
	public List<Manager> findall(){
		List<Manager> list=(List<Manager>) hibernateTemplate.find("from Manager");
		return list;
	}
}
