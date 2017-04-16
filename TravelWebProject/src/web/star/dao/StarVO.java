package web.star.dao;
import web.star.dao.Month;

public class StarVO {
	private String maintitle;
	private String mainloc;
	private String fesdate;
	private String image;
	private int year;
	private int month;
	private int date;
	
	public int getYear() {
		return year;
	}
	public Month getMonth() {
		return Month.values()[month-1];
	}
	public int getDate(){
		return date;
	}
	public String getMaintitle() {
		return maintitle;
	}
	public void setMaintitle(String maintitle) {
		this.maintitle = maintitle;
	}
	public String getMainloc() {
		return mainloc;
	}
	public void setMainloc(String mainloc) {
		this.mainloc = mainloc;
	}
	public String getFesdate() {
		return fesdate;
	}
	public void setFesdate(String fesdate) {
		this.fesdate = fesdate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	/**
	 * date format yyyy.mm.dd ~ yyyy.mm.dd in String
	 * this method will return the last day of the festival which is
	 * yyyy.mm.dd(not this) ~ yyyy.mm.dd(this)
	 * @return the last day of the festival
	 */
	public void setDate(){
		String[] endDate = fesdate.split(" ~ ");

		endDate = endDate[1].split("\\.");
		
		this.year =	Integer.parseInt(endDate[0]);
		this.month = Integer.parseInt(endDate[1]);
		this.date = Integer.parseInt(endDate[2]);
	}
	public static void main(String[] args){
		StarVO vo = new StarVO();
		vo.setFesdate("2017.04.13 ~ 2017.05.10");
		vo.setDate();
		System.out.println("year: " + vo.getYear());
		System.out.println("month: " + vo.getMonth());
		System.out.println("date: " + vo.getDate());
	}
	
}
