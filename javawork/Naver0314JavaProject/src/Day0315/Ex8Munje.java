package Day0315;

import java.util.Scanner;

public class Ex8Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 이름(name),핸드폰(hp),태어난 년도(birthYear) 입력받은 후
		 * 이름,핸드폰,태어난년도,나이(2024-태어난년도)를 출력하는 프로그램을 작성하시오
		 * 선언-입력-계산-출력
		 */
		Scanner sc=new Scanner(System.in);
		String name,hp;
		int year;
		
		System.out.println("이름은?");
		name=sc.nextLine();
		System.out.println("핸드폰 번호는?");
		hp=sc.nextLine();
		System.out.println("태어난 년도는?");
		year=sc.nextInt();
		
		System.out.println("이름: "+name);
		System.out.println("핸드폰 번호: "+hp);
		System.out.println("태어난 년도: "+year);
	
		System.out.printf("나이: %d",2024-year);
		
	

	}

}
