package com.tsms.servlet.taxpayer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tsms.dao.impl.Tax_PayerVODaoImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class deleteTaxPayerServlet
 */
@WebServlet("/deleteTaxPayerServlet.action")
public class deleteTaxPayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteTaxPayerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		
		String id = request.getParameter("id");
		boolean b = new Tax_PayerVODaoImpl().deleteTax_PayerVOById(Integer.parseInt(id));
		JSONObject jsonObject = new JSONObject();
		if(b){
			jsonObject.put("msg", "删除成功");
			jsonObject.put("success", true);
		}else{
			jsonObject.put("msg", "删除失败");
			jsonObject.put("success", false);
		}
		response.getWriter().println(jsonObject.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
