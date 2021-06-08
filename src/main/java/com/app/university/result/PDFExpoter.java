package com.app.university.result;

import java.awt.Color;
import java.io.IOException;
import java.util.List;
 
import javax.servlet.http.HttpServletResponse;

import com.app.university.student.Student;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

public class PDFExpoter {
	
	private Student student;
	private List<StudentExam> exams;
	
	public PDFExpoter(Student student, List<StudentExam> exams) {
		this.student = student;
		this.exams = exams;
	}
	
	private void writeTableHeader(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.GRAY);
        cell.setPadding(5);
         
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);
        font.setSize(10);
         
        cell.setPhrase(new Phrase("Subject Code", font));
         
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Subject Name", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Marks", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Grade", font));
        table.addCell(cell);             
    }
	
	private void writeTableData(PdfPTable table, List<ExamResult> results) {
        for (ExamResult result : results) {
            table.addCell(result.getSubjectCode());
            table.addCell(result.getSubjectName());
            table.addCell(result.getMarks() + "");
            table.addCell(result.getGrade());
        }
    }
	
	public void export(HttpServletResponse response) throws DocumentException, IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
         
        document.open();
        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font.setSize(14);
        font.setColor(Color.BLUE);
         
        Paragraph p = new Paragraph("Student Result Sheet", font);
        p.setAlignment(Paragraph.ALIGN_CENTER);
        
        Font font2 = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font2.setSize(10);
        font2.setColor(Color.BLACK);
        Paragraph p1 = new Paragraph("Name With Initials - " + student.getNameWithInitials(), font2);
        Paragraph p2 = new Paragraph("Full Name - " + student.getFullName(), font2);
        Paragraph p3 = new Paragraph("NIC - " + student.getNic(), font2);
        Paragraph p4 = new Paragraph("Email - " + student.getEmail(), font2);
        Paragraph p5 = new Paragraph("Address - " + student.getAddress(), font2);
        Paragraph p6 = new Paragraph(" ", font2);
         
        document.add(p);
        document.add(p1);
        document.add(p2);
        document.add(p3);
        document.add(p4);
        document.add(p5);
        document.add(p6);
        
        for (StudentExam exam : exams) {
        	Paragraph p10 = new Paragraph("Year - " + exam.getYear() + "  |  Semester - " + exam.getSemester() + "  |  Index No - " + exam.getIndexNo(), font2);
        	PdfPTable table = new PdfPTable(4);
        	table.setWidthPercentage(100f);
            table.setWidths(new float[] {1.5f, 3.5f, 3.0f, 3.0f});
            table.setSpacingBefore(10);
            writeTableHeader(table);
            writeTableData(table, exam.getExamResults());
        	
        	document.add(p10);
        	document.add(table);
        }
         
//        PdfPTable table = new PdfPTable(5);
//        table.setWidthPercentage(100f);
//        table.setWidths(new float[] {1.5f, 3.5f, 3.0f, 3.0f, 1.5f});
//        table.setSpacingBefore(10);
         
        //writeTableHeader(table);
        //writeTableData(table);
         
        //document.add(table);
         
        document.close();
         
    }
	
}
