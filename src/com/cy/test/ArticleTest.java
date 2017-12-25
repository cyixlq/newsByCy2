package com.cy.test;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.cy.bean.Article;
import com.cy.bean.Catalog;
import com.cy.utils.HibernateUtils;

public class ArticleTest {
	
	@Test
	public void oneToManyTestInsert(){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Catalog c=new Catalog();
		c.setCaname("”È¿÷");
		c.setCastate("1");
		Article article=new Article();
		article.setArtitle("±ÍÃ‚≤‚ ‘");
		article.setArcontent("ƒ⁄»›≤‚ ‘£°666");
		article.setArnumber("1");
		article.setArtime("2015-06-06");
		article.setAruser("cy");
		article.setClicks(10);
		article.setArstate("1");
		c.getSetArticle().add(article);
		article.setCatalog(c);
		session.save(c);
		tx.commit();
	}
}
