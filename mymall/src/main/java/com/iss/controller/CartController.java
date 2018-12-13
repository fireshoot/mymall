package com.iss.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.stat.TableStat.Mode;
import com.iss.pojo.Address;
import com.iss.pojo.Cart;
import com.iss.pojo.Collect;
import com.iss.pojo.Order;
import com.iss.service.ICartService;
import com.iss.service.ICollectService;
import com.iss.service.IOrderService;
import com.iss.vo.CidAndBid;
import com.iss.vo.adressAndGoods;

@Controller
@RequestMapping("/cart")
public class CartController {



	
	@Autowired
	private ICartService cartService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private ICollectService collectService;
	List<Cart> cartItems;
	int session_cid;


	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;

	//////////////////////////////////////////////////////////////////
	/////////////////////////// 分割线/////////////////////////////////
	///////////////////////////////////////////////////////////////////

	@RequestMapping("/test.action")
	public String Test() {
		return "buy_address";
	}

	@RequestMapping("/toAddCart.action")
	public String toCart1(Cart c) {

		 System.out.println(c.getBname()+ c.getBuynum()+","+ c.getBid()+ c.getBid());

		if (c.getCid() != null) {
			boolean isadd = false;
			List<Cart> list = null;
			CidAndBid cAndBid = new CidAndBid();
			cAndBid.setBid(c.getBid());
			cAndBid.setCid(c.getCid());
			c.setAmount(c.getUnitprice() * c.getBuynum() + 10);
			boolean flag = cartService.isExByCidAndBid(cAndBid);
			if (flag == false) {
				isadd = cartService.addToCart(c);
			} else {
				request.getSession().setAttribute("Added", "已经添加");
				return "cart";
			}

			if (isadd) {
				list = cartService.findCartByCid(c.getCid());

				session.setAttribute("cartItems", list);
				return "cart";
			} else {
				request.getSession().setAttribute("addCartError", "添加购物车失败！");
				return "index";
			}
		} else {
			request.getSession().setAttribute("addCartNeedCid", "添加购物车请登录");
			return "login";
		}

	}

	@RequestMapping("/showCart.action")
	public String showCart(HttpServletRequest req) {
		String cid = req.getParameter("cid");

		if (cid != null) {
			int Cid = Integer.parseInt(cid);
			List<Cart> list = null;
			list = cartService.findCartByCid(Cid);
			session.setAttribute("cartItems", list);
			return "cart";
		} else {
			session.setAttribute("addCartNeedCid", "添加购物车请登录");
			return "login";
		}

	}

	//////////////////////////////////////////////////////////////////
	/////////////////////////// 分割线/////////////////////////////////
	///////////////////////////////////////////////////////////////////

	@RequestMapping("/toCart.action")
	public String toCart(Model model, HttpServletRequest request) throws Exception {
		session_cid = Integer.parseInt(request.getParameter("cid"));

		session = request.getSession();
		if (session.getAttribute("session_cid") == null)
			session.setAttribute("session_cid", session_cid);

		cartItems = cartService.findCartByCid(session_cid);

		System.out.println(cartItems.size());

		session.setAttribute("cartItems", cartItems);

		return "cart";
	}

	@RequestMapping("/cartMethod.action")
	public void cartMethod(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getParameter("method");
		switch (method) {
		case "delCart":
			int id = Integer.parseInt(request.getParameter("id"));
			boolean flag = cartService.deleteById(id);
			if (flag) {
				cartItems = cartService.findCartByCid(session_cid);
			}
			session.setAttribute("cartItems", cartItems);
			response.sendRedirect("toCart.action?cid=" + session_cid);
			break;
		case "batchDelCart":
			String ids = request.getParameter("ids");
			System.out.println(ids);
			String idsArr[] = ids.split(",");
			System.out.println(idsArr.length);
			// System.out.println(idsArr[0]+""+idsArr[1]+idsArr[2]);
			for (String cartidStr : idsArr) {
				int cartidInt = Integer.parseInt(cartidStr);
				cartService.deleteById(cartidInt);
			}
			cartItems = cartService.findCartByCid(session_cid);
			session.setAttribute("cartItems", cartItems);
			// return "cart";
			response.sendRedirect("toCart.action?cid=" + session_cid);
			break;
		case "toBuyAddress":
			String selectIds[] = request.getParameterValues("id");
			// System.out.println(selectIds[0]+""+selectIds[1]+selectIds.length);
			// List<Cart> selectCarts=new ArrayList<Cart>();
			Order record = new Order();
			for (String select_id : selectIds) {
				for (Cart cart : cartItems) {
					int selectid = Integer.parseInt(select_id);
					if (selectid == cart.getId()) {// 插入订单表
						record.setOrderUserid(cart.getCid());
						record.setOrderGoodsid(Integer.parseInt(cart.getBid()));
						record.setOrderGoodsname(cart.getBname());
						record.setOrderCount(cart.getBuynum());
						record.setOrderUnitprice(cart.getUnitprice());
						record.setOrderPrice(cart.getAmount());
						record.setOrderDate(new Date());
						record.setOrderState(0);

						record.setOrderAddress("");
						record.setOrderPaymenttype("");
						record.setOrderPostage(0.0);
						record.setOrderDeliverytype("");

						int row = orderService.add(record);
						if (row > 0) {
							System.out.println("订单表插入成功 bid：" + cart.getBid());
							/* 从购物车中删除选中的项 */
							boolean delFlag = cartService.deleteById(cart.getId());
							if (delFlag) {
								System.out.println("购物车表删除成功 bid：" + cart.getBid());
							}
						}
					}
				}
			}
			// session = request.getSession();
			// session.setAttribute("selectCarts", selectCarts);
			response.sendRedirect("toBuyAddress.action");
			break;
		default:
			break;
		// return "cart";
		}
	}

	@RequestMapping("/updateCart.action")
	@ResponseBody // 此注解不能省略 否则ajax无法接受返回值
	public String updateCart(String id, String count) {
		int cartId = Integer.parseInt(id);
		int updateNum = Integer.parseInt(count);
		Cart cart = cartService.findCartById(cartId);
		cart.setBuynum(updateNum);
		cart.setAmount(updateNum * cart.getUnitprice());
		System.out.println("add and minus");
		cartService.updateCart(cart);
		cartItems = cartService.findCartByCid(session_cid);
		session.setAttribute("cartItems", cartItems);
		return "Ok";
	}

	//////////////////////////////////////////////////////////////////
	/////////////////////////// 分割线/////////////////////////////////
	/////////////////////////////////////////////////////////////////
	/*
	 * 以下是订单操作
	 */

	@RequestMapping("/ .action")
	public String confirmToBuyGoods(Model model) {

		int cid = 14; // 分开写的暂时没有前台传过来的数据

		adressAndGoods list = cartService.findAddressByCid(cid);

		System.out.println(list.getOrder().size() + "," + list.getAddress().size());

		model.addAttribute("pageVO", list);
		model.addAttribute("cid", cid);
		return "buy_address";
	}

	@RequestMapping("/insertAddress.action")
	public String insertAddress(Address address, String address2, Model model) {
		System.out.println(address.getCid() + ",,," + address.getName());

		boolean flag = cartService.insertAddress(address);

		if (address2 != null) {
			if (Integer.parseInt(address2) == 1)
				address.setDefaultaddr(0);
		}

		adressAndGoods list = cartService.findAddressByCid(address.getCid());

		System.out.println(list.getOrder().size() + "," + list.getAddress().size());

		model.addAttribute("pageVO", list);
		model.addAttribute("cid", address.getCid());

		return "buy_address";
	}

	@RequestMapping("/collect.action")
	@ResponseBody // 此注解不能省略 否则ajax无法接受返回值
	public String collect(String bookid) {

		System.out.println("bookid:" + bookid);
		int bid = Integer.parseInt(bookid);
		System.out.println("cid:" + session_cid);

		Collect record = collectService.findByBidAndCid(bid, session_cid);

		if (record == null) {
			boolean flag = collectService.addCollect(bookid, session_cid);
			if (flag) {
				System.out.println("collect Ok");
				return "Ok";
			} else {
				System.out.println("collect Failure");
				return "Failure";
			}
		} else {
			System.out.println("no need to collect");
			return "haveRecord";
		}
	}

	@RequestMapping("/toBuyAddress.action")
	public String toBuyAddress() throws Exception {
		return "buy_address";
	}

}
