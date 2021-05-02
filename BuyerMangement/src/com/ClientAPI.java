package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClientAPI
 */
@WebServlet("/ClientAPI")
public class ClientAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		String output = clientObj.insertClient(request.getParameter("fname"), 
				 request.getParameter("lname"), 
				request.getParameter("NIC"), 
				request.getParameter("address"), 
		        request.getParameter("contactNumber"), 
		        request.getParameter("email"),
		        request.getParameter("username"), 
		        request.getParameter("password")); 
		        response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		Map paras = getParasMap(request); 
		 String output = clientObj.updateClient(paras.get("hidIDSave").toString(), 
		 paras.get("fname").toString(), 
		 paras.get("lname").toString(), 
		paras.get("NIC").toString(), 
		paras.get("address").toString(), 
		paras.get("contactNumber").toString(), 
		paras.get("email").toString(), 
		paras.get("username").toString(), 
		paras.get("password").toString()); 
		response.getWriter().write(output); 
		} 
		
	

	private Map getParasMap(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Map<String, String> map = new HashMap<String, String>(); 
		try
		 { 
		 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
		 String queryString = scanner.hasNext() ? 
		 scanner.useDelimiter("\\A").next() : ""; 
		 scanner.close(); 
		 String[] params = queryString.split("&"); 
		 for (String param : params) 
		 { 
		String[] p = param.split("=");
		 map.put(p[0], p[1]); 
		 } 
		 } 
		catch (Exception e) 
		 { 
		 } 
		return map; 
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request); 
		 
		String output = clientObj.deleteClient(paras.get("id").toString()); 
		response.getWriter().write(output);
	}

}
