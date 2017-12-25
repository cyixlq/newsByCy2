package com.cy.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.cy.bean.Catalog;
import com.cy.utils.HibernateUtils;

@Transactional
public class CatalogDAO {
	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 按ID查找栏目
	 * @param id
	 * @return Catalog
	 */
	public Catalog findbyid(int id){
		Catalog catalog=hibernateTemplate.get(Catalog.class, id);
		return catalog;
	}
	/**
	 * 增加新闻栏目
	 * @param catalog
	 * @return boolean
	 */
	public boolean add(Catalog catalog) {
		Integer i=(Integer) hibernateTemplate.save(catalog);
		if(i>0)
			return true;
		return false;
	}
	/**
	 * 凭借ID修改数据
	 * @param catalog
	 * @return
	 */
	public boolean update(Catalog catalog) {
		hibernateTemplate.update(catalog);
		return true;
	}
	/**
	 * 删除
	 * @param caid
	 * @return
	 */
	public boolean del(int caid){
		Catalog catalog=hibernateTemplate.get(Catalog.class, caid);
		hibernateTemplate.delete(catalog);
		return true;
	}
	/**
	 * 新闻栏目全查
	 * @return
	 */
	public List<Catalog> findall(){
		List<Catalog> list=(List<Catalog>) hibernateTemplate.find("from Catalog");
		return list;
	}
}
