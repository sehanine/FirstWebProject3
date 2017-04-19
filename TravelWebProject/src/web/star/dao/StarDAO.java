package web.star.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StarDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.230:1521:ORCL";
	
	/**
	 * 쿼리문 템플릿
	  	try{
				getConnection();
				String sql = "INSERT QUERY";
				ps = conn.prepareStatement(sql);
				ps.setString(parameterIndex, x);
				ResultSet rs = ps.executeQuery();
				rs.next();
				//TODO
				ps.close();
		
			}catch(Exception ex){
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}finally{
				disConnection();
			}
		
	 */
	public StarDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	}
	public void disConnection(){
		try{
			if(ps != null){
				ps.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//오라클 연결
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, "scott", "tiger");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public int getReplyCount(int fesno){
		int count = 0;
		try{
			getConnection();
			String sql="SELECT COUNT(*) FROM project_reply WHERE fesno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fesno);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		}catch(Exception ex){
			System.out.println("getReplyCount() " + ex.getMessage());
		}finally{
			disConnection();
		}
		return count;
	}
	public void setStar(int fesno, String email){
		try{
			getConnection();
			String sql = "INSERT INTO star_table(fesno, email) "
						+ "VALUES(?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fesno);
			ps.setString(2, email);
			ps.executeUpdate();
			ps.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
	
	public void unStar(int fesno, String email){
		try{
			getConnection();
			String sql = "DELETE FROM star_table "
						+ "WHERE fesno = ? AND email = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fesno);
			ps.setString(2, email);
			ps.executeUpdate();
			ps.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
	public String isStarred(int fesno, String email){
		String res = "";
		try{
			getConnection();
			String sql = "SELECT count(*) FROM star_table where fesno=? AND email=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fesno);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			rs.next();
			res = rs.getString(1);
			
			System.out.println("StarDAO.isStarred called by content.jsp " + res);
			if(res.equals("1")){
				res = "checked";
			} else {
				res = "unchecked";
			}
			ps.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
		return res;
	}
	public List<StarVO> getAllData(String email){
		List<StarVO> list = new ArrayList<>();
		try{
			getConnection();
			String sql = "SELECT fesno FROM star_table WHERE email='" + email + "'"
					+ " ORDER BY fesno ASC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<Integer> fesList = new ArrayList<>();
			
			while(rs.next()){
				fesList.add(rs.getInt(1));
			}
		/* test only	
			for(int x: fesList){
				System.out.println("StarDAO.getAllData() fesno: " + x);
			}
		 */
			
			sql = "SELECT maintitle, mainloc, fesdate, image "
				+ "FROM vk_main, (SELECT image FROM vk_image_list "
                + "WHERE rownum = 1 AND fesno=?) "
                + "WHERE fesno=?";
			ps = conn.prepareStatement(sql);
			for(int fesno_: fesList){
				ps.setInt(1, fesno_);
				ps.setInt(2, fesno_);
				rs = ps.executeQuery();
				StarVO vo = new StarVO();
				
				while(rs.next()){
					vo.setFesno(fesno_);
					vo.setMaintitle(rs.getString(1));
					vo.setMainloc(rs.getString(2));
					vo.setFesdate(rs.getString(3));
					vo.setDate();
					vo.setImage(rs.getString(4));
					list.add(vo);
				}
				
			}
			//  test use only
			/*
			for(StarVO vo: list){
				System.out.println("StarDAO.getAllData()");
				System.out.println("mainTitle: " + vo.getMaintitle());
				System.out.println("Image: " + vo.getImage());
				System.out.println("fesdate: " + vo.getFesdate());
				System.out.println("mainloc: " + vo.getMainloc());
			}
			*/
			// test use only
			ps.close();
	
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{
			disConnection();
		}
		return list;
		
	}
	public static void main(String[] args){
		new StarDAO().getAllData("aa@naver.com");
	}
}
