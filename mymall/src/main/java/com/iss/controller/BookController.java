package com.iss.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iss.pojo.Book;
import com.iss.pojo.Comment;
import com.iss.service.IBookService;
import com.iss.vo.IndexBooksVo;
import com.iss.vo.title_sort_data;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private IBookService bookService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/toIndex.action")
	public String toIndex(Model model) throws Exception{
		
		IndexBooksVo books = bookService.selectIndexBooks();
		model.addAttribute("books", books);
		
		
		
		return "index";
	}
	
	@RequestMapping("/cart.action")
	public String cart(Model model) throws Exception{
		
		return "item";
	}
	
	@RequestMapping("/item.action")
	public String item(Model model,HttpServletRequest req) {
		 String id=req.getParameter("bid");
		 
		 Book book=bookService.selectBookDatailByid(id);
		 
		 List<Comment> commentslist=bookService.selectComments(id);
		 
		 System.out.println(commentslist.size()+"dsfgsg");
		 
		 System.out.println(id);
		 model.addAttribute("comment", commentslist);	
		 model.addAttribute("book", book);		
		return "item";
	}
	
	///////////////////////////////////////////////////////////
	//////////////////////无敌分割线///////////////////////////
	//////////////////////////////////////////////////////////
	
	@RequestMapping("/sort.action")
	public String sort(HttpServletRequest req,Model model) {
		
		String _class=req.getParameter("grade");
		String type=req.getParameter("special");
		String page=req.getParameter("page");
		
		int Page=1;
		int Class=0;
		int Type=0;
		if(_class!=null) 
			Class = Integer.parseInt(_class);
		if(type!=null)
			Type = Integer.parseInt(type);
		if(page!=null)
			Page=Integer.parseInt(page);
		
		
		List<Book> books=bookService.selectAllBookByGrade(Class);
		
		List<Book> ALLbooks=bookService.selectALLClassBysp(Type);
		
		int num=ALLbooks.size();
		
		int num1=books.size();
		
		
		
		model.addAttribute("grade",Class);
		model.addAttribute("special",Type);
		model.addAttribute("ID",1);
		model.addAttribute("flag",0);
		
		model.addAttribute("Page",Page);
		if(num!=0) {
			model.addAttribute("books",ALLbooks);
			model.addAttribute("number",num);
			request.getSession().setAttribute("muner1", num);
		}else {
			model.addAttribute("number",num1);
			model.addAttribute("books",books);
			request.getSession().setAttribute("muner1", num);
		}
		
		
		
/*		System.out.println(ALLbooks.size());
		System.out.println(books.size());
		System.out.println("1"+type);
		System.out.println("2"+_class);
		System.out.println("3"+Class);
		System.out.println("4"+Type);*/
		
		return "sort_list";
	}
	
	@RequestMapping("/sort_best.action")
	public String sort_best(HttpServletRequest req,Model model) {
		String id=req.getParameter("id");
		String grade=req.getParameter("grade");
		String special=req.getParameter("special");
		String flag=req.getParameter("flag");
		
		String page=req.getParameter("page");
		
		String issort=req.getParameter("ispage");
		
		int Issort=Integer.parseInt(issort);
		
		int Page=1;
		
		int Glag=0;
		
		int Grade=0;
		int Special=0;
		if(grade!=null) 
			Grade = Integer.parseInt(grade);
		if(special!=null)
			Special = Integer.parseInt(special);
		if(flag!=null)
			Glag=Integer.parseInt(flag);
		if(page!=null)
			Page=Integer.parseInt(page);
		int ID=Integer.parseInt(id);
		Book nBook=new Book();
		if(ID==1) {
			//按销量排序的
			
			if(Grade!=0)
				nBook.setGrade(Grade);
			else if(Special!=0)
				nBook.setSpecialty(Special);
			
			nBook.setSold(1);
			
		}else if(ID==2) {
			//按照价格排序的
			if(Grade!=0)
				nBook.setGrade(Grade);
			else if(Special!=0)
				nBook.setSpecialty(Special);
			
			nBook.setPrice((float)4.2);
		}else if(ID==3) {
			//按照上架日期排序
			if(Grade!=0)
				nBook.setGrade(Grade);
			else if(Special!=0)
				nBook.setSpecialty(Special);
			
			nBook.setUploadbooktime("1");
		}
		List<Book> resoult=null;
		
		if(Issort==0) {
			if(Glag==0) {
				model.addAttribute("flag",1);
				resoult=bookService.selectAndSort(nBook);
			}
			else if(Glag==1){
				model.addAttribute("flag",0);
				resoult=bookService.selectAndSort2(nBook);
			}
		}else if(Issort==1) {
			if(Glag==0) {
				resoult=bookService.selectAndSort(nBook);
			}
			else if(Glag==1){
				resoult=bookService.selectAndSort2(nBook);
			}
			model.addAttribute("flag",Glag);
		}
		int pages=resoult.size()/15;
		
		if(Page<1) {
			Page=1;
		}else if(Page>pages) {
			Page=pages+1;
			model.addAttribute("errorPage","后面已经没有啦");
		}
		
		model.addAttribute("ID",ID);
		System.out.println(Page);
		
		model.addAttribute("Page",Page);
		model.addAttribute("books",resoult);
		model.addAttribute("number",resoult.size());
		model.addAttribute("grade",Grade);
		model.addAttribute("special",Special);
		
		request.getSession().setAttribute("muner1", resoult.size());
		
	/*	System.out.println(ID+"..."+Grade+",,,"+Special);
		System.out.println(resoult.size());*/
		
		
		return "sort_list";
	}
	
	@RequestMapping("/title_sort.action")
	public String title_sort(String search_txt,Model model) {
		//System.out.println(search_txt);
		List<Book> books=bookService.sortByKey(search_txt);
		//System.out.println(books.size());
		
		
		int Page=1;
	
		model.addAttribute("ID",1);
		model.addAttribute("Page",Page);
		model.addAttribute("books",books);
		model.addAttribute("number",books.size());
		model.addAttribute("flag",0);
		model.addAttribute("key",search_txt);
		
		request.getSession().setAttribute("muner1", books.size());
		
		return "title_sort_list";
	}
	
	@RequestMapping("/title_sort_best.action")
	public String title_sort_best(HttpServletRequest req,Model model) {
		String id=req.getParameter("id");
		String key=req.getParameter("key");
		String flag=req.getParameter("flag");
		
		String page=req.getParameter("page");
		
		String issort=req.getParameter("ispage");
		
		int Issort=Integer.parseInt(issort);
		int Page=1;
		
		System.out.println(key);
		
		int Glag=0;
		int ID=Integer.parseInt(id);
		if(flag!=null)
			Glag=Integer.parseInt(flag);
		if(page!=null)
			Page=Integer.parseInt(page);
		title_sort_data data=new title_sort_data();
		Book nBook =new Book();
		if(ID==1) {
			//按销量排序的		
			nBook.setSold(1);	
		}else if(ID==2) {
			//按照价格排序的	
			nBook.setPrice((float)4.2);
		}else if(ID==3) {
			//按照上架日期排序
			nBook.setUploadbooktime("1");
		}
		List<Book> resoult=null;
		data.setKey(key);
		
		System.out.println(data.getKey());
		
		data.setBook(nBook);	
		
		if(Issort==0) {
			if(Glag==0) {
				model.addAttribute("flag",1);
				resoult=bookService.sortByKeySort1(data);
			}
			else if(Glag==1){
				model.addAttribute("flag",0);
				resoult=bookService.sortByKeySort2(data);
			}
		}else if(Issort==1) {
			if(Glag==0) {
				
				resoult=bookService.sortByKeySort1(data);
			}
			else if(Glag==1){
				
				resoult=bookService.sortByKeySort2(data);
			}
			model.addAttribute("flag",Glag);
		}
		
		
		System.out.println(resoult.size());
		

		if(Page<1) {
			Page=1;
		}else if(Page>(resoult.size())/15) {
			Page=resoult.size()/15+1;
			model.addAttribute("errorPage","后面已经没有啦");
		}
		
		model.addAttribute("ID",ID);
		System.out.println(Page);
		model.addAttribute("Page",Page);
		
		model.addAttribute("books",resoult);
		model.addAttribute("number",resoult.size());
		model.addAttribute("key",key);
		request.getSession().setAttribute("muner1", resoult.size());
		
		
		return "title_sort_list";
	}
	
}
