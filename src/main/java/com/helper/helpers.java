/**
 * 
 */
package com.helper;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @author Huynh Tan Dat last on 15-06-2020 11:28:08

 *
 */
public class helpers {
	static String  appPath = null;
	
	public static String conver(List<?> list) {
		GsonBuilder builder = new GsonBuilder();
		builder.serializeNulls();
		Gson gson = builder.setPrettyPrinting().create();
		return gson.toJson(list);
	}
	
	public static String SaveFile(HttpServletRequest req, Long userDetailId) throws IOException, ServletException {
			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			appPath = req.getServletContext().getRealPath("");
			appPath = appPath.replace('\\', '/');
			String fileName = extractFileName(req.getPart("avatar"), userDetailId);
			if (fileName.equals("default")) {
				return "default.jpg";
			}
			else {
				fileName = new File(fileName).getName();
				req.getPart("avatar").write(getFolderUpload().getAbsolutePath()+ File.separator + fileName);
				return fileName;
			}
	}
	
	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	private static String extractFileName(Part part, Long userDetailId) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return userDetailId.toString() + s.substring(s.indexOf("."), s.length() - 1);
			}
		}
		return "default";
	}

	private static File getFolderUpload() {
		File folderUpload = new File(appPath + "/Uploads");
		if (!folderUpload.exists()) {
			folderUpload.mkdirs();
		}
		return folderUpload;
	}
}
