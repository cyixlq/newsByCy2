package com.cy.bean;

import java.util.HashSet;
import java.util.Set;

public class Catalog {
	private Integer caid;
	private String caname;
	private String castate;
	private Set<Article> setArticle=new HashSet<Article>();
	
	public Set getSetArticle() {
		return setArticle;
	}
	public void setSetArticle(Set setArticle) {
		this.setArticle = setArticle;
	}
	public Catalog() {
		super();
	}
	public Integer getCaid() {
		return caid;
	}
	public void setCaid(int caid) {
		this.caid = caid;
	}
	public String getCaname() {
		return caname;
	}
	public void setCaname(String caname) {
		this.caname = caname;
	}
	public String getCastate() {
		return castate;
	}
	public void setCastate(String castate) {
		this.castate = castate;
	}
	@Override
	public String toString() {
		return "Catalog [caid=" + caid + ", caname=" + caname +", castate=" + castate + "]";
	}
	
}
