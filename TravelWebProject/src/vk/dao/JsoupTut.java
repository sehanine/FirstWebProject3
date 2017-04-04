package vk.dao;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupTut {
	public static String removeTags(String s){
		String[] tags = {"\u00a0", "\u003E", "\u003C"};
		for(int i = 0; i < tags.length; i++){
			s = s.replaceAll(tags[i], "");
		}
		return s;
	}
	public JsoupTut(){
		try {
			VisitKoreaVO vo = new VisitKoreaVO();
			Document contents = Jsoup.connect("http://korean.visitkorea.or.kr/kor/bz15/tp/content/view.jsp?cid=2424882&type=G&listType=SPC&orderType=R&pageNum=1&category=F").get();
			/*
			  <div class="function">
				<a class="more" href="http://korean.visitkorea.or.kr/kor/bz15/where/where_main_search.jsp?cid=695592">상세정보 더보기</a>

			 */
			
			Elements subAddr = contents.select("div.function a.more");
			Element subAddr_ = subAddr.first();
			String subUrl = subAddr_.attr("href");
			System.out.println("subUrl: " + subUrl);
			
			Document doc_ = Jsoup.connect(subUrl).get();
			Elements eImage = doc_.select("div.obj img");
			Elements ul_list_first = doc_.select("figcaption ul li");
			
			for(int j = 0; j < eImage.size(); j++){
				Element eImage_ = eImage.get(j);
				String url = eImage_.attr("src");
				vo.getImage_list().add(url);
				System.out.println( (j+1) + ": " + url); // test only *****
			}
			
			/*
			 * 행사기간
				위치 
				행사장소
				연 락 처
				홈페이지 
			 */
			for(int j = 0; j < ul_list_first.size(); j++){
				String temp = ul_list_first.get(j).text();
				if(temp.contains("위치")){
					vo.setLocAddr(temp.replace("위치 ", ""));
				} else if(temp.contains("행사장소")){
					vo.setLoc(temp.replace("행사장소 ", ""));
				} else if(temp.contains("연 락 처")){
					vo.setTel(temp.replace("연 락 처 ", ""));
				} else if(temp.contains("홈페이지")){
					vo.setHomepage(temp.replace("홈페이지 ", ""));
				} else {
					vo.setLocAddr(null);
				}
				/*
				 * vo.setLocAddr(temp.replace("위치 ", ""));
				 * vo.setLoc(temp.replace("행사장소 ", ""));
				 */
			}
			//test output only *****
			System.out.println(vo.getLocAddr());
			System.out.println(vo.getLoc());
			System.out.println(vo.getTel());
			System.out.println(vo.getHomepage());
			//test output only *****

/*
		<div id="group1" class="grap">
			<ul class="ptList">
				<div class="cntBox open">
<div class="title"><strong><a class="ov" href="#group1">개요 <span class="detail">상세보기</span></a></strong></div>

<div id="group1" class="grap">
	<ul class="ptList">


*/
			/**
			 * 개요 
			 * ul_list_second
			 */
			Elements ul_list_second = doc_.select("div.cntBox.open div.grap ul.ptList li");
			//System.out.println("size: " + ul_list_second.size());
			ArrayList<String> list_summary = vo.getSummary();
			for(int j = 0; j < ul_list_second.size(); j++){
				String temp = ul_list_second.get(j).text();
				
				if(j == 0){
					list_summary.add(removeTags(temp));
				} else {
					
					if(!list_summary.get(j - 1).contains(temp)){
						list_summary.add(removeTags(temp));
					} else 
						list_summary.add("DUPLICATE");
				}
			}
			
			for(int j = 0; j < list_summary.size(); j++){	
				if(list_summary.get(j).contains("DUPLICATE")){
					System.out.println("ul_list_second duplicate removed");
					list_summary.remove(j);
				}
			}
			//test only ******
			System.out.println("개요****");
			for(String str: list_summary){
				System.out.println("개요: " + str);
			}
			//test only ******
			
		//	list.add(vo);
/*
<div class="cntBox">
<div class="title"><strong><a href="#group4">이용안내 <span class="detail">상세보기</span></a></strong></div>

<div id="group4" class="grap">
	<ul class="ptList">
*/	
			/**
			 * 이용안내
			 * ul_list_third 
			 */
			ArrayList<String> list_instruction = vo.getInstruction();
			Elements ul_list_third = doc_.select("div.cntBox div#group4 ul.ptList li");
			for(int j = 0; j < ul_list_third.size(); j++){
				String temp = ul_list_third.get(j).text();
				if(j == 0){
					list_instruction.add(removeTags(temp)); // *****
				} else {
					
					if(!list_instruction.get(j - 1).contains(temp)){
						list_instruction.add(removeTags(temp)); // *****
					} else 
						list_instruction.add("DUPLICATE");
				}
			}
		
			for(int j = 0; j < list_instruction.size(); j++){	
				if(list_instruction.get(j).contains("DUPLICATE")){
					System.out.println("ul_list_third duplicate removed");
					list_instruction.remove(j);
				}
			}
			
			//test only ******
			System.out.println("이용안내****");
			for(String str: list_instruction){
				System.out.println("이용안내: " + str);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args){
		new JsoupTut();
	}
}
