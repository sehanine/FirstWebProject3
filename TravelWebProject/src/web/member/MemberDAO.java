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
	/**
	 * 
	 * @param id ã���� �ϴ� ��
	 * @param target select condition
	 * @param target2 where condition
	 * @return string value
	 * int nick = dao.getValue(pk, "nickname", "email")
	 * int string = dao.getValue(kkc@naver.com, "pwd", "email")
	 */
	public String getValue(String id, String target, String target2){
		String str = null;
		
		try{ 
			getConnection();
			String sql= "SELECT "+ target + " FROM festigo_member "
				   +"WHERE " + target2 + "=?";
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
	
	/**
	 * 
	 * @param id (email, pwd, nickname, is_login)�� ������
	 * id = "aa@naver.com" || "mintah@naver.com" ...
	 * @param target colum_id ('email', 'pwd', 'nickname', 'is_login')
	 * target = "email" || "pwd" || "nickname" ||
	 * @return 
	 */
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
	public void update(MemberVO vo){
		
		try{
			getConnection();
			String sql = "UPDATE festigo_member "
					+ "SET nickname=?, img=?, comment_=? "
					+ "WHERE email=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getNickname());
			ps.setString(2, vo.getImg());
			ps.setString(3, vo.getComment());
			ps.setString(4, vo.getEmail());
			ps.executeUpdate();
			
			//TODO
			ps.close();
	
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
	/**
	 * @param vo MemberVO
	 * ȸ�� ���Խ� �ű�ȸ���� �����ͺ��̽��� ����
	 */
	public void joinMember(MemberVO vo){
		String sql = 
				"INSERT INTO festigo_member(email, nickname, pwd) "
			    +"VALUES(?, ?, ?)";
		
		try{
			getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getNickname());
			ps.setString(3, vo.getPwd());
			ps.executeUpdate();
			//System.out.println("ȸ������ �Ϸ�");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
	public int iSLogin(String email, String pwd){
		int result = 0;
		
		try{
			/*
			 * check id if exists.
			 * 1. not available
			 * 0. avail
				SELECT COUNT(*) FROM member
				WHERE id=?;
			 */
			getConnection();
			String sql = "SELECT COUNT(*) FROM festigo_member WHERE email=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			if(count == 0){ // ID (X)
				result = 0;
			} else{ // ID(O)
				/*
					SELECT pwd FROM member
					WHERE id = 'jung';
				*/
				sql = "SELECT pwd FROM festigo_member WHERE email=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				rs = ps.executeQuery();
				rs.next();
				String db_pwd = rs.getString(1);
				rs.close();
				
				if(db_pwd.equals(pwd)){
					result = 2;
				} else {
					result = 1;
				}
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		} finally{
			disConnection();
		}
		return result;
	}
	
	/**
	 * �ߺ� �α��� ���� ���
	 * ��� ���� -----------------------------------------------------
	 * @param vo MemberVO
	 * @param status 0 �α׾ƿ� 1 �α��� (boolean �ƴ�)
	 * Ȩ������ �α��ν� ������ �α��� �Ǿ��ִ��� Ȯ����
	 * 
	 */
	public void login(MemberVO vo, int status){
		try{
			getConnection();
			String sql = 
				   "UPDATE festigo_member SET is_login =" 
				   + status + " WHERE email=?";
				
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ResultSet rs = ps.executeQuery();
			rs.next();
			ps.close();
	
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
	/**
	 * 
	 * @param args
	 * �Ϻ� ����� �۵��ϴ��� ���������� �����Ҷ��� ���
	 */
	public static void main(String[] args){
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setEmail("aa@naver.com");
		vo.setNickname("������");
		vo.setPwd("1234");
		dao.login(vo, 0);
		System.out.println("done");
	}
}
