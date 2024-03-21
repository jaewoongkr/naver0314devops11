package Day0320;

import java.util.Scanner;

public class Ex8_ArraySearchNum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 숫자 num을 입력하여 배열에 몇번째에 있는지 출력 없을경우 없다고 메세지 출력
		 * 반복해서 검색(0입력시 종료)
		 */
		int []data = {1,2,3,6,7,8,9,10,16,19};
		
		Scanner scanner=new Scanner(System.in);
		int searchIndex=-1;
		int num;
		
		
		while(true)
		{
			searchIndex=-1;
			System.out.println("검색할 숫자를 입력하세요");
			num=scanner.nextInt();
			if(num==0)
			{
				System.out.println("검색을 종료합니다"); //0입력시 종료
				break;
			}
			
			for(int i=0;i<data.length;i++) //반복
			{
				if(num==data[i])    //입력한 숫자가 데이타에 있는 값과 같다면 i번째와 서치인덱스가 나
				{
					searchIndex=i;
					break;
				}
			}
			if(searchIndex==-1)
				System.out.println("\t"+num+"은 데이타에 없습니다");
			else
				System.out.println("\t"+num+"은"+(searchIndex+1)+"번째에 있습니다");
			System.out.println();
		}
		
		
		
	

	}

}
