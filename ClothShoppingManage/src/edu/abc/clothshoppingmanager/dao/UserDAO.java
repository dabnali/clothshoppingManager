package edu.abc.clothshoppingmanager.dao;

import java.util.ArrayList;

import edu.abc.clothshoppingmanager.bean.User;


public interface UserDAO extends BaseDAO{
	
	public  User getUserInfoByUserId(int id);
	public ArrayList<User>  listUserByPage();
	public int  getAllCountOfUser();
	public ArrayList<User>  searchUsersByName(String name);

}
