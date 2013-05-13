package oracle.ebs.service.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.ebs.service.pim.PIMService;

/**
 * Servlet implementation class ReplyData
 */
@WebServlet(name = "replyData", urlPatterns = { "/replyData" })
public class ReplyData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyData() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.getWriter().print("{ \"data\" : \"success\" }");
	  String id = request.getParameter("id");
/*	  if("2".equals(id)){
	    SiebelService.processFlag = true;
	  } else if("3".equals(id)){
	    BRMService.processFlag = true;
	  }*/
	}

}
