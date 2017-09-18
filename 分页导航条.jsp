<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- 
		1.第一个when是判断总页数小于要显示的最大页码数
		2.
	-->
    <c:choose>
            <c:when test="${pageBooks.totalPageNo <= 5 }">
                <c:set var="start" value="1"></c:set>
                <c:set var="end" value="${pageBooks.totalPageNo }"></c:set>
            </c:when>
            <c:when test="${pageBooks.pageNo <= 3 }">
                <c:set var="start" value="1"></c:set>
                <c:set var="end" value="5"></c:set>
            </c:when>
            <c:otherwise>
                <c:set var="start" value="${pageBooks.pageNo - 2 }"></c:set>
                <c:set var="end" value="${pageBooks.pageNo + 2 }"></c:set>
                <c:when test="${pageBooks.pageNo + 2 > pageBooks.totalPageNo }">
                    <c:set var="start" value="${pageBooks.totalPageNo - 4 }"></c:set>
                    <c:set var="start" value="${pageBooks.totalPageNo }"></c:set>
                </c:when>
            </c:otherwise>
        </c:choose>
        <c:if test="${pageBooks.pageNo > 1 }">
            <a href="BookClientServlet?method=getPageBooksByPrice&pageNo=1&min=${minPrice }&max=${maxPrice }">首页</a>
            <a href="BookClientServlet?method=getPageBooksByPrice&pageNo=${pageBooks.pageNo - 1 }&min=${minPrice }&max=${maxPrice }">上一页</a>
        </c:if>
        <c:forEach begin="${start }" end="${end }" var="index">
            <c:if test="${pageBooks.pageNo == index }">
                <a href="BookClientServlet?method=getPageBooksByPrice&pageNo=${index }&min=${minPrice }&max=${maxPrice }">[${pageBooks.pageNo }]</a>
            </c:if>
            <c:if test="${pageBooks.pageNo != index }">
                <a href="BookClientServlet?method=getPageBooksByPrice&pageNo=${index }&min=${minPrice }&max=${maxPrice }">${index }</a>
            </c:if>
        </c:forEach>
        <c:if test="${pageBooks.pageNo < pageBooks.totalPageNo }">
            <a href="BookClientServlet?method=getPageBooksByPrice&pageNo=${pageBooks.pageNo + 1 }&min=${minPrice }&max=${maxPrice }">下一页</a>
            <a href="BookClientServlet?method=getPageBooksByPrice&pageNo=${pageBooks.totalPageNo }&min=${minPrice }&max=${maxPrice }">末页</a>
        </c:if>
            共 ${pageBooks.totalPageNo } 页，${pageBooks.totalNo }条记录 到第<input value="${pageBooks.pageNo }" name="pn" id="pn_input"/>页
            <input type="button" value="确定" id="jumpQuery">
            <script type="text/javascript">
                $(function(){
                    $("#jumpQuery").click(function(){
                        var jumpTo = $("#pn_input").val();
                        location = "BookClientServlet?method=getPageBooksByPrice&pageNo=" + jumpTo;
                    });
                });
            </script>

