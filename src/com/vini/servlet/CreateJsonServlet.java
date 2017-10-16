package com.vini.servlet;

import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.Writer;

import com.vini.tools.JsonFormatTool;


@WebServlet("/CreateJsonServlet")
public class CreateJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateJsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
     * ����.json��ʽ�ļ�
     */
    public static boolean createJsonFile(String jsonString, String filePath, String fileName) {
        // ����ļ������Ƿ�ɹ�
        boolean flag = true;

        // ƴ���ļ�����·��File.separator
        String fullPath = filePath + "/" + fileName + ".json";
        
        System.out.println(fullPath);

        // ����json��ʽ�ļ�
        try {
            // ��֤����һ�����ļ�
            File file = new File(fullPath);
            if (!file.getParentFile().exists()) { // �����Ŀ¼�����ڣ�������Ŀ¼
                file.getParentFile().mkdirs();
            }
            if (file.exists()) { // ����Ѵ���,ɾ�����ļ�
                file.delete();
            }
            file.createNewFile();
            
            // ��ʽ��json�ַ���
            jsonString = JsonFormatTool.formatJson(jsonString);

            // ����ʽ������ַ���д���ļ�
            Writer write = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            write.write(jsonString);
            write.flush();
            write.close();
        } catch (Exception e) {
            flag = false;
            e.printStackTrace();
        }

        // �����Ƿ�ɹ��ı��
        return flag;
    }
}
