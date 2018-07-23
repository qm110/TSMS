<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改办税专员</title>
    <link href="static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/uimaker/icon.css">
    <link href="static/css/edit.css" rel="stylesheet">

  </head>
  <body>
     <div class="container">
        <div class="content">
         <form id="editForm" method="post">
            <div title="办税专员信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">修改办税专员</span></div>
               
                <input name="id" id="id" value="${list.id }" type="hidden">
                <table class="kv-table">              	
                    <tbody> 
                    
                       <tr>
                        <td class="kv-label">办税专员编号</td>
                        <td class="kv-content"><input type="text" name="taxerCode" value="${list.taxerCode }" placeholder="办税专员编号" ></td>
                        <td class="kv-label">办税专员名称</td>
                        <td class="kv-content"><input type="text" name="taxerName" value="${list.taxerName }" placeholder="办税专员名称" ></td>
                    </tr>
                    <tr>
                        <td class="kv-label">手机号</td>
                        <td class="kv-content"><input type="text" name="mobile" value="${list.mobile }" placeholder="手机号" ></td>
                        <td class="kv-label">地址</td>
                        <td class="kv-content"><input type="text" name="address" value="${list.address }" placeholder="地址" ></td>
                    </tr>
                     <tr>
                        <td class="kv-label">性别</td>
                        <td class="kv-content">
                        	<input type="radio" name="sex"  placeholder="男"  value="1"> 男
                        	<input type="radio" name="sex" placeholder="女"  value="0"> 女                	
                        	</td>
                        <td class="kv-label">生日</td>
                        <td class="kv-content"><input  type="text" value="${list.birthday }" name="birthday" placeholder="生日"  ></td>
                    </tr>
                    <tr>
                    <td class="kv-label">Email</td>
                        <td class="kv-content"><input type="text" value="${list.email }" name="email" placeholder="Email"></td>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content">
                            <select name="organId" id="selectOrgan" > 
                            <option value="${list.organId }">${list.organName }</option>
                            <option value="-1">请选择税务机关</option>
                            <option value="1">中国国税局</option>
                            <option value="2">北京市国税局</option>
                            <option value="3">天津市国税局</option>
                            <option value="4">上海市国税局</option>
                            <option value="5">深圳市国税局</option>
                            <option value="6">武汉市国税局</option>
                            <option value="7">杭州市国税局</option>
                            <option value="8">郑州市国税局</option>
                            </select>
                        </td>
                    </tr>                     
                    </tbody>                                
                </table>
                
            </div>
            <div class="btn-selection">
                <input type="submit" class="easyui-linkbutton submit-btn" id="editPayer"  data-options="selected:true" value="修改" />
                <input type="reset" class="easyui-linkbutton reset-btn" id="reset" data-options="selected:true" value="重置" />
            </div>
            </form>
        </div>
    </div>
  </body>
<script type="text/javascript" src="static/jquery/jquery.min.js"></script>
<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="static/js/calendar.js"></script>
<script type="text/javascript"> 
$("input[name=birthday]").datebox({
    formatter: easyUIFormater,
    parser: easyUIparser
});

$(function() {
	
	$("#editPayer").click(function(){
		var isValid = $('#editForm').form('validate');
		if(!isValid){
			return;
		}	
		$.post("toEditTaxerServlet.action",
				$("#editForm").serialize(),
				function(data){
	    			if(data.success){
	       				parent.$.messager.alert({
		       				title:"提示",
		       				msg:data.msg
	       				}) 
	       				parent.$("#topWindow").window("close")
						//parent.doSearch()	
	     			}else{
	    				$.messager.alert({
		           			title:"提示",
		           			msg:data.msg
				        })
	     			}
	    		},
	    		"json")    	    	
	})
	$("#reset").click(function(){
		$("#editForm").form("reset")
	}) 
	
	
	
});

</script>
</html>