<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pagination pull-right">
	<ul>
		<li><a href="javascript:previousPage()">&#8249;</a></li>

		<c:forEach begin="${requestScope.data.startAndEnd.start }"
			end="${requestScope.data.startAndEnd.end }" varStatus="status">
			<li
				<c:if test="${status.index == requestScope.data.pageIndex}"> class="active" </c:if>>
				<a
				href="${requestScope.basePath}?targetPageIndex=${status.index }&key=${requestScope.data.key}">
					${status.index} </a>
			</li>
		</c:forEach>

		<li><a href="javascript:nextPage()">&#8250;</a></li>
	</ul>
</div>
<script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery-latest.js"></script>
<script type="text/javascript">

		var baseUrl = "${requestScope.basePath}";

		function previousPage() {
			
			var url = baseUrl+"?targetPageIndex=";
			
	        if ( (${requestScope.data.pageIndex}) <= 1) {
	            url = url+1;
	        }
	        else {
	            url = url+${requestScope.data.pageIndex-1};
	        }
	        if (${!empty requestScope.data.key}) {
	            url +=("&key=${requestScope.data.key}");
	        }
	        window.location.href = url;
	    }
		
		function nextPage(){
			
			var url = baseUrl+"?targetPageIndex=";
			
			if ( (${requestScope.data.pageIndex >= requestScope.data.pageCounts})) {
	            url = url+${requestScope.data.pageCounts};
	        }
	        else {
	            url = url+${requestScope.data.pageIndex+1};
	        }
	        if (${!empty requestScope.data.key}) {
	            url +=("&key=${requestScope.data.key}");
	        }
	        window.location.href = url;
		}
		function searchByLoginName(){
		        var url = baseUrl+"?targetPageIndex=1";
		        if ($("#searchKey").val().trim() != "") {
		            url += "&key=" + $("#searchKey").val();
		            window.location.href = url;
		        }
		        else{
		        	return;
		        }
		}
	</script>