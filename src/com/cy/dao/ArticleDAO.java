package com.cy.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.cy.bean.Article;
import com.cy.bean.Catalog;
import com.cy.utils.HibernateUtils;

@Transactional
public class ArticleDAO {
	
	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	/**
	 *靠id查找新闻
	 * @param id
	 * @return
	 */
	public Article findbyarid(int arid){
		Article article=hibernateTemplate.get(Article.class, arid);
		return article;
	}
	
	public Integer count(){
		String hql = "select count(*) from Article as article";
		List<Object> list=(List<Object>) hibernateTemplate.find(hql);
		if(!list.isEmpty()&&0<list.size()){
			Object obj=list.get(0);
			Long lobj=(Long) obj;
			Integer i=lobj.intValue();
			return i;
		}
		return 0;
	}
	/**
	 * 添加一条新闻数据
	 * @param article
	 * @return
	 */
	public boolean add(Article article) {
		Integer i=(Integer) hibernateTemplate.save(article);
		if(i>0)
			return true;
		return false;
	}
	/**
	 * 凭借id删除一条新闻
	 * @param id
	 * @return
	 */
	public boolean deleteyid(int id){
		Article article=hibernateTemplate.get(Article.class, id);
		hibernateTemplate.delete(article);
		return true;
	}
	/**
	 * 修改新闻数据
	 * @param Article
	 * @return boolean
	 */
	public boolean update(Article article){
		hibernateTemplate.update(article);
		return true;
	}
	public List<Article> findall(){
		List<Article> list=(List<Article>) hibernateTemplate.find("from Article");
		return list;
	}
	
	public List<Article> findbymore(int nowpage,int max,String state,int caid){
		StringBuffer hql=new StringBuffer("from Article a left outer join fetch a.catalog");
		if(!"3".equals(state)){
			hql.append(" where a.arstate=").append(state);
			if(caid!=0){
				hql.append(" and a.catalog.caid=").append(caid);
			}
		}else{
			if(caid!=0)
				hql.append(" where a.catalog.caid=").append(caid);
		}
		List<Article> list=(List<Article>) hibernateTemplate.find(hql.toString());
		return list;
	}
	
	public Integer countmore(String state,int caid){
		StringBuffer hql=new StringBuffer("select count(*) from Article a ");
		if(!state.equals("3")){
			hql.append("where a.arstate=").append(state);
			if(caid!=0){
				hql.append(" and a.catalog.caid=").append(caid);
			}
		}else {
			if(caid!=0){
				hql.append("where a.catalog.caid=").append(caid);
			}
		}
		Long count = (Long) hibernateTemplate.find(hql.toString()).listIterator().next();
		return count.intValue();
	}
}
