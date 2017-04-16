
public class subStringPrac {
	
	public static String removeTillWord(String input) {
		if(input == null) 
			return null;
		try{
			return input.substring(input.indexOf("http"));
		}catch(Exception ex){
			return input.substring(input.indexOf("www"));
		}
	}

	public static void main(String[] args){
		System.out.println(removeTillWord("제주도축제문화행사 http://www.visitjeju.net"));
		System.out.println(removeTillWord(null));
		System.out.println(removeTillWord("제주도축제문화행사www.visitjeju.net"));
		
		System.out.println(removeTillWord("http://대문어축제.kr"));
		
		System.out.println(removeTillWord(""));
		/*
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		System.out.println(removeTillWord(""));
		*/
	}
}
