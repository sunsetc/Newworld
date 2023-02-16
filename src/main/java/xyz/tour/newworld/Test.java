package xyz.tour.newworld;

public class Test {

	private int num;
	private String str;
	//private final String str; 오류나는 이유.
	//값을 초기화 할수있는 건 12행뿐인데 뉴테스트하면서 null을
	//집어 넣잖아 그럼 값이 바뀐다.
	//private final String str="1"; 일케 해주거나
	//논스태틱이니까 생성자 호출을 여기서 해주거나.
//	Test(String str){ //생성자 주입
//		this.str = str;
//	}
//	
	
	public static void main(String[] args) {
		Test t = new Test(); //인스턴스화 시킬때 값이 초기화된다.
		System.out.println(t.num); //0
		System.out.println(t.str); //null
	}
}
