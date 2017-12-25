package com.cy.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest req=ServletActionContext.getRequest();
		Object obj=req.getSession().getAttribute("isLogin");
		if(obj!=null){
			return arg0.invoke();
		}
		return "login_fail";
	}

}
