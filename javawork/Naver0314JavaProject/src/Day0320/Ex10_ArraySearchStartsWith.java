package Day0320;

import java.util.Scanner;

public class Ex10_ArraySearchStartsWith {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String []members = {"강호동","유재석","이승기","이수근","정형돈","정준하","김희철","이상민"};
		/*
		 * 검색할 이름은? 강
		 * 1번째 : 강호동
		 * 5번째 : ...
		 * 총2명 검색
		 * 
		 * 검색할 이름은? 박이
		 * "박이"로 시작하는 멤버는 없습니다
		 * 
		 * 검색할 이름은? Q
		 * **검색을 종료합니다**
		 */
		Scanner sc=new Scanner(System.in);
		String name;
		
		int count;
		
		while(true)
		{
			count=0;
			
			System.out.print("검색할 이름를 입력하세요");
            name=sc.nextLine();
            
			if(name.equalsIgnoreCase("q"))
			{
				System.out.println("검색을 종료합니다"); 
				break;
			}
			
			for(int i=0;i<members.length;i++) 
			{
				if(members[i].startsWith(name))    
				{
					count++;
					System.out.printf("%d 번째 : %s\n",i+1,members[i]);
				}
			}
			if(count==0)
				System.out.println("\t\""+name+"\"로 시작하는 멤버는 없습니다");
			else
				System.out.println("\t총 " +count+" 명 검색");
			System.out.println();
		}
		

	}

}
