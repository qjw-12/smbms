<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%
	if (session.getAttribute("providerList")==null){
		response.sendRedirect("../provider/management.do");
	}
%>
<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面</span>
        </div>
        <div class="search">
        	<form method="get" action="${pageContext.request.contextPath }/provider/management.do">
				<input type="hidden" name="pageIndex" value="1"/>
				<span>供应商编码：</span>
				<input name="queryProCode" type="text" value="">
				
				<span>供应商名称：</span>
				<input name="queryProName" type="text" value="">

				<input value="查 询" type="submit" id="searchbutton">
				<a href="/provider/provideradd.do">添加供应商</a>
			</form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach var="provider" items="${providerList}" varStatus="status">
				<tr>
					<td>
					<span>${provider.proCode }</span>
					</td>
					<td>
					<span>${provider.proName }</span>
					</td>
					<td>
					<span>${provider.proContact}</span>
					</td>
					<td>
					<span>${provider.proPhone}</span>
					</td>
					<td>
					<span>${provider.proFax}</span>
					</td>
					<td>
					<span>
					<c:out value="${provider.creationDate}"></c:out>
					</span>
					</td>
					<td>
					<span><a class="viewProvider" href="javascript:;" proid=${provider.id } proname=${provider.proName }><img src="${pageContext.request.contextPath }/static/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyProvider" href="javascript:;" proid=${provider.id } proname=${provider.proName }><img src="${pageContext.request.contextPath }/static/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteProvider" href="javascript:;" proid=${provider.id } proname=${provider.proName }><img src="${pageContext.request.contextPath }/static/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
        </table>
		<input type="hidden" id="totalPageCount" value="${pageBean.totalPage}"/>
		<c:import url="rollpage.jsp">
			<c:param name="totalCount" value="${pageBean.totalRecord}"/>
			<c:param name="currentPageNo" value="${pageBean.pageNum}"/>
			<c:param name="totalPageCount" value="${pageBean.totalPage}"/>
		</c:import>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>
<%
	session.removeAttribute("providerList");
	session.removeAttribute("pageBean");
	session.removeAttribute("proName");
	session.removeAttribute("proCode");
%>
<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/providerlist.js"></script>