package board.dao;

import java.util.*;

import java.sql.*;

public class TeamDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.230:1521:ORCL";
	private static TeamDAO dao;
	
	//드라이버 등록
	public TeamDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//싱글턴
	public static TeamDAO newInstance(){
		if(dao==null)
			dao=new TeamDAO();
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
	public List<TeamVO> boardListData(int page){
		ArrayList<TeamVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT no,subject,name,regdate,hit,group_tab "
					+"FROM festigo_board "
					+"ORDER BY group_id DESC,group_step ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			int i=0;
			int j=0;
			int pagecnt=(page*10)-10;
			
			while(rs.next()){
				if(i<10 && j>=pagecnt){
					TeamVO vo=new TeamVO();
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setRegdate(rs.getDate(4));
					vo.setHit(rs.getInt(5));
					vo.setGroup_tab(rs.getInt(6));
					list.add(vo);
					i++;
				}
				j++;
			}
			
			
		}catch(Exception ex){
			System.out.println("boardListData()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		
		return list;
	}
	
	public int boardTotalPage(){
		int total=0;
		
		try{
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10) FROM replyBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		}catch(Exception ex){
			System.out.println("boardTotalPage()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	//전체 게시글 갯수
	public int boardRowCount(){
		int total=0;
		
		try{
			getConnection();
			String sql="SELECT COUNT(*) FROM replyBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();	
			
		}catch(Exception ex){
			System.out.println("boardRowCount()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	public int boardFindCount(String fs,String ss){
		int count=0;
		try{
			getConnection();
			String sql="SELECT COUNT(*) "
					+"FROM festigo_board "
					+"WHERE "+fs+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
		return count;
	}
	
	public List<TeamVO> boardFindData(String fs, String ss){
		List<TeamVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT no,subject,name,regdate,hit,group_tab "
					+"FROM festigo_board "
					+"WHERE "+fs+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				TeamVO vo=new TeamVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex){
			System.out.println("boardFindData"+ex.getMessage());
		}finally{
			disConnection();
		}
		return list;
	}
	
	/*
	 * 	
	 */
	//내용보기
	public TeamVO boardContent(int no,int type){
		TeamVO vo=new TeamVO();
		
		try{
			getConnection();
			String sql="";
			if(type==1){
				sql="UPDATE festigo_board SET "
						+"hit=hit+1 "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				ps.close();
			}
			
			sql="SELECT no,name,email,subject,content,regdate,hit "
					+"FROM festigo_board "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setEmail(rs.getString(3));
			vo.setSubject(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setRegdate(rs.getDate(6));
			vo.setHit(rs.getInt(7));
			rs.close();		
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
			
		return vo;
	}
	//SEQUENCE INSERT,UPDATE,SELECT
	public void boardReply(int pno,TeamVO vo){
		try{
			getConnection();
			String sql="SELECT group_id,group_step,group_tab "
					+"FROM festigo_board "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int gi=rs.getInt(1);
			int gs=rs.getInt(2);
			int gt=rs.getInt(3);
			rs.close();
			ps.close();
			//답변의 핵심쿼리
			sql="UPDATE festigo_board SET "
					+"group_step=group_step+1 "
					+"WHERE group_id=? AND group_step>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			ps.close();
			
			//추가
			sql="INSERT INTO festigo_board(no,name,email,subject,content,pwd,group_id,group_step,group_tab,root) "
					+"VALUES(rb_no_seq.nextval,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getPwd());
			ps.setInt(6, gi);
			ps.setInt(7, gs+1);
			ps.setInt(8, gt+1);
			ps.setInt(9, pno);
			ps.executeUpdate();
			ps.close();
			//depth=depth+1
			sql="UPDATE festigo_board SET "
					+"depth=depth+1 "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("boardReply()"+ex.getMessage());
		}finally{
			disConnection();
		}
	}
	public boolean boardDelete(int no,String pwd){
		boolean bCheck=false;
		
		try{     /////ㅗㅗㅗ
			getConnection();
			String sql="SELECT pwd FROM festigo_board "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			ps.close();
			
			if(db_pwd.equals(pwd)){
				bCheck=true;
				sql="DELETE FROM festigo_board "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}else{
				bCheck=false;
			}		
			
		}catch(Exception ex){
			System.out.println("boardDelete()"+ex.getMessage());
		
		}finally{
			disConnection();
		}
		
		return bCheck;
	}
		public TeamVO boardUpdateData(int no){
			TeamVO vo=new TeamVO();
			
			try{
				getConnection();
				String sql="SELECT * FROM festigo_board "
						+"WHERE no=?";
						
						
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				
				ResultSet rs=ps.executeQuery();
				rs.next();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setSubject(rs.getString(4));
				vo.setContent(rs.getString(5));
				vo.setPwd(rs.getString(6));
				vo.setRegdate(rs.getDate(7));
				vo.setHit(rs.getInt(8));
				rs.close();
				
			}catch(Exception ex){
				System.out.println(ex.getMessage());
			}finally{
				disConnection();
			}
			
			return vo;
		}
		//4-2. 수정하기
		public boolean boardUpdate(TeamVO vo){
			boolean bCheck=false;
			
			try{
				System.out.println("업데이트 메서드 in");
				getConnection();
				String sql="SELECT pwd FROM festigo_board "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, vo.getNo());
				
				ResultSet rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				rs.close();
				ps.close();
				
				if(db_pwd.equals(vo.getPwd())){
					System.out.println("비밀번호 맞다능 ㅎㅎ teamDAO().boardUpdate");
					bCheck=true;
					sql="UPDATE festigo_board SET "
						+"name=?,email=?,"
						+"subject=?,content=? "
						+"WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, vo.getName());
					ps.setString(2, vo.getEmail());
					ps.setString(3, vo.getSubject());
					ps.setString(4, vo.getContent());
					ps.setInt(5, vo.getNo());
					ps.executeUpdate();
				}else{
					bCheck=false;
				}
				
			}catch(Exception ex){
				System.out.println("boardUpdate()"+ex.getMessage());
			}finally{
				disConnection();
			}
			return bCheck;
		}
		public void boardInsert(TeamVO vo){
			try{
				getConnection();
				String sql="INSERT INTO festigo_board(no,name,email,subject,content,pwd) "
						+"VALUES((SELECT NVL(MAX(no)+1,1) FROM festigo_board),?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getEmail());
				ps.setString(3, vo.getSubject());
				ps.setString(4, vo.getContent());
				ps.setString(5, vo.getPwd());
				ps.executeUpdate();
				
			}catch(Exception ex){
				System.out.println("boardInsert()"+ex.getMessage());
			}finally{
				disConnection();
	}
		}
		
		//공지사항
		public List<TeamVO> boardGongjiData(){
			ArrayList<TeamVO> list=new ArrayList<>();
			
			try{
				getConnection();
				String sql="SELECT no,subject,name,regdate,hit,group_tab "
						+"FROM festigo_board "
						+"WHERE SUBJECT LIKE '[공지사항]%' "
						+"ORDER BY no DESC";
				ps=conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				
				while(rs.next()){
						TeamVO vo=new TeamVO();
						vo.setNo(rs.getInt(1));
						vo.setSubject(rs.getString(2));
						vo.setName(rs.getString(3));
						vo.setRegdate(rs.getDate(4));
						vo.setHit(rs.getInt(5));
						vo.setGroup_tab(rs.getInt(6));
						list.add(vo);
						
					}
				
			}catch(Exception ex){
				System.out.println("boardGongjiData()"+ex.getMessage());
			}finally{
				disConnection();
			}
			
			
			return list;
		}
		
		
}







