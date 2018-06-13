package edu.abc.clothshoppingmanager.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.json.JSONArray;
import org.json.JSONObject;


import edu.abc.clothshoppingmanager.bean.User;
import edu.abc.clothshoppingmanager.dao.UserDAO;
import edu.abc.clothshoppingmanager.dao.UserDAOImp;
import edu.abc.clothshoppingmanager.util.Responser;



public class UserAction  implements RequestAware{
	private UserDAO dao;
	private String name;
	private String pwd;
	private int page;
	private int rows;
	private User user;
	private String key;
	
	
	public String getKey() {
		return key;
	}


	public void setKey(String key) {
		this.key = key;
	}


	public UserAction() {
		dao=new UserDAOImp(); 
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

	/**
	 * 分页加载用户资料
	 */
	public void listUserByPage(){
		System.out.println("@@@"+rows+"\t"+page);
		ArrayList<User> users=dao.listUserByPage();
		System.out.println("查询到的用户："+users);
		JSONArray js=new JSONArray();
		for(User u:users)
		{
			try {
				JSONObject  j=new JSONObject();
				j.put("consumer_id", u.getId());
				j.put("consumer_name", u.getName());
				j.put("consumer_sex",(u.getSex()==0)?"男":"女");
				j.put("consumer_introduce", u.getIntroduce());
				j.put("consumer_pwd", u.getPwd());
				j.put("consumer_tel", u.getTel());
				j.put("consumer_vip", u.getVip());
				j.put("consumer_img", "<img src='"+u.getImg()+"' style='width:20px;height:20px' />");
				js.put(j);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(js.toString());
		try {
			Responser.responseToJson(ServletActionContext.getResponse(), ServletActionContext.getRequest(), js.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 根据id删除用户信息的方法
	 */
	public void deleteUserInfoByUserId() {
		System.out.println("进入删除方法");
		System.out.println(user.getId());
		boolean result=dao.delete(user.getId());
		System.out.println(user.getId());
		System.out.println("delete result:"+result);
		try {
			Responser.responseToJson(ServletActionContext.getResponse(), ServletActionContext.getRequest(), result+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
    public void searchByName() {
    	name=null;
    	System.out.println("后台"+key);
    	ArrayList<User> users=dao.searchUsersByName(key);
    	System.out.println(users);
    	JSONArray js=new JSONArray();
		for(User u:users)
		{
			try {
				JSONObject  j=new JSONObject();
				j.put("consumer_id", u.getId());
				j.put("consumer_name", u.getName());
				j.put("consumer_sex",(u.getSex()==0)?"男":"女");
				j.put("consumer_introduce", u.getIntroduce());
				j.put("consumer_pwd", u.getPwd());
				j.put("consumer_tel", u.getTel());
				j.put("consumer_vip", u.getVip());
				j.put("consumer_img", "<img src='"+u.getImg()+"' style='width:20px;height:20px' />");
				js.put(j);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(js.toString());
    	try {
			Responser.responseToJson(ServletActionContext.getResponse(), ServletActionContext.getRequest(), js.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
}
