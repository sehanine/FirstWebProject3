package web.member;

import java.util.Random;

public class RandomNumGen {
	public static String getRanNum(){
		Random random = new Random();
		String ranNum = null;
		
		for(int i = 0; i < 4; i++){
			if(i==0){
				ranNum = random.nextInt(9) + 1 + "";
			} else{
				ranNum += random.nextInt(9) + 1 ;
			}
		}
		return ranNum;
	}
}
