package Day0325;

public class Student {
	private String name;
	private int java;
	private int spring;
	
	public Student() {
		//super();//원래는 부모클래스의 디폴트 생성자 호출하는 명령어,생략가능
		this("아무개",10,10);
		
	}

	public Student(String name) {
		super();
		this.name = name;
	}


	public Student(int java, int spring) {
		super();
		this.java = java;
		this.spring = spring;
	}


	public Student(String name, int java, int spring) {
		super();
		this.name = name;
		this.java = java;
		this.spring = spring;
	}
	
	//setter & getter method
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getSpring() {
		return spring;
	}

	public void setSpring(int spring) {
		this.spring = spring;
	}
	

	
	
	

}
