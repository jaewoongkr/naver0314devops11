package Day0329;


import java.awt.Canvas;
import java.awt.Color;
import java.awt.FileDialog;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;


public class Ex1_SwingImage extends JFrame{
	static String PHOTO="D:\\naver0314\\workall\\image\\연예인사진\\19.jpg";
	JButton btnOpen;
	Myphoto myphoto=new Myphoto(); //내부 클래스도 하나의 멤버 변수로 설정
	
	
	
	public Ex1_SwingImage(String title) {
		// TODO Auto-generated constructor
		super(title);
		this.setLocation(100, 100);//시작위치
		this.setSize(400, 500);//창크기
		this.getContentPane().setBackground(new Color(190, 90, 90));//배경색 변경
		//this.getContentPane().setBackground(Color.green);//배경색 변경
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//프레임 종료
		this.initDesign();//각종 컴포넌트 생성//배경색 변경
		this.setVisible(true);//보이게 하는거
	}
	
	//캔버스를 상속 받는 내부클래스
	class Myphoto extends Canvas
	{
		@Override
		public void paint(Graphics g) {
			// TODO Auto-generated method stub        //paint메소드를 오버라이드
			super.paint(g);
			
			Image image =new ImageIcon(PHOTO).getImage();
			g.drawImage(image, 0,0,this.getWidth(),this.getHeight(),this);
			
		}
	}
	
	public void initDesign()
	{
		//패널에 버튼을 생성 후 패널을 North 에 추가
		JPanel p=new JPanel();
		btnOpen=new JButton("이미지 불러오기");
		p.add(btnOpen);
		this.add("North",p); //패널에 버튼을 담아서 상단에 추가
		
		this.add("Center",myphoto);//캔버스는 센터
		
		
		btnOpen.addActionListener(new ActionListener() { //버튼이벤트
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				FileDialog dlg=new FileDialog(Ex1_SwingImage.this, "이미지 불러오기", FileDialog.LOAD);
				dlg.setVisible(true);
				if(dlg.getFile()==null)
					return;//취소를 클릭시 메서드 종료
				//불러올 경로와 파일명
				PHOTO=dlg.getDirectory()+dlg.getFile();
				//캔바스의 paint 메서드 다시 호출
				myphoto.repaint();
			}
		});
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex1_SwingImage a =new Ex1_SwingImage("사진불러오기");
	}

}
