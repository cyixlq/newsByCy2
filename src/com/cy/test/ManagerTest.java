package com.cy.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;

import com.cy.bean.Manager;
import com.cy.utils.HibernateUtils;

public class ManagerTest {
	
	@Test
	public void testInsert(){
		SessionFactory sessionFactory=HibernateUtils.getSessionFactory();
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		Manager manager=new Manager();
		manager.setManagername("“∂Ω£÷“");
		manager.setPasswd("112233");
		manager.setMstate("1");
		session.save(manager);
		tx.commit();
		session.close();
		sessionFactory.close();
	}
	
	@Test
	public void testDelete(){
		SessionFactory sessionFactory=HibernateUtils.getSessionFactory();
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		Manager manager=(Manager) session.get(Manager.class, 2);
		session.delete(manager);
		tx.commit();
		session.close();
		sessionFactory.close();
	}
}
