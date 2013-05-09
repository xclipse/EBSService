package oracle.ebs.service.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PollingData
 */
@WebServlet("/PollingData")
public class PollingData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PollingData() {
        super();
        dataMap.put("1", new Vector<String[]>());
        dataMap.put("2", new Vector<String[]>());
        dataMap.put("3", new Vector<String[]>());
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
	  PrintWriter pw = response.getWriter();
	  String id = request.getParameter("id");
	  //String[] data = dataMap.get(id);
	  Vector<String[]> l = dataMap.get(id);
	  if(l.size() == 0){
	    pw.print("{\"data\": [ { \"value\":\"\" , \"color\":\"black\" } ] }");
	  } else {
	    pw.print("{\"data\": [ " );
	    boolean first = true;
	    for (Iterator<String[]> iterator = l.iterator(); iterator.hasNext();) {
        String[] strings = iterator.next();
        iterator.remove();
        pw.print(	(first?"":",") +"{ \"value\":\"" + strings[0] +"\" , \"color\":\"" + strings[1] +"\" }" );
        if(first){
          first = false;
        } 
      }
	    pw.print(		"] }");
	  }
	}
	
	public static Hashtable<String, Vector<String[]>> dataMap = new Hashtable<String, Vector<String[]>>();
	
	public static void appendMsg(String id, String msg, String color){
	  Vector<String[]> l = dataMap.get(id);
	  l.add(new String[] {msg, color});
	}
}
