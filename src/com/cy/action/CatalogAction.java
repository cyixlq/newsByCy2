package com.cy.action;

import java.util.List;

import com.cy.bean.Catalog;
import com.cy.dao.CatalogDAO;

public class CatalogAction {
	private Catalog catalog;
	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}
	private CatalogDAO catalogDAO;
	public void setCatalogDAO(CatalogDAO catalogDAO) {
		this.catalogDAO = catalogDAO;
	}
	
	private List<Catalog> list;
	
	public String findall(){
		list=catalogDAO.findall();
		return "findall";
	}
	public String findbyid(){
		catalog=catalogDAO.findbyid(catalog.getCaid());
		return "edit_catalog";
	}
	public String update(){
		if(catalogDAO.update(catalog)){
			return "findall_catalog";
		}
		return "edit_catalog";
	}
	public String edit(){
		if(catalog.getCaid()==null){
			return add();
		}
		return update();
	}
	public String add(){
		if(catalogDAO.add(catalog)){
			return "findall_catalog";
		}
		return "edit_catalog";
	}
	public String delete(){
		catalogDAO.del(catalog.getCaid());
		return "findall_catalog";
	}
	
	public Catalog getCatalog() {
		return catalog;
	}
	public List<Catalog> getList() {
		return list;
	}
}
