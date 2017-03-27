package vk.dao;

import java.util.ArrayList;

public class VisitKoreaVO {
	
	public VisitKoreaVO(){
		image_list = new ArrayList<>();
		summary = new ArrayList<>();
		instruction = new ArrayList<>();
	}
	//���� ȭ��
	/**
	 * fesNo
	 * ��� ��ȣ
	 */
	private int fesNo;
	/**
	 * title
	 * ��� �̸�
	 */
	private String title;
	/**
	 * contentShort
	 * ª�� ���Ұ� ���� ��������
	 */
	private String contentShort;
	/**
	 * contentLong
	 * ���� ������ ���Ұ� full content
	 */
	private String contentLong;
	/**
	 * mainLoc
	 * ��� ���� i.e. ��⵵ ���� 
	 */
	private String mainLoc;
	/**
	 * locDetail
	 * ����� full address
	 */
	private String locAddr;
	/**
	 * url
	 * ������� ������ url
	 */
	private String url;
	//���� ȭ��
	/**
	 * notice
	 * ��������
	 */
	private String notice;
	/**
	 * date
	 * ����Ⱓ/ ���Ⱓ
	 */
	private String date; // ���� �Ⱓ ���Ⱓ
	
	/**
	 * addr 
	 * �������� �ּ�
	 */
	private String addr; // ������
	/**
	 * loc
	 * ������ url ���Ե� ����Ʈ ����
	 */
	private String loc; // location
	/**
	 * tel 
	 * ����ó
	 */
	private String tel;
	/**
	 * homepage 
	 * Ȩ������
	 */
	private String homepage;
	
	/**
	 * image_list
	 * ���� ����� ����
	 * arraylist (String) Ÿ��
	 */
	private ArrayList<String> image_list;

	/**
	 * summary
	 * ����
		���Ұ�
		��系��
		���α׷� 
		�δ���� 
		����������
	 */
	private ArrayList<String> summary;
	/**
	 * instruction
	 * �̿�ȳ�
		�����ð� -����ð�
			-��ð�
		�����ҿ�ð� 
		�������ɿ��� 
		�̿��� 
		���
		��������
	 */
	private ArrayList<String> instruction;
	
	public ArrayList<String> getInstruction() {
		return instruction;
	}
	public void setInstruction(ArrayList<String> usefultip) {
		this.instruction = usefultip;
	}
	public ArrayList<String> getSummary() {
		return summary;
	}
	public void setSummary(ArrayList<String> summary) {
		this.summary = summary;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public ArrayList<String> getImage_list() {
		return image_list;
	}
	public void setImage_list(ArrayList<String> image_list) {
		this.image_list = image_list;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentShort() {
		return contentShort;
	}
	public void setContentShort(String content) {
		this.contentShort = content;
	}
	public String getMainLoc() {
		return mainLoc;
	}
	public void setMainLoc(String mainLoc) {
		this.mainLoc = mainLoc;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContentLong() {
		return contentLong;
	}
	public void setContentLong(String contentLong) {
		this.contentLong = contentLong;
	}
	public String getLocAddr() {
		return locAddr;
	}
	public void setLocAddr(String locAddr) {
		this.locAddr = locAddr;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	public int getFesNo() {
		return fesNo;
	}
	public void setFesNo(int fesNo) {
		this.fesNo = fesNo;
	}

	
	
}
