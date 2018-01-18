import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Cookies;

//import org.apache.catalina.servlet4preview.RequestDispatcher;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String remember = request.getParameter("remember");
		//checkbox name�� remember �̰� checked = on, unchecked = null ���� �ް� �ȴ�.
		
		//�α����� �����ߴ����� sessionLoginCheck�� ���� Ȯ�� remember�� Ȯ�� �� ĳ�� ����ϰ� ���ϰ� �Ѱ��ش�.
		if(remember!=null&&remember.equals("on")) {
			//REMEMBER ME ��Ű ����				
			response.addCookie(
					Cookies.createCookie("AUTH", id, "/", 60*60)
					);	
			response.addCookie(
					Cookies.createCookie("REMEMBER", remember, "/", 60*60)
					);	
		}else{//��Ű ���� 
			response.addCookie(
					Cookies.createCookie("AUTH", "", "/", 0)
					);	
			response.addCookie(
					Cookies.createCookie("REMEMBER", "", "/", 0)
					);

		}
		System.out.println("if�� ��� request��");
		RequestDispatcher reqDis = request.getRequestDispatcher("/sessionLoginCheck.jsp");
		reqDis.forward(request, response);	
		//System.out.println("if�� ��� request�Ʒ�");
		/*if(id.equals("asdf")&&pwd.equals("1234")) {
			if(remember!=null&&remember.equals("on")) {
				System.out.println("�α��ο� �����Ͽ����ϴ�.");
				//REMEMBER ME ��Ű ����				
				response.addCookie(
						Cookies.createCookie("AUTH", id, "/", 60*60)
						);		
				//response.addHeader("default", pwd);
				//response.sendRedirect("/");	
				RequestDispatcher reqDis = request.getRequestDispatcher("/sessionLoginCheck.jsp");
				reqDis.forward(request, response);	
			}else{//��Ű ���� 
				if(remember==null) {
					PrintWriter out =response.getWriter() ;
					out.println("didi");
					//request.setAttribute("getplaceholder", id); setAttribute �ȵ�					
					response.addCookie(
							Cookies.createCookie("AUTH", "", "/", 60*60)
							);	
					//response.sendRedirect("/");
					RequestDispatcher reqDis = request.getRequestDispatcher("/sessionLoginCheck.jsp");
					reqDis.forward(request, response);	
				}					
			}
		}else { 
			//ID ��й�ȣ�� Ʋ���� �� ��Ű ���� , id �Ǵ� ��й�ȣ�� Ʋ���ϴ�, �α��� ��������		
			response.addCookie(
					Cookies.createCookie("AUTH", "", "/", 0)
					);	
			request.setAttribute("msg", "id �Ǵ� ��й�ȣ�� Ʋ���ϴ�.");		
			RequestDispatcher reqDis = request.getRequestDispatcher("/loginForm2.jsp");
			reqDis.forward(request, response);	
		}*/
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
