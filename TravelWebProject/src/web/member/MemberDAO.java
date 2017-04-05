package web.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.230:1521:ORCL";
	//private static DataDAO dao;
	/**
	 * ������ ���ø�
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
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	 */
	public MemberDAO(){
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
	
	//����Ŭ ����
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, "scott", "tiger");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	/**
	 * 
	 * @param id (���Ϸ��� ��
	 * @param target üũ�� �÷� ��� (email, nickname)
	 * @return
	 */
	public int isValueExist(String id, String target){
		int count = 0;
		
		try{
			getConnection();
			String sql= "SELECT COUNT(*) FROM festigo_member "
				   +"WHERE " +target + "=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			
		} catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally{
			disConnection();
		}
		return count;
	}
	
	public String getValue(String id, String target){
		String str = null;
		
		try{
			getConnection();
			String sql= "SELECT "+ target + " FROM festigo_member "
				   +"WHERE " + target + "=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			str =rs.getString(1);
			rs.close();
			
		} catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally{
			disConnection();
		}
		return str;
	}
	public void joinMember(MemberVO vo){
		String sql = 
				"INSERT INTO festigo_member(email, nickname, pwd) "
			    +"VALUES(?, ?, ?)";
		
		try{
			getConnection();
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getNickname());
			ps.setString(3, vo.getPwd());
			ps.executeUpdate();
	
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
}
