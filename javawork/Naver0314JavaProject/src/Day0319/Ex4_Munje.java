package Day0319;

public class Ex4_Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.printf("%30s\n\n","[구구단]");
		for(int dan=2;dan<=9;dan++)
		{
			System.out.printf("**%d단**\t",dan);
		
		}
		System.out.println();
		System.out.println("=".repeat(63));
		for(int i=1; i<=9 ; i++)
		{
			for(int dan=2;dan<=9;dan++)
			{
				System.out.printf("%dx%d=%2d\t",dan,i,dan*i);
			}
			System.out.println();
		}

	}

}
