package kr.ac.kopo;

public class UserInfo {
	private String name;
	private String code;
	private String date;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public UserInfo(String name, String code, String date) {
		super();
		this.name = name;
		this.code = code;
		this.date = date;
	}
	
	
}
