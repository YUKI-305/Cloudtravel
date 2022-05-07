package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import entity.Note;
import dao.NoteDao;

@WebServlet("/write_note")

public class writeNote extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
//		HttpSession session = request.getSession();
//		String isLogin = (String) session.getAttribute("isLogin");
//		User user = (User) session.getAttribute("name");
		
//		if( user != null && isLogin.equals("1")) {
//			String uid = (String ) user.getUSER_ID();
		String title=request.getParameter("title");
		System.out.println(title);
		String texts=request.getParameter("texts");
		System.out.println(texts);
		String src=request.getParameter("img");
		System.out.println(src);
		if(src==null){
			System.out.println("图片是null的");
		}
		if(src==""){
			System.out.println("图片是空的");
		}
			Note note = new Note(
							0,
							"NEU",
							title,	
							texts,	
							LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")),
		        	        src,	
		        	        0,0
							);
		
//		}
//		else {
//			PrintWriter out = response.getWriter();
//				
//			out.write("<script>");
//			out.write("alert(‘登录后，再发布！’)");
//			out.write("location.href='login.jsp'");
//			out.write("</script>");
//			out.close();
//			return;
//		}
		if(NoteDao.insertNote(note)==0){
			PrintWriter out=response.getWriter();                
            out.print("<script language='javascript'>alert('发布失败！');window.location.href='write_note.jsp';</script>");
		}
		else {
			PrintWriter out=response.getWriter();                
            out.print("<script language='javascript'>alert('发布成功！');window.location.href='write_note.jsp';</script>");
		}
		//response.sendRedirect("write_note.jsp");
		//request.getRequestDispatcher("write_note.jsp").forward(request,response);
	}
}
