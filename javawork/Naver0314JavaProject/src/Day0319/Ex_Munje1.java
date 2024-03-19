package Day0319;

import java.util.Scanner;

public class Ex_Munje1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		//
		Scanner sc = new Scanner(System.in);
		int su, sum =1;                     // int fact=1;
		System.out.println("숫자를 입력하세요"); // for(int i=1; i<=10;i++) fact*=i; 
		su = sc.nextInt();
		
		for (int i=1;i<=10;i++)
		
		{sum*=su;
		
		System.out.println(su+ " ! =" + sum);
		
		su+=1;}

	}

}
