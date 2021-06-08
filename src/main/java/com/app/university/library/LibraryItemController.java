package com.app.university.library;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.result.ExamResult;
import com.app.university.result.StudentExam;
import com.app.university.study_material.StudyMaterial;
import com.app.university.user.UserProfile;

@Controller
public class LibraryItemController {
	
	@Autowired
	private LibraryItemService libraryItemSerive;
	
	@GetMapping(value="/library-items")
    public ModelAndView showLoginPage(ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		return new ModelAndView("library/items", map);
    }
	
	
	@GetMapping(value="/library-item-add")
    public ModelAndView addlibraryItem(ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		map.addAttribute("libraryItem", new LibraryItem());
		return new ModelAndView("library/item", map);
    }
	
	
	@GetMapping(value="/library-item-view/{id}")
    public ModelAndView viewLibraryItem(ModelMap map, @PathVariable("id") int id){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		map.addAttribute("libraryItem", libraryItemSerive.getLibraryItem(id));
		return new ModelAndView("library/item", map);
    }
	
	
	@PostMapping(value="/library-item-save")
	public ModelAndView saveLibraryItem(@Valid LibraryItem libraryItem, BindingResult bindingResult, ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		if (bindingResult.hasErrors()) {		
			
			return new ModelAndView("library/item", map);
        }
		libraryItemSerive.saveOrUpdate(libraryItem);		
		
		return new ModelAndView("redirect:/library-item-view/" + libraryItem.getId(), map);
    }
	
	
	@GetMapping(value="/library-item-delete/{id}")
    public ModelAndView deleteLibraryitem(ModelMap map, @PathVariable("id") int id){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		LibraryItem libraryItem = libraryItemSerive.deleteItem(id);
		return new ModelAndView("redirect:/library-items" , map);
    }
	
	
	@GetMapping(value="/library-items-list")
    public @ResponseBody HashMap<String, Object> getLibraryItems(){
		
		HashMap<String, Object> data = new HashMap<>();			
		
		data.put("data", libraryItemSerive.getAllLibraryItems());
		return data;
    }
	
	
	//e library system ........................................................................
	
	@GetMapping(value="/e-library")
    public ModelAndView eLibraryHome(ModelMap map){
		return new ModelAndView("library/home", map);
    }
	
	
	@GetMapping(value="/e-library-search/{type}")
    public ModelAndView eLibraryHome(ModelMap map, @PathVariable("type") String type, @RequestParam(required = false, value="") String search){
		
		if(type.equals("All")) {
			map.addAttribute("items", libraryItemSerive.searchLibraryItems("", search));
		}
		else {
			map.addAttribute("items", libraryItemSerive.searchLibraryItems(type, search));
		}
		map.addAttribute("type", type);
		map.addAttribute("search", search);
		return new ModelAndView("library/search", map);
    }
	
	
	@GetMapping(value="/e-library-download-item/{id}")
    public ResponseEntity<byte[]> download(ModelMap map, @PathVariable("id") int id) throws IOException{
		
    	ResponseEntity<byte[]> response = null;
    	LibraryItem item = libraryItemSerive.getLibraryItem(id);
		File file = new File(item.getFilePath());
		Path path = Paths.get(file.getPath());
		byte[] contents = Files.readAllBytes(path);
		
		String extension = "";
	    int lastIndexOf = file.getName().lastIndexOf(".");
	    if (lastIndexOf == -1) {
	    	extension = ""; // empty extension
	    }
	    extension = file.getName().substring(lastIndexOf);

        HttpHeaders headers = new HttpHeaders();	    		      
        MediaType mt =  MediaType.parseMediaType(Files.probeContentType(path));
        headers.setContentType(mt);	    		     
        String filename = item.getName() + extension;
        headers.setContentDispositionFormData(filename, filename);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        response = new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
        return response;
    }
    
    //Download exam papers
    @GetMapping(value="/e-library-download-exam/{id}")
    public ResponseEntity<byte[]> downloadExam(ModelMap map, @PathVariable("id") int id) throws IOException{
		
    	ResponseEntity<byte[]> response = null;
    	StudyMaterial item = libraryItemSerive.getStudyMaterial(id);
		File file = new File(item.getFilePath());
		Path path = Paths.get(file.getPath());
		byte[] contents = Files.readAllBytes(path);
		
		String extension = "";
	    int lastIndexOf = file.getName().lastIndexOf(".");
	    if (lastIndexOf == -1) {
	    	extension = ""; // empty extension
	    }
	    extension = file.getName().substring(lastIndexOf);

        HttpHeaders headers = new HttpHeaders();	    		      
        MediaType mt =  MediaType.parseMediaType(Files.probeContentType(path));
        headers.setContentType(mt);	    		     
        String filename = item.getDocumentId() + extension;
        headers.setContentDispositionFormData(filename, filename);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        response = new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
        return response;
    }
    
    
    @GetMapping(value="/e-library-exams")
    public ModelAndView onlineExams(ModelMap map, @RequestParam(required = false, value="") String search,
    		@RequestParam(required = false) Integer subjectId){
		
		if(subjectId == null || subjectId == 0) {
			map.addAttribute("items", libraryItemSerive.searchOnlineExamsWithoutSubject(search));
		}
		else {
			map.addAttribute("items", libraryItemSerive.searchOnlineExamsWithSubject(subjectId, search));
		}
		
		map.addAttribute("subjectId", subjectId);
		map.addAttribute("search", search);
		map.addAttribute("subjects", libraryItemSerive.getAllSubjects());
		return new ModelAndView("library/online_exams", map);
    }
}
