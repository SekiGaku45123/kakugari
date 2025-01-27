package kakugari;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.Images;
import bean.Item;
import bean.User;
import dao.ImageDAO;
import dao.ItemDAO;
import tool.Page;

@WebServlet(urlPatterns={"/kakugari/listing"})
@MultipartConfig
public class Listing extends HttpServlet {




	public void doGet (
	        HttpServletRequest request, HttpServletResponse response
	    ) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    public void doPost (
	        HttpServletRequest request, HttpServletResponse response
	    ) throws ServletException, IOException {
	        processRequest(request, response);
	    }

		public void processRequest(
				HttpServletRequest request, HttpServletResponse response
		)
				throws ServletException, IOException {
			PrintWriter out=response.getWriter();
			Page.header(out);





			try{


				HttpSession session = request.getSession();

		        User user = (User) session.getAttribute("customer");


		        String user_id = user.getUser_id();

	        	String item_name = request.getParameter("item_name");

	        	String scales = request.getParameter("scales");
	        	String scales1 = request.getParameter("scales1");
	        	String goods_deta = request.getParameter("goods_deta");
	        	String region = request.getParameter("region");
	        	int shopping_days = Integer.parseInt(request.getParameter("shopping_days"));
	        	int item_price =  Integer.parseInt(request.getParameter("item_price"));




	        	Part part=request.getPart("photo");
	        	Part part1=request.getPart("photo1");
	        	Part part2=request.getPart("photo2");

	        	String photo = part.getSubmittedFileName();
	        	String photo1 = part1.getSubmittedFileName();
	        	String photo2 = part2.getSubmittedFileName();

	        	String hantei ="\\kakugari";
	    		String filename=Paths.get(part.getSubmittedFileName()).getFileName().toString();
	    		String filename1=Paths.get(part1.getSubmittedFileName()).getFileName().toString();
	    		String filename2=Paths.get(part2.getSubmittedFileName()).getFileName().toString();
	    		String path=getServletContext().getRealPath("images");

	    		System.out.println(path);

	    		try{
	    			if (path.contains(hantei)) {


		    			System.out.println("実行全");

		                int index = path.indexOf(hantei);
		                path = path.substring(0, index + hantei.length());
		                path = path + "\\kakugari3\\WebContent\\images";

		                System.out.println("結果: " + path);
			    		part.write(path+File.separator+filename);
			    		if (photo1 != null && !photo1.isEmpty()){
			    		part1.write(path+File.separator+filename1);
			    		}if(photo2 != null && !photo2.isEmpty()){
			    		part2.write(path+File.separator+filename2);
			    		}
		            }


	    		}catch(Exception e){
	    			System.out.println("error");
	    			try{
		    			System.out.println("実行清水");

		                path = "C:\\Users\\s_shimizu\\git\\kakugari\\WebContent\\images";

		                System.out.println("結果: " + path);
			    		part.write(path+File.separator+filename);
			    		if (photo1 != null && !photo1.isEmpty()){
				    	part1.write(path+File.separator+filename1);
				    	}if(photo2 != null && !photo2.isEmpty()){
				    	part2.write(path+File.separator+filename2);
				    	}

		    		}catch(Exception e1){
		    			System.out.println("error");
		    			try{
			    			System.out.println("実行麻見");

			                int index = path.indexOf(hantei);
			                path = path.substring(0, index + hantei.length());
			                path = "C:\\Users\\o_oohara\\git\\kakugari3\\WebContent\\images";

			                System.out.println("結果: " + path);
				    		part.write(path+File.separator+filename);
				    		if (photo1 != null && !photo1.isEmpty()){
					    	part1.write(path+File.separator+filename1);
					    	}if(photo2 != null && !photo2.isEmpty()){
					    	part2.write(path+File.separator+filename2);
					    	}

			    		}catch(Exception e11){
			    			System.out.println("error");
			    			try{
				    			System.out.println("実行かい");

				                int index = path.indexOf(hantei);
				                path = path.substring(0, index + hantei.length());
				                path = "C:\\Users\\柳澤開\\git\\kakugari\\WebContent\\images";

				                System.out.println("結果: " + path);
					    		part.write(path+File.separator+filename);
					    		if (photo1 != null && !photo1.isEmpty()){
						    	part1.write(path+File.separator+filename1);
						    	}if(photo2 != null && !photo2.isEmpty()){
						    	part2.write(path+File.separator+filename2);
						    	}

				    		}catch(Exception e111){
				    			System.out.println("error");
				    		}
			    		}
		    		}
	    		}








				ItemDAO dao=new ItemDAO();

				photo = "../images/"+photo;
				photo1 = "../images/"+photo1;
				photo2 = "../images/"+photo2;

				System.out.print(photo);
				System.out.print(photo1);
				System.out.print(photo2);

	        	int maxItemId = dao.getMaxItemId();
	        	maxItemId += 1;
	        	String maxItemId1 = String.valueOf(maxItemId);

	        	Item p =new Item();
	        	p.setItem_id(maxItemId1);
	        	p.setUser_id(user_id);
	        	p.setItem_price(item_price);
	        	p.setCategory(scales);
	        	p.setItem_detail(goods_deta);
	        	p.setCondition(scales1);
	        	p.setArea(region);
	        	p.setShipping_days(shopping_days);
	        	p.setItem_name(item_name);

				int line=dao.listinginsert(p);

				ImageDAO dao1=new ImageDAO();

				Images q =new Images();
				q.setItem_id(maxItemId1);
				q.setImage_data(photo);
				q.setImage_data1(photo1);
				q.setImage_data2(photo2);
				q.setUser_id(user_id);

				int list = dao1.imageinsert(q);

				System.out.print(line);

				if (line>0){

					request.setAttribute("ItemId", maxItemId1);
					request.getRequestDispatcher("/main_kakugari/syupin_comp.jsp")
					.forward(request, response);
				}



			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}

