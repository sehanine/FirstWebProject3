package web.change;

public class JspChange {
	/**
	 * @jsp[0] default
	 * @jsp[1] replymgr
	 * @jsp[2] starmgr
	 * @jsp[3] link1
	 */
	private static String[] jsp={
			"default.jsp",
			"../mypage/replymgr.jsp", // reply manager ´ñ±Û
			"../mypage/starmgr.jsp", // star manager ÁñÃ£
			"../mypage/pagemgr.jsp"  // °³ÀÎÁ¤º¸ ¼öÁ¤ Å»Åğ
	};
	
	public static String change(int no){
		return jsp[no];
	}
}
