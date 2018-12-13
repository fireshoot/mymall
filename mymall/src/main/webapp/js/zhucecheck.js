/**
 * author by yangxin
 */
function checkname() {
	username = document.getElementById("nickname");
	tip = document.getElementById("tip_name");
	reg = /^[a-zA-Z0-9]{6,20}$/;

	if (!reg.test(username.value)) {
		tip.innerHTML = "用户为6-20的字符";
		return false;
	} else {
		tip.innerHTML = " ";
		return true;
	}
}

function checkpsd1() {
	password = document.getElementById("password");
	tip = document.getElementById("tip_password");
	reg = /^[a-zA-Z0-9]{6,20}$/;

	if (!reg.test(password.value)) {
		tip.innerHTML = "密码为6-20的字母或者数字组成";
		return false;
	} else {
		tip.innerHTML = " ";
		return true;
	}
}

function checkpsd2() {
	password = document.getElementById("password");
	password_new = document.getElementById("password1");
	tip = document.getElementById("tip_password1");
	reg = /^[a-zA-Z0-9]{6,20}$/;

	if (password.value != password_new.value) {
		tip.innerHTML = "两次密码不一致";
		return false;
	} else {
		tip.innerHTML = " ";
		return true;
	}
}

function checkemail() {
	email = document.getElementById("email");
	tip = document.getElementById("tip_email");
	reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
	if (!reg.test(email.value)) {
		tip.innerHTML = "邮件格式不正确";
		return false;
	} else {
		tip.innerHTML = " ";
		return true;
	}
}

function checkphone() {
	phone = document.getElementById("phone");
	tip = document.getElementById("tip_phone");
	reg = /^1[34578][0-9]{9}$/;
	if (!reg.test(phone.value)) {
		tip.innerHTML = "电话格式不正确(11位)";
		return false;
	} else {
		tip.innerHTML = " ";
		return true;
	}
}

function checkqq() {
	qq = document.getElementById("qq");
	tip = document.getElementById("tip_qq");
	reg = /^[1-9][0-9]{5,14}$/;
	if (!reg.test(qq.value)) {
		tip.innerHTML = "QQ格式不正确(最少6位)";
		return false;
	} else {
		tip.innerHTML = " ";
		return true;
	}
}

function checkread() {
	if (document.getElementById("agreement").checked) {
		return true;
	} else {
		alert("请勾选阅读选项");
		return false;
	}
}

function checkAll() {

	if (checkname() && checkpsd1() && checkpsd2() && checkemail()
			&& checkphone() && checkqq()) {
		
		if (document.getElementById("agreement").checked) {
			return true;
		} else {
			alert("请勾选阅读选项");
			return false;
		}

	} else {
		alert("不能为空");
		return false;
	}
}
