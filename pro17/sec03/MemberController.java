package sec03;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	
	MemberDAO memberDAO;
	
	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		
		String nextPage = null;
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		if( action == null || action.equals("/listMembers.do")) {
			List membersList = memberDAO.listMembers();
			request.setAttribute("membersList",membersList);
			nextPage = "/test03/listMembers.jsp";
		}else if(action.equals("/addMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVO memberVO = new MemberVO(id, pwd, name, email);
			memberDAO.addMember(memberVO);
			nextPage = "/member/listMembers.do";
		}else if (action.equals("/memberForm.do")) {
			nextPage = "/test03/memberForm.jsp";
		}else if (action.equals("/modMemberForm.do")) {
			//id 받기
			String id = request.getParameter("id");
			//id 받아서 조회
			MemberVO memInfo = memberDAO.findMember(id);
			//id 바인딩 후 전달
			request.setAttribute("memInfo", memInfo);
			nextPage = "/test03/modMemberForm.jsp";
		} else if (action.equals("/modMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVO memberVO = new MemberVO(id, pwd, name, email);
			memberDAO.modMember(memberVO);
			//회원 목록창으로 수정 완료 창 전달
			request.setAttribute("msg", "modified");
			nextPage = "/member/listMembers.do";
		}
		else if (action.equals("/delMember.do")) {
			String id = request.getParameter("id");
			memberDAO.delMember(id);
			request.setAttribute("msg", "deleted");
			nextPage = "/member/listMembers.do";
		}else {
			List memberList = memberDAO.listMembers();
			request.setAttribute("membersList", memberList);
			nextPage = "/test03/listMembers.jsp";
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}
