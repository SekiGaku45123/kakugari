package image;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.Images;
import dao.ImageDAO;
import tool.Page;

@WebServlet(urlPatterns={"/img_insert/upload"})
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class Image extends HttpServlet {

	public void doPost (
			HttpServletRequest request, HttpServletResponse response
		) throws ServletException, IOException {
			PrintWriter out=response.getWriter();
			Page.header(out);
			try {
				Part filePart = request.getPart("image");
		        InputStream inputStream = filePart.getInputStream();

		        // InputStreamをbyte[]に変換
		        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            byteArrayOutputStream.write(buffer, 0, bytesRead);
		        }
		        byte[] imageBytes = byteArrayOutputStream.toByteArray();
				// ここから

				Images p=new Images();
				p.setItem_id("123");
				p.setImage_data(imageBytes);

				ImageDAO dao=new ImageDAO();
				int line=dao.insert(p);

				// ここまで

				if (line>0) {
					out.println("追加に成功しました。");
				}
			} catch (Exception e) {
				e.printStackTrace(out);
			}
			Page.footer(out);
		}
}
