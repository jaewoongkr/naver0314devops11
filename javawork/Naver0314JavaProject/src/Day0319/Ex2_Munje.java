package Day0319;

public class Ex2_Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 1-100 사이의 소수를 모두 출력하고 몇개인지 갯수를 구하라 / 소수? 1을 제외하고 자기자신만을 약수로 가지고 있는 수
		
		int count=0;
		Loop:
		for(int i=2;i<=100;i++) 
		{
			for(int j=2;j<i;j++)
		    {
				if(i%j==0)
					continue Loop; //i++로 이동
		}
		count++;
		System.out.printf("%3d",i);
		if(count%5==0)
			System.out.println();
		}
		System.out.println("\n소수의 갯수 :"+count);
	}

}
