<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.oracle.xiaomi.pojo.*" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript">
        if ("${msg}" != "") {
            alert("${msg}");
        }
    </script>
    <c:remove var="msg"></c:remove>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bright.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addBook.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <title></title>
</head>
<script type="text/javascript">
    function allClick() {
        //取得全选复选框的选中未选 中状态
        var ischeck=$("#all").prop("checked");
        //将此状态赋值给每个商品列表里的复选框
        $("input[name=ck]").each(function () {
            this.checked=ischeck;
        });
    }

    function ckClick() {
        //取得所有name=ck的被选中的复选框
        var length=$("input[name=ck]:checked").length;
//取得所有name=ck的复选框
        var len=$("input[name=ck]").length;
        //比较
        if(len == length){
            $("#all").prop("checked",true);
        }else
        {
            $("#all").prop("checked",false);
        }
    }
</script>
<body>
<div id="brall">
    <div id="nav">
        <p>商品管理>商品列表</p>
    </div>
    <div id="condition" style="text-align: center">
        <form id="myform">
            商品名称：<input name="pname" id="pname">&nbsp;&nbsp;&nbsp;
            商品类型：<select name="typeid" id="typeid">
            <option value="-1">请选择</option>
            <c:forEach items="${ptlist}" var="pt">
                <option value="${pt.typeId}">${pt.typeName}</option>
            </c:forEach>
        </select>&nbsp;&nbsp;&nbsp;
            价格：<input name="lprice" id="lprice">-<input name="hprice" id="hprice">
            <input type="button" value="查询" onclick="ajaxsplit(${pb.pageNum})">
        </form>
    </div>
    <br>
    <div id="table">

        <c:choose>
            <c:when test="${pb.list.size()!=0}">

                <div id="top">
                    <input type="checkbox" id="all" onclick="allClick()" style="margin-left: 50px">&nbsp;&nbsp;全选
                    <a href="${pageContext.request.contextPath}/admin/addproduct.jsp">

                        <input type="button" class="btn btn-warning" id="btn1"
                               value="新增商品">
                    </a>
                    <input type="button" class="btn btn-warning" id="btn1"
                           value="批量删除" onclick="deleteBatch(${pb.pageNum})">
                </div>
                <!--显示分页后的商品-->
                <div id="middle">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th></th>
                            <th>商品名</th>
                            <th>商品介绍</th>
                            <th>定价（元）</th>
                            <th>商品图片</th>
                            <th>商品数量</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pb.list}" var="p">
                            <tr>
                                <td valign="center" align="center"><input type="checkbox" name="ck" id="ck" value="${p.pId}" onclick="ckClick()"></td>
                                <td>${p.pName}</td>
                                <td>${p.pContent}</td>
                                <td>${p.pPrice}</td>
                                <td><img width="55px" height="45px"
                                         src="${pageContext.request.contextPath}/image_big/${p.pImage}"></td>
                                <td>${p.pNumber}</td>
                                    <%--<td><a href="${pageContext.request.contextPath}/admin/product?flag=delete&pid=${p.pId}" onclick="return confirm('确定删除吗？')">删除</a>--%>
                                    <%--&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/product?flag=one&pid=${p.pId}">修改</a></td>--%>
                                <td>
                                    <button type="button" class="btn btn-info "
                                            onclick="one(${p.pId},${pb.pageNum})">编辑
                                    </button>
                                    <button type="button" class="btn btn-warning" id="mydel"
                                            onclick="del(${p.pId},${pb.pageNum})">删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <!--分页栏-->
                    <div id="bottom">
                        <div>
                            <nav aria-label="..." style="text-align:center;">
                                <ul class="pagination">
                                    <li>
                                            <%--                                        <a href="${pageContext.request.contextPath}/prod/split.action?page=${pb.prePage}" aria-label="Previous">--%>
                                        <a href="javascript:ajaxsplit(${pb.prePage})" aria-label="Previous">

                                            <span aria-hidden="true">«</span></a>
                                    </li>
                                    <c:forEach begin="1" end="${pb.pages}" var="i">
                                        <c:if test="${pb.pageNum==i}">
                                            <li>
                                                    <%--                                                <a href="${pageContext.request.contextPath}/prod/split.action?page=${i}" style="background-color: grey">${i}</a>--%>
                                                <a href="javascript:ajaxsplit(${i})"
                                                   style="background-color: grey">${i}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${pb.pageNum!=i}">
                                            <li>
                                                    <%--                                                <a href="${pageContext.request.contextPath}/prod/split.action?page=${i}">${i}</a>--%>
                                                <a href="javascript:ajaxsplit(${i})">${i}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <li>
                                        <%--  <a href="${pageContext.request.contextPath}/prod/split.action?page=1" aria-label="Next">--%>
                                        <a href="javascript:ajaxsplit(${pb.nextPage})" aria-label="Next">
                                            <span aria-hidden="true">»</span></a>
                                    </li>
                                    <li style=" margin-left:150px;color: #0e90d2;height: 35px; line-height: 35px;">总共&nbsp;&nbsp;&nbsp;<font
                                            style="color:orange;">${pb.pages}</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <c:if test="${pb.pageNum!=0}">
                                            当前&nbsp;&nbsp;&nbsp;<font
                                            style="color:orange;">${pb.pageNum}</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${pb.pageNum==0}">
                                            当前&nbsp;&nbsp;&nbsp;<font
                                            style="color:orange;">1</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:if>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div>
                    <h2 style="width:1200px; text-align: center;color: orangered;margin-top: 100px">暂时没有符合条件的商品！</h2>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!--编辑的模式对话框-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新增商品</h4>
            </div>
            <div class="modal-body" id="addTD">
                <form action="${pageContext.request.contextPath}/admin/product?flag=save" enctype="multipart/form-data"
                      method="post" id="myform">
                    <table>
                        <tr>
                            <td class="one">商品名称</td>
                            <td><input type="text" name="pname" class="two" class="form-control"></td>
                        </tr>
                        <!--错误提示-->
                        <tr class="three">
                            <td class="four"></td>
                            <td><span id="pnameerr"></span></td>
                        </tr>
                        <tr>
                            <td class="one">商品介绍</td>
                            <td><input type="text" name="pcontent" class="two" class="form-control"></td>
                        </tr>
                        <!--错误提示-->
                        <tr class="three">
                            <td class="four"></td>
                            <td><span id="pcontenterr"></span></td>
                        </tr>
                        <tr>
                            <td class="one">定价</td>
                            <td><input type="number" name="pprice" class="two" class="form-control"></td>
                        </tr>
                        <!--错误提示-->
                        <tr class="three">
                            <td class="four"></td>
                            <td><span id="priceerr"></span></td>
                        </tr>

                        <tr>
                            <td class="one">图片介绍</td>
                            <td><input type="file" name="pimage" class="form-control"></td>
                        </tr>
                        <tr class="three">
                            <td class="four"></td>
                            <td><span></span></td>
                        </tr>

                        <tr>
                            <td class="one">总数量</td>
                            <td><input type="number" name="pnumber" class="two" class="form-control"></td>
                        </tr>
                        <!--错误提示-->
                        <tr class="three">
                            <td class="four"></td>
                            <td><span id="numerr"></span></td>
                        </tr>


                        <tr>
                            <td class="one">类别</td>
                            <td>
                                <select name="typeid" class="form-control">
                                    <c:forEach items="${typeList}" var="type">
                                        <option value="${type.typeId}">${type.typeName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <!--错误提示-->
                        <tr class="three">
                            <td class="four"></td>
                            <td><span></span></td>
                        </tr>

                        <tr>
                            <td>
                                <input type="submit" class="btn btn-success" value="提交" class="btn btn-success">
                            </td>
                            <td>
                                <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
</body>
<!--弹出新增模式对话框-->
<script type="text/javascript">
    $(function () {
        $(".btn-info").on("click", function () {
            //浏览不关，第二次打开时要清空
            $("#myModal").modal("hide");
        });
        //新增学生非空判断
        $(".btn-success").on("click", function () {
            $("#myModal").modal("hide");
        });
    });
</script>
<script type="text/javascript">
    function mysubmit() {
        $("#myform").submit();
    }

    //批量删除
    function deleteBatch(page) {
        if (confirm("确定删除吗")) {
            //取得所有被选中删除商品的pid
            var zhi=$("input[name=ck]:checked");
            var str="";
            var id="";
            if(zhi.length==0){
                alert("请选择将要删除的商品！");
            }else{
                // 有选中的商品，则取出每个选 中商品的ID，拼提交的ID的数据
                if(confirm("您确定删除"+zhi.length+"条商品吗？")){
                //拼接ID
                    $.each(zhi,function () {
                        id=$(this).val();
                        if(id!=null)
                            str += id+",";
                    });

                    //取出查询条件
                    var pname=$("#pname").val();
                    var typeid=$("#typeid").val();
                    var lprice=$("#lprice").val();
                    var hprice=$("#hprice").val();
                    $.ajax({
                        url:"${pageContext.request.contextPath}/prod/deleteBatch.action",
                        data:{"pids":str,"page": page,"pname":pname,"typeid":typeid,"lprice":lprice,"hprice":hprice},
                        type:"post",
                        dataType:"json",
                        success:function (data) {
                            alert(data.msg);//弹删除是否成功
                            $("#table").load("http://localhost:8080/admin/product.jsp #table")
                        }
                    });
                }
            }


        }
    }
    //单个删除
    function del(pid,page) {
        if (confirm("确定删除吗")) {
            //取出查询条件
            var pname=$("#pname").val();
            var typeid=$("#typeid").val();
            var lprice=$("#lprice").val();
            var hprice=$("#hprice").val();
           $.ajax({
               url:"${pageContext.request.contextPath}/prod/delete.action",
               data:{"pid":pid,"page": page,"pname":pname,"typeid":typeid,"lprice":lprice,"hprice":hprice},
               type:"post",
               dataType:"json",
               success:function (data) {
                    alert(data.msg);//弹删除是否成功
                   $("#table").load("http://localhost:8080/admin/product.jsp #table")
               }
           });
        }
    }

    function one(pid, ispage) {
        location.href = "${pageContext.request.contextPath}/prod/one.action?pid=" + pid + "&page=" + ispage;
    }
</script>
<!--分页的AJAX实现-->
<script type="text/javascript">
    function ajaxsplit(page) {
         //取出查询条件
        var pname=$("#pname").val();
        var typeid=$("#typeid").val();
        var lprice=$("#lprice").val();
        var hprice=$("#hprice").val();
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/prod/ajaxsplit.action",
            data: {"page": page,"pname":pname,"typeid":typeid,"lprice":lprice,"hprice":hprice},
            success: function () {

                <%--//将传回来的JSON对象中的数据挂在表格上显示--%>
                <%--var before = "<table class=\"table table-bordered table-striped\">\n" +--%>
                <%--"                <tr>\n" +--%>
                <%--"\n" +--%>
                <%--"                    <th>商品名</th>\n" +--%>
                <%--"                    <th>商品介绍</th>\n" +--%>
                <%--"                    <th>定价（元）</th>\n" +--%>
                <%--"                    <th>商品图片</th>\n" +--%>
                <%--"                    <th>商品数量</th>\n" +--%>

                <%--"                    <th>操作</th>\n" +--%>
                <%--"                </tr>\n" +--%>
                <%--"\n";--%>
                <%--var middle = "";--%>
                <%--for (var i = 0; i < pageinfo.size; i++) {--%>
                <%--var p = pageinfo.list[i];--%>
                <%--middle += "       <tr>\n" +--%>
                <%--"                        <td>" + p.pName + "</td>\n" +--%>
                <%--"                        <td>" + p.pContent + "</td>\n" +--%>
                <%--"                        <td>" + p.pPrice + "</td>\n" +--%>
                <%--"                        <td><img width=\"55px\" height=\"45px\"\n" +--%>
                <%--"                                 src=\"${pageContext.request.contextPath}/image_big/" + p.pImage + "\"></td>\n" +--%>
                <%--"                        <td>" + p.pNumber + "</td>\n" +--%>
                <%--"\n<td>\n" +--%>
                <%--"                            <button type=\"button\" class=\"btn btn-info myupdate\"\n" +--%>
                <%--"                                    onclick=\"one(" + p.pId + "," + page + ")\">编辑\n" +--%>
                <%--"                            </button>\n" +--%>
                <%--"                            <button type=\"button\" class=\"btn btn-warning\" id=\"mydel\"\n" +--%>
                <%--"                                    onclick=\"del(" + p.pId + "," + page + ")\">删除\n" +--%>
                <%--"                            </button>\n" +--%>
                <%--"                        </td>\n" +--%>
                <%--"                    </tr>\n";--%>
                <%--}--%>


                <%--var bottom = "\n" + "            </table>\n" +--%>
                <%--"\n" +--%>
                <%--"            <!--分页栏-->\n" +--%>
                <%--"            <div id=\"bottom\">\n" +--%>
                <%--"                <div>\n" +--%>
                <%--"                    <nav aria-label=\"...\" style=\"text-align:center;\">\n" +--%>
                <%--"                        <ul class=\"pagination\">\n" +--%>
                <%--"                            <li>\n" +--%>
                <%--"                                <a href=\"javascript:split("+pageinfo.prePage+","+pageinfo.pages+")\" aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a>\n" +--%>
                <%--"                            </li>\n";--%>
                <%--var bottom1 = "";--%>
                <%--for (var j = 1; j <= pageinfo.pages; j++) {--%>
                <%--if (j == page) {--%>
                <%--bottom1 += "<li><a style=\"background-color:lightslategray;color: #fff;\"\n" +--%>
                <%--"                                           href=\"javascript:split(" + j + "," +pageinfo.pages + ")\">" + j + "</a></li>";--%>
                <%--} else {--%>
                <%--bottom1 += "<li><a href=\"javascript:split(" + j + "," + pageinfo.pages + ")\">" + j + "</a></li>";--%>
                <%--}--%>
                <%--}--%>


                <%--var bottom2 = "\n" +--%>
                <%--"                            <li>\n" +--%>
                <%--"                                <a href=\"javascript:split("+pageinfo.nextPage+","+pageinfo.pages+")\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a>\n" +--%>
                <%--"                            </li>\n" +--%>
                <%--"                            <li style=\" margin-left:150px;color: #0e90d2;height: 35px; line-height: 35px;\">总共&nbsp;&nbsp;&nbsp;<font\n" +--%>
                <%--"                                    style=\"color:orange;\">" + pageinfo.pages + "</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前&nbsp;&nbsp;&nbsp;<font\n" +--%>
                <%--"                                    style=\"color:orange;\">" + pageinfo.pageNum + "</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +--%>
                <%--"                            </li>\n" +--%>
                <%--"                        </ul>\n" +--%>
                <%--"                    </nav>\n" +--%>
                <%--"                </div>\n" +--%>
                <%--"            </div>";--%>


                <%--$("#middle").html(before + middle + bottom + bottom1 + bottom2);--%>

                $("#table").load("http://localhost:8080/admin/product.jsp #table");
            },
            error: function (e) {
                alert(e.message);
            }
        });
    }
</script>

</html>