import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/set")
public class SetAttribute extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String ctxMsg = "Context에 바인딩";
		String sesMsg = "Session에 바인딩";
		String reqMsg = "Request에 바인딩";
		
		ServletContext ctx = getServletContext();
		HttpSession ses = request.getSession();
		
		ctx.setAttribute("context", ctxMsg);
		ses.setAttribute("session", sesMsg);
		request.setAttribute("request", reqMsg);
		out.print("바인딩을 수행합니다.");
	}
}
