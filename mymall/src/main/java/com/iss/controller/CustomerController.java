package com.iss.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iss.pojo.Address;
import com.iss.pojo.Customer;
import com.iss.pojo.Integrate;
import com.iss.pojo.Message;
import com.iss.pojo.Order;
import com.iss.pojo.Question;
import com.iss.service.IAddressService;
import com.iss.service.ICustomerService;
import com.iss.service.IOrderService;
import com.iss.utils.EncryptUtil;
import com.iss.service.IMessageService;

/**
 * @Description: 负责用户相关的请求
 * @Version:1.0
 * @author nick
 * @date 2018年7月16日 /user/login.action
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IMessageService messageService;
	
	@Autowired
	private IAddressService addressService;

	@Autowired
	private IOrderService orderService;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/tologin.action")
	public String tologin() {
		return "login";
	}

	@RequestMapping("/tousercenter.action")
	public String tousercenter() {
		return "usercenter";
	}

	
	@RequestMapping("/showpersondata.action")
	public String showpersondata(Model model) {
		
		Customer c = (Customer) session.getAttribute("customer");
		int cid = (int) c.getCid();
		Customer customer =customerService.findbykey(cid);
		model.addAttribute("customer",customer);

		return "personaldata";

	}
	
	@RequestMapping("/mycomment.action")
	public String mycomment(Model model) {


		return "mycomment";

	}
	
	@RequestMapping("/exchangezone.action")
	public String exchangezone(Model model) {


		return "Exchangezone";

	}
	
	
	@RequestMapping("/loginout.action")
	public String loginout() {
		 
		session.removeAttribute("customer");
		return "login";
	}
	
	@RequestMapping("/updatepersondata.action")
	public String updatepersondata(Model model,@RequestParam("picurl_") MultipartFile file,Customer cus) {
		

		Customer c = (Customer) session.getAttribute("customer");
		int cid = (int) c.getCid();
		
		try {
			String name = file.getName();
			String originalFilename = file.getOriginalFilename();
			System.out.println(originalFilename);
			file.transferTo(new File("D:\\pic\\"+file.getOriginalFilename()));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		cus.setPicurl(file.getOriginalFilename());
		cus.setCid(cid);
		
		boolean b= customerService.updatedata(cus);
		
		Customer customer =customerService.findbykey(cid);
		model.addAttribute("customer",customer);

		return "personaldata";

	}
	
	
	@RequestMapping("/getmyintegrate.action")
	public String getmyintegrate(Model model) {
		
		int page=Integer.parseInt(request.getParameter("page"));
		Customer c = (Customer) session.getAttribute("customer");
		int cid = (int) c.getCid();
		List<Order> listorder = (List<Order>) orderService.getOrderByCid(cid);
		model.addAttribute("listorder",listorder);
		model.addAttribute("page",page);
		return "integration";

	}
	
	
	
	@RequestMapping("/addAddress.action")
	public String addAddress(Address address,Model model) {
		
		Customer c = (Customer) session.getAttribute("customer");
		int id=c.getCid();
		int checked=0;
		
		String[] s= request.getParameterValues("defaultaddr");
		
		if(s.length>0) {
			 checked=1;
			 boolean b=addressService.updateUnDefaultByUserKey(id);
			
		}
		address.setDefaultaddr(checked);
		address.setCid(id);
		boolean b= addressService.addAddress(address);
		
		return "address";

	}
	
	@RequestMapping("/deleteAddress.action")
	public String deleteAddress(Address address,Model model) {
		
		String idkey = (String) request.getParameter("idkey");
		int idk=Integer.parseInt(idkey);
		
		boolean b= addressService.deleteAddress(idk);
		
		Customer c = (Customer) session.getAttribute("customer");
		int id=c.getCid();

		List<Address> listaddress = addressService.getAddressByUserKey(id);
		model.addAttribute("listaddress",listaddress);
		
		return "address";

	}
	
	@RequestMapping("/myaddress.action")
	public String myAddress(Model model) {
		
		Customer c = (Customer) session.getAttribute("customer");
		int id=c.getCid();

		List<Address> listaddress = addressService.getAddressByUserKey(id);
		model.addAttribute("listaddress",listaddress);
		
		return "address";

	}
	
	@RequestMapping("/getmymessage.action")
	public String getmymessage(Model model) {
		
		int page=Integer.parseInt(request.getParameter("page"));
		Customer c = (Customer) session.getAttribute("customer");
		int cid = (int) c.getCid();
		List<Message> listmessage = (List<Message>) messageService.getMessageByCid(cid);
		model.addAttribute("listmessage",listmessage);
		
		model.addAttribute("page",page);
		
		return "message";

	}
	
	@RequestMapping("/showmymessage.action")
	public String showmymessage(Model model) {
		
		String id=request.getParameter("id");
		String content=request.getParameter("content");
		String time=request.getParameter("time");
		
		boolean b=messageService.upStateByKey(id);
		
		model.addAttribute("content",content);
		model.addAttribute("id",id);
		model.addAttribute("time",time);
		
		//listorder.get(0).getOrderGoodsname()
		return "messagedetails";

	}
	
	@RequestMapping("/deletemymessage.action")
	public String deletemymessage(Model model) {
		
		String id=request.getParameter("id");
		
		boolean b=messageService.deleteById(id);
		
		Customer c = (Customer) session.getAttribute("customer");
		int cid = (int) c.getCid();
		List<Message> listmessage = (List<Message>) messageService.getMessageByCid(cid);
		model.addAttribute("listmessage",listmessage);
		//listorder.get(0).getOrderGoodsname()
		return "message";

	}

	@RequestMapping("/login.action")
	public String login(@RequestParam("cname") String username, String password, Model model, String vcode) {

		String sessionCode = null;
		Object obj = session.getAttribute("vcode");

		if (obj != null) {
			sessionCode = (String) obj;
		}

		if (!(vcode != null && vcode.equalsIgnoreCase(sessionCode))) {
			model.addAttribute("errMsg", "验证码错误");
			return "login";
		}

		Customer customer = customerService.login(username, password);
		if (customer != null) {
			session.setAttribute("customer", customer);
			return "redirect:/book/toIndex.action";
		} else {
			model.addAttribute("errMsg", "用户名或密码错误");
			return "login";
		}

	}

	@RequestMapping("/zhuce.action")
	public String zhuce() {
		return "regist";
	}

	@RequestMapping("/zhuce1.action")
	public String zhuce1(Customer u) {
		
	    if(u!=null) {
			boolean fg=customerService.codeUser(u.getCname());//检验用户是否已存在
			System.out.println(fg);
			if(fg) {
				request.getSession().setAttribute("zhuce_err", "用户已存在");
				return "regist";
			}else {
				
				//boolean add_question=customerService.insert_question(q);
				boolean add_bool=customerService.zhuce(u);
				if(add_bool) {
					request.getSession().setAttribute("zhuce_suc", "注册成功");
					return "login";
				}
				request.getSession().setAttribute("zhuce_fail", "注册失败");
				return "regist";
			}	
		}
		
		return "regist";
	}

	
	
	
	@RequestMapping("/topassword1.action")
	public String topassword1(){
		return "password_1";
	}
	
	@RequestMapping("/password1.action")
	public String password1(String cname,String vcode,Model model){
		String sessionCode=null;
		Object obj=session.getAttribute("vcode");//图片验证码
		
		if(obj!=null){
			sessionCode=(String)obj;
		}
		if(!(vcode!=null&&vcode.equalsIgnoreCase(sessionCode))){//验证验证码正确
			model.addAttribute("errMsg","验证码错误");
			return "password_1";
		}
		if(cname==null){
			model.addAttribute("errMsg","用户名为空");
			return "password_1";
		}
		boolean fg=customerService.codeUser(cname);
		Question question=customerService.findbyname_question(cname);
		if(!fg){
			model.addAttribute("errMsg", "用户名不存在");
			return "password_1";
		}
		if(question==null){
			model.addAttribute("errMsg","用户注册时未填密保问题，不可修改密码");
			return "password_1";
		}
		session.setAttribute("question", question);
		return "redirect:/customer/topassword2.action";
		
	}
	
	
	@RequestMapping("/topassword2.action")
	public String topassword2(){
		return "password_2";
	}
	@RequestMapping("/password2.action")
	public String password2(String answer1,Model model){
		Question q=(Question)session.getAttribute("question");
		if(answer1.equals(q.getAnswer1()))
		 return "redirect:/customer/topassword3.action";
		else{
			model.addAttribute("errMsg", "答案错误");
		    return "password_2";
		}		 
			
		   
	}
	
	@RequestMapping("/topassword3.action")
	public String topassword3(){
		return "password_3";
	}
	@RequestMapping("/password3.action")
	public String password3(String answer2,Model model){
		Question q=(Question)session.getAttribute("question");
		if(answer2.equals(q.getAnswer2()))
		return "redirect:/customer/topassword4.action";
		else{
			model.addAttribute("errMsg","答案错误");
			return "password_3";
		}
	}
	
	@RequestMapping("/topassword4.action")
	public String topassword4(){
		return "password_4";
	}
	@RequestMapping("/password4.action")
	public String password4(String password,Model model){
		Question q=(Question)session.getAttribute("question");
	    Customer customer=customerService.findbyname(q.getCname());
	    
	    
	    
	    
	    customer.setPassword(password);
	    
	    EncryptUtil.encryptPassword(customer);
		
	    boolean fg=customerService.updatePassword(customer);
	    
	    if(fg){
	    	session.setAttribute("newpsd", password);
	    	session.removeAttribute("question");
	    	return "redirect:/customer/topassword5.action";
	    }    
	    else{
	    	model.addAttribute("errMsg", "更改密码出错");
	        return "password_4";
	    } 
	}
	
	@RequestMapping("/topassword5.action")
	public String topassword5(){
		return "password_5";
	}

	

}
