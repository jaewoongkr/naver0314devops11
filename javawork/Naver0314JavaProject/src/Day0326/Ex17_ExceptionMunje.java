package Day0326;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/*
 * score.txt 를 읽어서 총갯수와 총점, 평균을 구하시오
 * 단, 점수에 문자가 있는 경우 갯수에서 제외하고 총점에서도 제외하고 결과출력이 되도록 하기
 * 
 * 갯수 : 13개
 * 총점 : 900
 * 평균 : 78.9
 */
public class Ex17_ExceptionMunje {
	
	static final String FILENAME3="d:/naver0314/score.txt";
	static public void readScore ()
	{
		BufferedReader br=null;
		FileReader fr=null;
		
		try {
			fr=new FileReader(FILENAME3);
			System.out.println("**memo2 파일을 읽습니다**");
			br =new BufferedReader(fr);
			
			while(true)
			{
				//파일의 내용을 한줄씩 읽어온다
				String line=br.readLine();
				//만약 더이상 데이타가 없을경우 null 값이 반환된다
				if(line==null)
					break;
				System.out.println(line);
			}
		} catch (FileNotFoundException e) {
			System.out.println("**memo2 파일이 없어요**");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//나중에 열린 자원을 먼저 닫는다
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a, sum, avg;
		
		readScore ();
		
	}

}
