package com.sist.reply;

import java.sql.*;
import java.util.*;


public class ReplyDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.230:1521:ORCL";
	private static ReplyDAO dao;

	//드라이버 등록
	public ReplyDAO(){
//		try{
//			dropAll();
//		}catch(Exception e){
//			System.out.println("drop table");
//		}
//		
//		try{
//			initAll();
//		}catch(Exception e){
//			System.out.println("init table");
//		}
		try{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//싱글턴
	public static ReplyDAO newInstance(){
		if(dao==null)
			dao=new ReplyDAO();
		return dao;
	}
	
	
	
	//오라클 해제
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
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
	
	//기능처리-리스트
	public ArrayList<ReplyVO> replyListData(int fesno){
		ArrayList<ReplyVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT fesno,reply_ID,reply_name,reply_pass,reply_regdate,reply_comment "
					+"FROM project_reply "
					+"WHERE fesno=? "
					+"ORDER BY fesno ASC,reply_ID ASC";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fesno);
			ResultSet rs=ps.executeQuery();
			

			while(rs.next()){
					ReplyVO vo=new ReplyVO();
					vo.setFesno(rs.getInt(1));
					vo.setReply_ID(rs.getInt(2));
					vo.setReply_name(rs.getString(3));
					vo.setReply_pass(rs.getString(4));
					vo.setReply_regdate(rs.getDate(5));
					vo.setReply_comment(rs.getString(6));
					list.add(vo);
			}
			
			ps.close();
			
		}catch(Exception ex){
			System.out.println("replyListData()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		
		return list;
	}
	
	//insert
	public void replyInsert(ReplyVO vo){
		try{
			getConnection();
			String sql="INSERT INTO project_reply(fesno,reply_ID,reply_name,reply_pass,reply_comment) "
						+"VALUES (?,seq_re_no.nextval,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getFesno());
			ps.setString(2, vo.getReply_name());
			ps.setString(3, vo.getReply_pass());
			ps.setString(4, vo.getReply_comment());
			
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("replyInsert()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
	}
	
	//delete
	public void replyDelete(int reply_ID){
		try{
			getConnection();
			String sql="DELETE FROM project_reply "
						+"WHERE reply_ID=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, reply_ID);
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("replyInsert()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
	}
	public void dropAll(){
		try{
			getConnection();
			String[] sql = {
					"DROP TABLE project_reply CASCADE CONSTRAINTS",
					"DROP SEQUENCE seq_re_no"
			};
			for(int i = 0; i < sql.length; i++){
				ps=conn.prepareStatement(sql[i]);
				ps.executeUpdate();
			}
		} catch(Exception ex){
			ex.printStackTrace();
		} finally{
			disConnection();
		}
	}
	public void initAll(){
		String[] sql = {
				"CREATE TABLE project_reply( "
				+ "fesno NUMBER NOT NULL ,"
				+ "reply_ID NUMBER NOT NULL,"
				+ "reply_name VARCHAR2(20),"
				+ "reply_pass VARCHAR2(20),"
				+ "reply_regdate DATE  DEFAULT sysdate,"
				+ "reply_comment CLOB)",
				
				"CREATE SEQUENCE seq_re_no "
				+ "START WITH 0 "
				+ "INCREMENT BY 1 "
				+ "NOCACHE "
				+ "NOCYCLE "
				+ "MINVALUE 0 "
		};
		
		try{
			getConnection();
			for(int i = 0; i < sql.length; i++){
				ps=conn.prepareStatement(sql[i]);
				ps.executeUpdate();
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
	public static void main(String[] args) {
		
		ReplyDAO dao=new ReplyDAO();
		ArrayList<ReplyVO> list=dao.replyListData(1);
		ReplyVO vo = new ReplyVO();
		vo.setFesno(1);
		vo.setReply_name("김경철");
		vo.setReply_pass("1234");
		vo.setReply_comment("암튼 가지마셈");
		dao.replyInsert(vo);
		
	}
	
	
}
