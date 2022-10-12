package com.sumanth.poc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
	@Autowired
	User user;
	@Autowired
	Bookmark bookmark;
	@Autowired
	UserRepository userRepo;
	@Autowired
	BookmarkRepository bookmarkRepository;

	private Long link_id;

	private String session_user;

	private String session_fname;

	@RequestMapping("/")
	public ModelAndView login() {
		ModelAndView mv= new ModelAndView("login.jsp");
		return mv;
	}

	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView mv=new ModelAndView("register.jsp");
				return mv;
	}

	@RequestMapping(value = "/registersuccess", method = RequestMethod.POST)
	public  ModelAndView registersuccess(User u1) {
		User uv=userRepo.findByUsername(u1.getUsername());
		if (uv==null){
//			ModelAndView mv= new ModelAndView("registererror.jsp");
//			return mv;
			userRepo.save(u1);
			ModelAndView mv= new ModelAndView("regsuccess.jsp");
			return mv;
		}
		else{
			ModelAndView mv= new ModelAndView("registererror.jsp");
			return mv;
//			userRepo.save(u1);
//			ModelAndView mv= new ModelAndView("regsuccess.jsp");
//			return mv;
		}
	}

	@RequestMapping(value = "/loginvalidation", method = RequestMethod.POST)
	public ModelAndView loginvalidation(@RequestParam("username") String username, @RequestParam("password") String password){
		System.out.println(username+" "+password);
		User user1=userRepo.findByUsername(username);
		System.out.println(user1);
		if (user1==null){
			System.out.println("INVALID USERNAME");
			ModelAndView mv= new ModelAndView("login.jsp");
			return mv;
		}
		else if(username.equals(user1.getUsername()) && password.equals((user1.getPassword()))){
			System.out.println("Success");
			session_user=username;
			User uf=userRepo.findByUsername(username);
			session_fname=uf.getFirstName();
			ModelAndView mv= new ModelAndView("welcome.jsp","user",session_fname);
			return mv;
		}
		else{
			System.out.println("Password invalid");
			ModelAndView mv= new ModelAndView("login.jsp");
			return mv;
		}
	}

	@RequestMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mv=new ModelAndView("login.jsp");
		return mv;
	}

	@RequestMapping(value = "/bookmarksuccess", method = RequestMethod.POST)
	public ModelAndView bookmarksuccess(@RequestParam("title") String title,@RequestParam("link") String link){
		System.out.println("title");
		System.out.println("link");
		Bookmark b1= bookmarkRepository.findByLink(link);
		System.out.println(session_user);
		if(b1==null){
			bookmark.setTitle(title);
			bookmark.setLink(link);
			bookmark.setUsername(session_user);
			bookmarkRepository.save(bookmark);
			ModelAndView mv = new ModelAndView("bookmarksuccess.jsp");
			return mv;
		}
		else{
			ModelAndView mv= new ModelAndView("error.jsp");
			return mv;
		}
	}

	@RequestMapping("/list-bookmarks")
	public  ModelAndView listbookmarks() {
		String username=session_user;
		List<Bookmark> lb=bookmarkRepository.findByUsername(username);
		System.out.println(lb);
		ModelAndView mv= new ModelAndView();
		mv.addObject("lb",lb);
		mv.setViewName("view.jsp");
		return mv;
	}

	@RequestMapping("/add-bookmarks")
	public ModelAndView addbookmarks(){
		ModelAndView mv= new ModelAndView("bookmark.jsp");
		return mv;
	}

	@RequestMapping(value = "/edit",method = RequestMethod.POST)
	public ModelAndView edit(@RequestParam("edit_id") Long id,String title, String link){
		System.out.println(id);
		System.out.println(title);
		System.out.println(link);
		link_id=id;
		ModelAndView mv= new ModelAndView("edit_bookmark.jsp");
		mv.addObject("title", title);
		mv.addObject("link",link);
		return mv;
	}

	@RequestMapping("/reset")
	public ModelAndView reset(String title, String link){
		bookmarkRepository.change(title,link,link_id);
		ModelAndView mv = new ModelAndView("editsuccess.jsp");
		return mv;
	}

	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam("delete_id") Long id){
		bookmarkRepository.deleteById(id);
		ModelAndView mv= new ModelAndView("/list-bookmarks");
		return mv;
	}

	@RequestMapping("/forgot")
	public ModelAndView forgot(){
		ModelAndView mv= new ModelAndView("forgot.jsp");
		return mv;
	}

	@RequestMapping("/preset")
	public ModelAndView preset(String username, String password){
		User user=userRepo.findByUsername(username);
		if(user==null){
			ModelAndView mv= new ModelAndView("registererror.jsp");
			return mv;
		}
		else{
			userRepo.change(password, username);
			ModelAndView mv= new ModelAndView("login.jsp");
			return mv;
		}

	}


//	@RequestMapping("/reset")
//	public ModelAndView reset(@RequestParam("username") String username, @RequestParam("password") String password){
//		User user_reset=userRepo.findByUsername(username);
//		if (user_reset==null){
//			System.out.println("INVALID USER");
//			ModelAndView mv= new ModelAndView("login.jsp");
//			return mv;
//		}
//		else if(username.equals(user_reset.getUsername())){
//			System.out.println("Success");
//			user.setUsername(username);
//			user.setPassword(password);
//			userRepo.save(user);
//			ModelAndView mv= new ModelAndView("resetsuccess.jsp");
//			return mv;
//		}
//		else{
//			System.out.println("NO RESET");
//			ModelAndView mv= new ModelAndView("login.jsp");
//			return mv;
//		}
//	}

}
