package com.cy.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;

import com.cy.bean.Article;
import com.cy.bean.Catalog;
import com.cy.utils.HibernateUtils;

public class ArticleActionTest {
	@Test
	public void testSelectCatalog(){
		SessionFactory sessionFactory=null;
		Session session=null;
		Transaction t=null;
		try{
			sessionFactory=HibernateUtils.getSessionFactory();
			session=sessionFactory.openSession();
			t=session.beginTransaction();
			Article a=(Article) session.get(Article.class, 1);
			Catalog catalog=a.getCatalog();
			System.out.println(catalog);
			t.commit();
		}catch(Exception e){
			e.printStackTrace();
			t.rollback();
		}
	}
}
