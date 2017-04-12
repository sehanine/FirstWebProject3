package web.member;

import com.google.gson.Gson;

public class GsonPrac {
	public GsonPrac(){
		MemberVO vo = new MemberVO();
		vo.setEmail("mymintah@hotmail.com");
		vo.setNickname("½Å¸í´ö");
		vo.setPwd("1234");
		Gson gson = new Gson();
		String str = gson.toJson(vo);
		System.out.println(str);
		MemberVO vo_ = gson.fromJson(str, MemberVO.class);
		System.out.println(vo_.getEmail());
		System.out.println(vo_.getNickname());
		System.out.println(vo_.getPwd());
	}
	public static void main(String[] args){
		new GsonPrac();
	}
}
