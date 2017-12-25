package com.cy.action;

import java.util.ArrayList;
import java.util.List;

import com.cy.bean.Article;
import com.cy.bean.Catalog;
import com.cy.dao.ArticleDAO;
import com.cy.dao.CatalogDAO;
import com.cy.dao.DelHTMLTag;

public class IndexAction {
	private Article article;
	public void setArticle(Article article) {
		this.article = article;
	}
	private ArticleDAO articleDAO;
	public void setArticleDAO(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}
	private CatalogDAO catalogDAO;
	public void setCatalogDAO(CatalogDAO catalogDAO) {
		this.catalogDAO = catalogDAO;
	}
	
	
	private List<Catalog> calist;
	private List<Article> arlist=new ArrayList<Article>();
	private int nowpage,pagecount;
	private String isFirst="false";

	public String findall(){
		int max=3;//һҳ��ʾ��������
        //����ǰҳ�������������ݺ�û�����ݵ����
        if(nowpage==0){
        	nowpage=1;
        }
        //����ǰ��Ҫ��ҳ��ѯ״̬��ֻ��ѯ���ã�����״ֵ̬Ӧ��Ϊ1
        article.setArstate("3");
        //����ǰ��Ҫ��ҳ��ѯ�ĸ���Ŀ�����Ϊnull��0��ʾȫ��
        if(article.getCatalog().getCaid()==null){
        	article.getCatalog().setCaid(0);
        }
        calist=catalogDAO.findall();
        arlist=articleDAO.findbymore(nowpage, max, article.getArstate(), article.getCatalog().getCaid());
        for(Article article:arlist){
        	//�������³��� �����ʾ15��
	    	String content=DelHTMLTag.delHTMLTag(article.getArcontent());
	    	int len=content.length();
	    	if(len>=15){
	    		len=15;
	    		article.setArcontent(content.substring(0, len)+"......");
	    	}
	    	else
	    		article.setArcontent(content.substring(0, len));
        }
    	//ͨ����¼���������������ҳ��
    	int count=articleDAO.countmore(article.getArstate(), article.getCatalog().getCaid());
    	pagecount=count/max;
    	if(count%max>0){
    		pagecount++;
    	}
        return "findall";
	}
	public String findbyid(){
    	article=articleDAO.findbyarid(article.getArid());
    	return "article";
	}
	
	
	
	public String getIsFirst() {
		return isFirst;
	}
	public void setIsFirst(String isFirst) {
		this.isFirst = isFirst;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public Article getArticle() {
		return article;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public List<Catalog> getCalist() {
		return calist;
	}
	public void setCalist(List<Catalog> calist) {
		this.calist = calist;
	}
	public List<Article> getArlist() {
		return arlist;
	}
	public void setArlist(List<Article> arlist) {
		this.arlist = arlist;
	}
	
}
