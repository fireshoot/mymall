function getmyintegrate() {
	$.ajax({
		type : "post",
		url : "getmyintegrate",
		dataType : "json",
		success : function(msg) {
			// jquery遍历函数
			$("#user_lmt1").append("查询退换货记录");
			$("#user_lmt21").append("共有"+"<b class='red'>"+200+"<b>"+"积分");
			/*$.each(msg, function(i, u) {
				$("#show").append(
						"<p>" + u.orderGoodsname + "," + u.orderGoodsname + "," + u.orderGoodsname
								+ "</p>");
			});*/
		}
	});
}

/**
<div class="user_coment">
				<table width="713" border="0" cellspacing="0" cellpadding="0"
					class="my_dd">
					<tr>
						<th height="48" colspan="4">书籍信息</th>
						<th height="48" colspan="3">我的积分</th>
					</tr>
					<tr>
						<td width="32" height="149"
							style="border-right: none; vertical-align: text-top;"></td>
						<td width="167">
							<div class="dd_img">
								<a href="" target="_blank"><img src="images/user_img.jpg"
									width="132" height="121" /></a>
							</div>

						</td>
						<td colspan="2" style="padding: 0 5px; text-align: left;"><a
							href="" target="_blank">英语阅读理解与完形填空150篇：七年级</a></td>
						<td colspan="3">20</td>
					</tr>
					<tr>
						<td width="32" height="149"
							style="border-right: none; vertical-align: text-top;"></td>
						<td width="167">
							<div class="dd_img">
								<a href="" target="_blank"><img src="images/user_img.jpg"
									width="132" height="121" /></a>
							</div>

						</td>
						<td colspan="2" style="padding: 0 5px; text-align: left;"><a
							href="" target="_blank">英语阅读理解与完形填空150篇：七年级</a></td>
						<td colspan="3">20</td>
					</tr>
				</table>
				
				<!--分页开始 -->
				<div style="clear: both;"></div>
				<div class="fenyeys">
					<a href="">上一页</a> <a href="" class="active">1</a> <a href="">2</a>
					<a href="">3</a> <a href="">4</a> <a href="">5</a> <a href="">下一页</a>
				</div>
				<div style="clear: both;"></div>
				<!--分页结束 -->

			</div>


*/