<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.List"  %>

<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.common.Page" %>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<% System.out.println("page importcom.model2.mvc.common.* Ȯ��");%>

<%--
	Map<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
	Search search=(Search)request.getAttribute("search");
	
	int total=0;
	ArrayList<Product> list=null;
	if(map != null){
		total=((Integer)map.get("count")).intValue();
		list=(ArrayList<Product>)map.get("list");
	}
	System.out.println((String)session.getAttribute("menu"));
	String menu = (String)session.getAttribute("menu");
	int currentPage=search.getPageSize();
 
	int totalPage=0;
	if(total > 0) {
		totalPage= total / search.getPageSize() ;
		if(total%search.getPageSize() >0)
			totalPage += 1;
	}
--%>

<%
	String menu = (String)session.getAttribute("menu");
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>
<% System.out.println("totalPage += 1; Ȯ��");%>
<%--
	ProductVO VO=(ProductVO)session.getAttribute("vo");
--%>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

<%--function fncGetProductList(){
	document.detailForm.submit();
}--%>
function fncGetProductList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
<% System.out.println((String)session.getAttribute("menu"));%>
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do?menu=<%= (String)session.getAttribute("menu")%>" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<% if(menu.equals("manage")) { %>
						��ǰ����

					<% } else  { %>
								
						��ǰ�˻�
					<% } %>
								
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<% System.out.println("��ǰ ���� ����");%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<%
		if(search.getSearchCondition() != null) {
	%>
		<% System.out.println("if(search.getSearchCondition() != null)����");%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
		<%
				if(search.getSearchCondition().equals("0")){
		%>
		<% System.out.println("if(search.getSearchCondition().equals 0 Ȯ��");%>
				<option value="0"selected>��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
				
		<%
				}else if(search.getSearchCondition().equals("1")) {
		%>
		<% System.out.println("if(search.getSearchCondition().equals 1 Ȯ��");%>
				<option value="0">��ǰ��ȣ</option>
				<option value="1"selected>��ǰ��</option>
				<option value="2">��ǰ����</option>		
		<%
		
		
				}else {
		%>
		<% System.out.println("if(search.getSearchCondition().equals 2 Ȯ��");%>
				<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2"selected>��ǰ����</option>		
		<%
			}
		%>
		<% System.out.println("search.getSearchCondition.equals 3 Ȯ��");%>
			</select>
			<input 	type="text" name="searchKeyword"  value="<%=search.getSearchKeyword() %>" 
							class="ct_input_g" style="width:200px; height:19px" >
		</td>
		<%
			}else{
		%>
		
		<% System.out.println("else Ȯ��");%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
			</select>
			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" >
		</td>

		<%
		} 
		%>
		<% System.out.println("��ȣ,��,���� Ȯ��");%>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<% System.out.println("�˻� Ȯ��");%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü  <%= resultPage.getTotalCount() %> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<% System.out.println("listProduct�������");%>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<% 	
		int no=list.size();
		for(int i=0; i<list.size(); i++) {
			Product vo = list.get(i);
	%>
	<% System.out.println("Product vo �� �޾ƿ� ");%>
	<tr class="ct_list_pop">
		<td align="center"><%= no--%></td>
		<td></td>
		<td align="left">
			<a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>&menu=<%= session.getAttribute("menu")%>"><%= vo.getProdName() %></a>
			<% System.out.println("vo.getProdNo ���");%>
		</td>
		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
			<% System.out.println("vo.getPrice ���");%>
		<td></td>
		<td align="left"><%= vo.getManuDate() %></td>
			<% System.out.println("vo.getMaudate");%>
		<td></td>
		<td align="left"> 
		<% System.out.println("vo.�� ���");%>
		�Ǹ���
		
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<% } %>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>
			
		<%--
			for(int i=1;i<=totalPage;i++){
		%>
		<% System.out.println(" tobalpage �Ϸ�)");%>
			<a href="/listProduct.do?page=<%=i%>&menu=<%=menu%> "><%=i %></a>
		<%
			}
		--%>	
		
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
