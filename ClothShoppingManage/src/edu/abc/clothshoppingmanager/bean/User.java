package edu.abc.clothshoppingmanager.bean;

public class User {
	
	private int id;
	private String name;
	private String pwd;
	private String img;
	private String tel;
	private int sex;
	private String introduce;
	private int vip;
	
	public User(int id, String name, String pwd, String img, String tel, int sex, String introduce, int vip) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.img = img;
		this.tel = tel;
		this.sex = sex;
		this.introduce = introduce;
		this.vip = vip;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", img=" + img + ", tel=" + tel + ", sex=" + sex
				+ ", introduce=" + introduce + ", vip=" + vip + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getVip() {
		return vip;
	}
	public void setVip(int vip) {
		this.vip = vip;
	}
	

}
