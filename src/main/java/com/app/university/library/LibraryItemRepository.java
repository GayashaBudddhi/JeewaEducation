package com.app.university.library;
import java.util.List;

import org.springframework.data.repository.CrudRepository;  

public interface LibraryItemRepository extends CrudRepository<LibraryItem, Integer> {
	
	LibraryItem findById(int id);
	
	List<LibraryItem> findBytype(String type);
	
	List<LibraryItem> findByTypeContainingAndNameContaining(String type, String name);
	
}
