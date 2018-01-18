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
		//checkbox name이 remember 이고 checked = on, unchecked = null 값을 받게 된다.
		
		//로그인이 성공했는지는 sessionLoginCheck에 가서 확인 remember만 확인 후 캐쉬 기억하고 안하고 넘겨준다.
		if(remember!=null&&remember.equals("on")) {
			//REMEMBER ME 쿠키 생성				
			response.addCookie(
					Cookies.createCookie("AUTH", id, "/", 60*60)
					);	
			response.addCookie(
					Cookies.createCookie("REMEMBER", remember, "/", 60*60)
					);	
		}else{//쿠키 삭제 
			response.addCookie(
					Cookies.createCookie("AUTH", "", "/", 0)
					);	
			response.addCookie(
					Cookies.createCookie("REMEMBER", "", "/", 0)
					);

		}
		System.out.println("if문 통과 request위");
		RequestDispatcher reqDis = request.getRequestDispatcher("/sessionLoginCheck.jsp");
		reqDis.forward(request, response);	
		//System.out.println("if문 통과 request아래");
		/*if(id.equals("asdf")&&pwd.equals("1234")) {
			if(remember!=null&&remember.equals("on")) {
				System.out.println("로그인에 성공하였습니다.");
				//REMEMBER ME 쿠키 생성				
				response.addCookie(
						Cookies.createCookie("AUTH", id, "/", 60*60)
						);		
				//response.addHeader("default", pwd);
				//response.sendRedirect("/");	
				RequestDispatcher reqDis = request.getRequestDispatcher("/sessionLoginCheck.jsp");
				reqDis.forward(request, response);	
			}else{//쿠키 삭제 
				if(remember==null) {
					PrintWriter out =response.getWriter() ;
					out.println("didi");
					//request.setAttribute("getplaceholder", id); setAttribute 안됨					
					response.addCookie(
							Cookies.createCookie("AUTH", "", "/", 60*60)
							);	
					//response.sendRedirect("/");
					RequestDispatcher reqDis = request.getRequestDispatcher("/sessionLoginCheck.jsp");
					reqDis.forward(request, response);	
				}					
			}
		}else { 
			//ID 비밀번호가 틀렸을 때 쿠키 삭제 , id 또는 비밀번호가 틀립니다, 로그인 페이지로		
			response.addCookie(
					Cookies.createCookie("AUTH", "", "/", 0)
					);	
			request.setAttribute("msg", "id 또는 비밀번호가 틀립니다.");		
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
