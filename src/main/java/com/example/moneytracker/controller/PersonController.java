package com.example.moneytracker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.moneytracker.entities.Person;
import com.example.moneytracker.entities.User;
import com.example.moneytracker.services.PersonService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/people")
public class PersonController {

	@Autowired
	private PersonService personService;

	// Show Add Form
	@GetMapping("/")
	public String showAddForm(Model model) {
		model.addAttribute("person", new Person());  // send that empty object to JSP for form binding [empty object will return to jsp]
		return "addperson";
	}

	// Save New Person
	@PostMapping("/save")
	public String savePerson(@ModelAttribute Person person, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		person.setUser(user);
		personService.save(person);
		return "redirect:/dashboard/";
	}

	// View All People
	@GetMapping("/view")
	public String viewPeople(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		List<Person> people = personService.getAllByUserId(user.getId());
		model.addAttribute("people", people);
		return "viewpeople";
	}

	// Show Edit Form
	@GetMapping("/edit")
	public String showEdit(@RequestParam("id") Integer id, HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		Person person = personService.findById(id);

		if (person == null || !person.getUser().getId().equals(user.getId())) {
			return "redirect:/people/view"; // Guard: Only owner can edit
		}

		model.addAttribute("person", person);
		return "addperson"; // Reuse add form for editing
	}

	// Handle Edit
	@PostMapping("/update")
	public String updatePerson(@ModelAttribute Person person, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		Person existing = personService.findById(person.getId());

		if (existing == null || !existing.getUser().getId().equals(user.getId())) {
			return "redirect:/people/view";
		}

		existing.setName(person.getName());
		existing.setSurname(person.getSurname());
		existing.setMobile(person.getMobile());
		existing.setEmail(person.getEmail());
		existing.setAddress(person.getAddress());

		personService.save(existing);
		return "redirect:/people/view";
	}

	// Delete Person
	@GetMapping("/delete")
	public String deletePerson(@RequestParam("id") Integer id, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		Person person = personService.findById(id);

		if (person != null && person.getUser().getId().equals(user.getId())) {
			personService.deleteById(id);
		}
		return "redirect:/people/view";
	}

}