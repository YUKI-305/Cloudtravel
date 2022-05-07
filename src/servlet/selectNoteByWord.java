package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import entity.Note;
import dao.NoteDao;

@WebServlet("/community_home")

public class selectNoteByWord extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//接收用户搜索的关键字
		String keyword = request.getParameter("word");
		//获取所有用户记录
		ArrayList<Note> list = NoteDao.selectByWord(keyword);
		//放到请求对象域里
		request.setAttribute("clist", list);
		System.out.println(keyword);
		if(list!=null){
			System.out.println("servlet里的list不是空的");
		}
		request.getRequestDispatcher("/community_search.jsp").forward(request, response);		
	}
}
