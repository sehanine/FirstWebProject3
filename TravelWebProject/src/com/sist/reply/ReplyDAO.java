package com.sist.reply;

import java.sql.*;
import java.util.*;


public class ReplyDAO {

	private Connection conn;
	private PreparedStatement ps;

	private final String URL="jdbc:oracle:thin:@211.238.142.230:1521:ORCL";
	private PreparedStatement ps2;
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
	public ReplyVO getData(int replyId){
		ReplyVO vo = new ReplyVO();
		try{
			getConnection();
			String sql="SELECT * FROM project_reply WHERE reply_id = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, replyId);
			ResultSet rs=ps.executeQuery();
			//fesno,reply_ID,reply_name,reply_pass, reply_regdate, reply_comment, email
			rs.next();
					
			vo.setFesno(rs.getInt(1));
			vo.setReply_ID(rs.getInt(2));
			vo.setReply_name(rs.getString(3));
			vo.setReply_pass(rs.getString(4));
			vo.setReply_regdate(rs.getDate(5));
			vo.setReply_comment(rs.getString(6));
			vo.setEmail(rs.getString(7));
			ps.close();	
		}catch(Exception ex){
			System.out.println("replyListData()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return vo;
	}
	//기능처리-리스트
	public ArrayList<ReplyVO> replyListData(int fesno){
		ArrayList<ReplyVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT fesno,reply_ID,reply_name,reply_pass,reply_regdate,reply_comment,email "
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
					vo.setEmail(rs.getString(7));
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
			String sql="INSERT INTO project_reply(fesno,reply_ID,reply_name,reply_pass,reply_comment,email) "
						+"VALUES (?,seq_re_no.nextval,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getFesno());
			ps.setString(2, vo.getReply_name());
			ps.setString(3, vo.getReply_pass());
			ps.setString(4, vo.getReply_comment());
			ps.setString(5, vo.getEmail());
			
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("replyInsert()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
	}
	/**
	 * mypage 리플 관리에서 사용하는 함수
	 * @param replyid
	 */
	public void deleteReply(int replyId){
		try{
			getConnection();
			String sql="DELETE FROM project_reply WHERE reply_id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, replyId);
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("deleteReply()"+ex.getMessage());
		}finally{
			disConnection();
		}
	}
	//delete
	public void replyDelete(int fesno,int idx){
		try{
			getConnection();
			String sql="SELECT reply_ID FROM (SELECT project_reply.*,row_number() "
					+ "OVER(ORDER BY reply_ID ASC) RN FROM project_reply WHERE fesno=? "
					+ ")WHERE RN=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fesno);
			ps.setInt(2, idx);
			ResultSet rs=ps.executeQuery();
			String id="";
			while(rs.next()){
				id=rs.getString(1);
			}
			System.out.println("replyDAO.replyDelete called by delete_ok " + id);
			String sql2="DELETE FROM project_reply WHERE reply_ID=?";
			ps2=conn.prepareStatement(sql2);
			ps2.setString(1, id);
			
			ps2.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("replyDelete()"+ex.getMessage());
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

	
	//삭제시 비밀번호 확인
	/**
	 * 
	 * @param fesno
	 * @param idx nth 댓글 in contents reply
	 * @param pass
	 * @return
	 */
	public boolean replyPassCheck(int fesno,int idx,String pass){
		boolean check=false;
		try{
			getConnection();
			String sql="SELECT reply_pass FROM (SELECT project_reply.*,row_number() "
					+ "OVER(ORDER BY reply_ID ASC) RN FROM project_reply WHERE fesno=? "
					+ ")WHERE RN=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fesno);
			ps.setInt(2, idx); //nth 번째 댓글 
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				if(pass.equals(rs.getString(1))){
					check=true;
				}
				
			}
			
		}catch(Exception ex){
			System.out.println("replyPassCheck()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return check;
	}
	
	//email로 내용 가져오기
	public ArrayList<ReplyVO> emailListData(String email){
		ArrayList<ReplyVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT project_reply.fesno,reply_ID,reply_name,reply_pass,reply_regdate,reply_comment,email,VK_MAIN.MAINTITLE "
					+"FROM project_reply,VK_MAIN "
					+"WHERE PROJECT_REPLY.FESNO=VK_MAIN.FESNO AND PROJECT_REPLY.email=? "
					+"ORDER BY reply_regdate DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			

			while(rs.next()){
					ReplyVO vo=new ReplyVO();
					vo.setFesno(rs.getInt(1));
					vo.setReply_ID(rs.getInt(2));
					vo.setReply_name(rs.getString(3));
					vo.setReply_pass(rs.getString(4));
					vo.setReply_regdate(rs.getDate(5));
					vo.setReply_comment(rs.getString(6));
					vo.setEmail(rs.getString(7));
					vo.setTitle(rs.getString(8));
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

	public static void main(String[] args) {
		
		ReplyDAO dao=new ReplyDAO();
		
	}
	
	
}
