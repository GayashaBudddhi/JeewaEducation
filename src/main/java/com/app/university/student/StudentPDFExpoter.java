package com.app.university.student;

import java.awt.Color;
import java.io.IOException;
import java.util.List;
 
import javax.servlet.http.HttpServletResponse;

import com.app.university.student.Student;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

public class StudentPDFExpoter {
	
	private List<Student> students;
	
	public StudentPDFExpoter(List<Student> students) {		
		this.students = students;
	}
	
	private void writeTableHeader(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.GRAY);
        cell.setPadding(5);
         
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);
        font.setSize(10);
         
        cell.setPhrase(new Phrase("ID", font));
         
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Name With Initials", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Full Name", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Email", font));
        table.addCell(cell); 
        
        cell.setPhrase(new Phrase("Nic", font));
        table.addCell(cell);
    }
	
	private void writeTableData(PdfPTable table, List<Student> students) {
        for (Student result : students) {
            table.addCell(result.getStudentId() + "");
            table.addCell(result.getNameWithInitials());
            table.addCell(result.getFullName());
            table.addCell(result.getEmail());
            table.addCell(result.getNic());
        }
    }
	
	public void export(HttpServletResponse response, String title) throws DocumentException, IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
         
        document.open();
        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font.setSize(14);
        font.setColor(Color.BLUE);
         
        Paragraph p = new Paragraph(title, font);
        p.setAlignment(Paragraph.ALIGN_CENTER);   
        document.add(p);        
    	
    	PdfPTable table = new PdfPTable(5);
    	table.setWidthPercentage(100f);
        table.setWidths(new float[] {1.5f, 3.5f, 3.0f, 3.0f, 3.0f});
        table.setSpacingBefore(10);
        writeTableHeader(table);
        writeTableData(table, students);
    	
    	document.add(table);         
        document.close();
         
    }
	
}
