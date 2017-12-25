package com.cy.bean;

public class Article {
	private int arid;
	private String arnumber;
	private String artitle;
	private String arcontent;
	private String aruser;
	private String artime;
	private String arstate;
	private int clicks;
	private Catalog catalog=new Catalog();
	
	public Catalog getCatalog() {
		return catalog;
	}
	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}
	public Article() {
		super();
	}
	public int getArid() {
		return arid;
	}
	public void setArid(int arid) {
		this.arid = arid;
	}
	public String getArnumber() {
		return arnumber;
	}
	public void setArnumber(String arnumber) {
		this.arnumber = arnumber;
	}
	public String getArtitle() {
		return artitle;
	}
	public void setArtitle(String artitle) {
		this.artitle = artitle;
	}
	public String getArcontent() {
		return arcontent;
	}
	public void setArcontent(String arcontent) {
		this.arcontent = arcontent;
	}
	public String getAruser() {
		return aruser;
	}
	public void setAruser(String aruser) {
		this.aruser = aruser;
	}
	public String getArtime() {
		return artime;
	}
	public void setArtime(String artime) {
		this.artime = artime;
	}
	public String getArstate() {
		return arstate;
	}
	public void setArstate(String arstate) {
		this.arstate = arstate;
	}
	public int getClicks() {
		return clicks;
	}
	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	@Override
	public String toString() {
		return "Article [arcontent=" + arcontent + ", arid=" + arid
				+ ", arnumber=" + arnumber + ", arstate=" + arstate
				+ ", artime=" + artime + ", artitle=" + artitle + ", aruser="
				+ aruser + ", clicks=" + clicks
				+ "]";
	}

	public Article(int arid, String canumber, String arnumber,
			String artitle, String arcontent, String aruser, String artime,
			String arstate) {
		super();
		this.arid = arid;
		this.arnumber = arnumber;
		this.artitle = artitle;
		this.arcontent = arcontent;
		this.aruser = aruser;
		this.artime = artime;
		this.arstate = arstate;
	}
}
