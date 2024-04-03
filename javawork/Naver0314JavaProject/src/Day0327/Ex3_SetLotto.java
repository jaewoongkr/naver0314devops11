package Day0327;

import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;

public class Ex3_SetLotto {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		Set<Integer> setLooto=new TreeSet<>();

		while(true)
		{
			System.out.println("로또를 구입할 금액을 입력하세요(종료:0)");
			int money=sc.nextInt();
			//0이면 종료
			if(money==0)
			{
				System.out.println("\t시스템을 종료합니다");
				break;
			}

			if(money<1000)
			{
				System.out.println("\t금액이 부족합니다");
				break;
			}
			for(int i=0;i<money/1000;i++)
			{
				//6개의 중복되지 않은 로또 숫자 구하기(1~45)
				//기존 값 모두 삭제 후 다시 구하기
				setLooto.clear();

				while(true)
				{
					int n=(int)(Math.random()*45)+1;
					setLooto.add(n);
					if(setLooto.size()==6)
						break;
				}
				System.out.printf("%3d회 :",i+1);
				for(int a:setLooto)
				{	
					System.out.printf("%3d",a);
				}
				System.out.println();
			}
		}

	}

}

