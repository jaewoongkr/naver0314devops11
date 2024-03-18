package Day0318;

import java.util.Scanner;

public class Ex12_Gugudan {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 구구단?11
		 * 잘못된 숫자입니다.:if
		 * 구구단?5
		 *    **5단 **
		 *    5 x 1 = 5
		 *    5 x 2 = 10
		 *    .
		 *    .
		 *    .
		 *    
		 */
		
		Scanner sc = new Scanner(System.in);
		int gu;
		System.out.println("구구단?");
		gu=sc.nextInt();
		
		if(gu <2 || gu > 9)
		{
			System.out.println("잘못된 숫자입니다");
			return;
		}
		
		System.out.println("**"+gu+"단**\n");
		for(int i=1;i<=9;i++)
		{
			System.out.printf("%d x %d = %2d\n",gu, i, gu*i);
		}
		
			
		

	}

}
