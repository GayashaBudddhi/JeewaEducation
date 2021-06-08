

package com.app.university.lecture;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;


import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class LecturePDFExpoter {
	
	
	
	private List<Lecture> lectures;
	
	public LecturePDFExpoter(List<Lecture> lectures) {		
		this.lectures = lectures;
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
         
        cell.setPhrase(new Phrase("First Name", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Last Name", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Gender", font));
        table.addCell(cell); 
        
        cell.setPhrase(new Phrase("Email", font));
        table.addCell(cell); 
        
        cell.setPhrase(new Phrase("Nic", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("University", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Status", font));
        table.addCell(cell);
    }
	
	private void writeTableData(PdfPTable table, List<Lecture> lectures) {
        for (Lecture result : lectures) {
            table.addCell(result.getUserId() + "");
            table.addCell(result.getfName());
            table.addCell(result.getlName());
            table.addCell(result.getGender());
            table.addCell(result.getEmail());
            table.addCell(result.getNicNo());
            table.addCell(result.getUniversity());
            table.addCell(result.getStatus());
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
    	
    	PdfPTable table = new PdfPTable(8);
    	table.setWidthPercentage(100f);
        table.setWidths(new float[] {1.5f, 3.5f, 3.0f, 3.0f, 3.0f,5.0f, 4.0f, 4.0f});
        table.setSpacingBefore(10);
        writeTableHeader(table);
        writeTableData(table, lectures);
    	
    	document.add(table);         
        document.close();
         
    }
	
	
	

}
