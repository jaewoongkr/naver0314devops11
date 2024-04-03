package Day0329;


import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class Ex7_SwingFileMunje extends JFrame{
	
	JComboBox<String> comb1,comb2,comb3;
	JButton btnAdd, btnDel;
	JTable table;
	JTextField tfName;
	DefaultTableModel tableModel;

	String [] comboLabel1 = {"A","B","AB","O"};
	String [] comboLabel2 = {"서울","대구","부산","광주","전주"};
	String [] comboLabel3 = {"차장","과장","대리","사원"};



	final static String SAWON ="D:\\naver0314\\sawon.txt";
	
	public Ex7_SwingFileMunje(String title) {
		// TODO Auto-generated constructor
		super(title);
		this.setLocation(100, 100);//시작위치
		this.setSize(500, 500);//창크기
		//this.getContentPane().setBackground(new Color(110, 50, 50));//배경색 변경
		//this.getContentPane().setBackground(Color.green);//배경색 변경
		//this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//프레임 종료
		
		
		this.initDesign();//각종 컴포넌트 생성//배경색 변경
		this.sawonFileRead();
		this.setVisible(true);//보이게 하는거
		

		//윈도우 종료시 테이블의 내용을 파일에 저장 후 종료
		this.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				// TODO Auto-generated method stub
				super.windowClosing(e);
				//자동저장해주는 메서드 호출

				FileWriter fw=null;
				try {
					fw=new FileWriter(SAWON);
					//테이블의 행갯수만큼 반복해서 데이타를 읽는다
					for(int i=0;i<table.getRowCount();i++)
					{
						String name=table.getValueAt(i, 0).toString();
						String blood=table.getValueAt(i, 1).toString();
						String addr=table.getValueAt(i, 2).toString();
						String cl=table.getValueAt(i, 3).toString();

						String s=name+","+blood+","+addr+","+cl+"\n";
						// 파일에 저장
						fw.write(s);
					}
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}finally {
					try {
						fw.close();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}


				System.exit(0);
			}
		});




	}
	//파일을 불러와서 테이블에 출력하는 메서드
	public void sawonFileRead()
	{
		FileReader fr =null;
		BufferedReader br =null;

		try {
			fr= new FileReader(SAWON);
			br= new BufferedReader(fr);


			while(true)
			{
				String s=br.readLine();
				if(s==null)
					break;
				String[]data=s.split(",");
				tableModel.addRow(data);
			}	
		} catch (FileNotFoundException e) {
			System.out.println("파일없음:"+e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				br.close();
				fr.close();
			} catch (IOException|NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


	}


	public void initDesign() // 버튼 삭제 추가 이름 혈액형 지역 직급 (콤보박스) + 기능
	{
		//상단
		JPanel jb = new JPanel();
		btnAdd= new JButton("사원정보추가");
		btnDel= new JButton("사원정보삭제");

		jb.add(btnAdd);
		jb.add(btnDel);
		this.add("North",jb);

		//센터
		String [] title = {"이름","혈액형","지역","직급"};
		tableModel =new DefaultTableModel(title,0);
		table = new JTable(tableModel);
		this.add("Center",new JScrollPane(table));

		//하단
		JPanel jb2 = new JPanel();

		tfName = new JTextField(7);
		comb1 = new JComboBox<String>(comboLabel1);
		comb2 = new JComboBox<String>(comboLabel2);
		comb3 = new JComboBox<String>(comboLabel3);

		jb2.add(new JLabel("이름"));
		jb2.add(tfName);
		jb2.add(new JLabel("혈액형"));
		jb2.add(comb1);
		jb2.add(new JLabel("지역"));
		jb2.add(comb2);
		jb2.add(new JLabel("직급"));
		jb2.add(comb3);

		this.add("South",jb2);

		//정보 추가 이벤트

		btnAdd.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				

				String name=tfName.getText();
				String blood=comboLabel1[comb1.getSelectedIndex()];
				String addr=comboLabel2[comb2.getSelectedIndex()];
				String cl=comboLabel3[comb3.getSelectedIndex()];


				//Vector 로 데이타를 담는다 (data)
				Vector<String> data =new Vector<String>();
				data.add(name);
				data.add(blood);
				data.add(addr);
				data.add(cl);

				//tableModel 로 추가한다
				tableModel.addRow(data);

				//입력박스 데이타는 지운다(setText)초기화
				tfName.setText("");

			}
		});

		//정보 삭제 이벤트
		btnDel.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int row=table.getSelectedRow();
				System.out.println(row);

				if(row==-1) {
					JOptionPane.showMessageDialog(Ex7_SwingFileMunje.this, "삭제할 행을 선택해주세요");
				}
				//선택한 행 삭제
					tableModel.removeRow(row);
			}
		});



	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex7_SwingFileMunje a =new Ex7_SwingFileMunje("기본창");
	}

}
