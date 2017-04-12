import java.util.Random;

public class RangenTest {
	public static void main(String[] args){
		Random random = new Random();
		int ranNum = 0;
		
		for(int i = 0; i < 4; i++){
			ranNum = random.nextInt(9) +1 ;
			System.out.print(ranNum);
		}
	}
}
