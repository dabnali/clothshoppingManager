package edu.abc.clothshoppingmanager.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import edu.abc.clothshoppingmanager.bean.User;


public class UserDAOImp extends BaseDAOImp implements UserDAO{

	@Override
	//添加用户
	public boolean add(Object o) {
		User user=(User)o;
		boolean result=false;
		Statement sta=null;
		try{
			sta=getSta();
			int count=sta.executeUpdate("insert into  consumer(consumer_id,consumer_name,consumer_pwd)   values(null,'"+user.getName()+"','"+user.getPwd()+"')");
			result=(count>0)?true:false;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	@Override
	public boolean delete(Object id) {
		int  n=0;
		PreparedStatement sta=getPreSta("delete from  consumer where consumer_id=?");
		try {
			  sta.setInt(1, Integer.parseInt(id.toString()));
			  n=sta.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n>0?true:false;
	}

	@Override
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}


	public ArrayList<User> searchUsersByName(String name){
		/**
		 * 根据用户昵称查找
		 */
		System.out.println("进入条件搜索实现方法");
		String sql = "select *  from  consumer  where  1=1";
		if (name != null && !name.equals("")) {
			sql += "   and  consumer_name='" + name + "'";
		}
		System.out.println("条件查询:"+sql);
		ArrayList<User> users=new ArrayList<User>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery(sql);
			while(rs.next()) 
			{
				User g=new User();
				g.setId(rs.getInt("consumer_id"));
				g.setName(rs.getString("consumer_name"));
				g.setPwd(rs.getString("consumer_pwd"));
				g.setImg(rs.getString("consumer_img"));
				g.setTel(rs.getString("consumer_tel"));
				g.setSex(rs.getInt("consumer_sex"));
				g.setIntroduce(rs.getString("consumer_introduce"));
				g.setVip(rs.getInt("consumer_vip"));
				users.add(g);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disposeResource(getSta(),rs,getCon());
		}
		return users;
	}

	@Override
	public User getUserInfoByUserId(int id) {
		User  user=null;
		PreparedStatement  sta=null;
		ResultSet rs=null;
		try {
			sta=getPreSta("select *  from consumer where consumer_id=?");
			sta.setInt(1, id);
			rs=sta.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setId(rs.getInt("consumer_id"));
				user.setName(rs.getString("consumer_name"));
				user.setPwd(rs.getString("consumer_pwd"));
				if(rs.getString("consumer_img")!=null)
				{
					user.setId(rs.getInt("consumer_id"));
					user.setImg(rs.getString("consumer_img"));
					user.setIntroduce(rs.getString("consumer_introduce"));
					user.setName(rs.getString("consumer_name"));
					user.setPwd(rs.getString("consumer_pwd"));
					user.setSex(rs.getInt("consumer_sex"));
					user.setTel(rs.getString("consumer_tel"));
					user.setVip(rs.getInt("consumer_vip"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}



	@Override
	public ArrayList<User> listUserByPage() {
		ArrayList<User>  users=new ArrayList<>();
		PreparedStatement  sta=null;
		ResultSet rs=null;
		try {
			sta=getPreSta("select *  from consumer order by consumer_id asc");
			rs=sta.executeQuery();
			while(rs.next()) {
				User  user=new User();
				user.setId(rs.getInt("consumer_id"));
				user.setName(rs.getString("consumer_name"));
				user.setPwd(rs.getString("consumer_pwd"));
				if(rs.getString("consumer_img")!=null)
				{
					user.setId(rs.getInt("consumer_id"));
					user.setImg(rs.getString("consumer_img"));
					user.setIntroduce(rs.getString("consumer_introduce"));
					user.setName(rs.getString("consumer_name"));
					user.setPwd(rs.getString("consumer_pwd"));
					user.setSex(rs.getInt("consumer_sex"));
					user.setTel(rs.getString("consumer_tel"));
					user.setVip(rs.getInt("consumer_vip"));
				}
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		disposeResource(sta,	rs);
		return users;
	}


	

	@Override
	public int getAllCountOfUser() {
		int count=0;
		Statement  sta=null;
		ResultSet  rs=null;
		try {
			sta=getSta();
			  rs=sta.executeQuery("select  count(consumer_id)  from  consumer");
			rs.next();
			count=rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		disposeResource(sta, rs);
		return count;
	}

}
