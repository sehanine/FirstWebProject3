
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
		System.out.println(removeTillWord("���ֵ�������ȭ��� http://www.visitjeju.net"));
		System.out.println(removeTillWord(null));
		System.out.println(removeTillWord("���ֵ�������ȭ���www.visitjeju.net"));
		
		System.out.println(removeTillWord("http://�빮������.kr"));
		
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
