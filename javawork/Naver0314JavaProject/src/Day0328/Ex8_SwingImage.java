package Day0328;
import java.awt.Canvas;
import java.awt.Color;
import java.awt.FileDialog;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.FileDialog;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRadioButton;

import Day0328.Ex5_SwingCanvas.MyDraw;

public class Ex8_SwingImage extends JFrame{
	 //버튼변수생성
	MyDraw draw=new MyDraw();
	final static String PHOTO1="D:\\naver0314\\workall\\image\\연예인사진\\19.jpg";
	
	public Ex8_SwingImage(String title) {
		// TODO Auto-generated constructor
		super(title);
		this.setLocation(100, 100);//시작위치
		this.setSize(500, 500);//창크기
		this.getContentPane().setBackground(new Color(110, 50, 50));//배경색 변경
		//this.getContentPane().setBackground(Color.green);//배경색 변경
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//프레임 종료
		this.initDesign();
		this.setVisible(true);//보이게 하는거
	}
	
	class MyDraw extends Canvas {
		
	    private Image image;
	
		@Override
		public void paint(Graphics g)  {
            super.paint(g);
            if (image != null) {
                g.drawImage(image, 100, 150, 300, 300, this);
            } else {
                Image image1 = new ImageIcon(PHOTO1).getImage();
                g.drawImage(image1, 100, 150, 300, 300, this);
            }
        }
		
		 public void setImage(Image image) {
	            this.image = image;
	            repaint();
		  }
    }

    public void initDesign() {
        this.add("Center", draw);

        JPanel p = new JPanel();
        JButton btnOpen = new JButton("파일열기");
        p.add(btnOpen);
        this.add("North", p);

        btnOpen.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                FileDialog dlg = new FileDialog(Ex8_SwingImage.this, "파일열기", FileDialog.LOAD);
                dlg.setVisible(true);
                String path = dlg.getDirectory() + dlg.getFile();
                if (path != null) {
                    Image newImage = Toolkit.getDefaultToolkit().getImage(path);
                    draw.setImage(newImage); // 이미지를 설정하여 캔버스에 표시합니다.
                }
            }
        });
    }

    public static void main(String[] args) {
        Ex8_SwingImage a = new Ex8_SwingImage("이미지창");
    }
}