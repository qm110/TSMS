<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>任务录入</title>
<link rel="stylesheet" type="text/css" href="static/css/base.css">
<link rel="stylesheet" type="text/css" href="static/easyui/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/uimaker/icon.css">
<link rel="stylesheet" type="text/css" href="static/css/edit.css">
</head>
<body>
	<div class="container">
		<div class="content">
			<form id="addTask" method="post">
				<div title="纳税人信息" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">纳税人基本信息</span>
					</div>
					<input name="payerId"  value="${list.id }" type="hidden">
					<input name="recordUserId"  value="${userId }" type="hidden">
					<table class="kv-table" id="payerTable">
						<tbody>
							<tr>
								<td class="kv-label">纳税人识别号</td>
								<td class="kv-content"><input type="text" name="payerCode"
									id="payerCode" value="${list.payerCode }"></td>
								<td class="kv-label">纳税人名称</td>
								<td id="p1" class="kv-content">${list.payerName }</td>
								<td class="kv-label">生产经营地址</td>
								<td id="p2" class="kv-content">${list.bizAddress }</td>
							</tr>
							<tr>
								<td class="kv-label">所属税务机关</td>
								<td id="p3" class="kv-content">${list.organName }</td>
								<td class="kv-label">行业</td>
								<td id="p4" class="kv-content">${list.industryName }</td>
								<td class="kv-label">经营范围</td>
								<td id="p5" class="kv-content">${list.bizScope }</td>
							</tr>
							<tr>
								<td class="kv-label">票种核定</td>
								<td id="p6" class="kv-content">${list.invoiceType }</td>
								<td class="kv-label">法人代表人</td>
								<td id="p7" class="kv-content">${list.legalPerson }</td>
								<td class="kv-label">法人身份证号</td>
								<td id="p8" class="kv-content">${list.legalIdCard }</td>
							</tr>
							<tr>
								<td class="kv-label">主管财务</td>
								<td id="p9" class="kv-content">${list.finaceName }</td>
								<td class="kv-label">财务身份证号</td>
								<td id="p10" class="kv-content">${list.finaceIdCard }</td>
							</tr>
							<tr>
								<td class="kv-label">录入日期</td>
								<td id="p11" class="kv-content">${list.recordDate }</td>
								<td class="kv-label">录入人员</td>
								<td id="p12" class="kv-content">${list.tn }</td>
							</tr>
						</tbody>
					</table>
					<div class="column">
						<span class="current">任务信息</span>
					</div>

					<table class="kv-table">
						<tbody>
							<tr>
								<td class="kv-label">任务名称</td>
								<td class="kv-content"><input type="text" name="taskName"
									placeholder="请输入任务名称"></td>
								<td class="kv-label">下达部门</td>
								<td class="kv-content"><select name="subOrganId"
									id="selectOrgan">
										<option value="-1">请选择下达部门必选项</option>
										<option value="1">中国国税局</option>
			                            <option value="2">北京市国税局</option>
			                            <option value="3">天津市国税局</option>
			                            <option value="4">上海市国税局</option>
			                            <option value="5">深圳市国税局</option>
			                            <option value="6">武汉市国税局</option>
			                            <option value="7">杭州市国税局</option>
			                            <option value="8">郑州市国税局</option>
								</select></td>
								<td class="kv-label">批准人</td>
								<td class="kv-content"><select name="approverId">
										<option value="-1">请选择批准人</option>
										<option value="1">章莉</option>
					                    <option value="2">程维</option>
					                    <option value="3">金霉瓶</option>
					                    <option value="4">彭丽媛</option>
					                    <option value="5">admin</option>
								</select></td>
							</tr>
							<tr>
								<td class="kv-label">执行人</td>
								<td class="kv-content">
									<select name="executeId">
											<option value="-1">请选择执行人</option>
											<option value="1">章莉</option>
						                    <option value="2">程维</option>
						                    <option value="3">金霉瓶</option>
						                    <option value="4">彭丽媛</option>
						                    <option value="5">admin</option>
									</select>
								</td>
								<td class="kv-label">执行时间</td>
								<td class="kv-content">
									<input type="text" name="executeTime" >
								</td>
								<td class="kv-label">任务执行情况</td>
								<td class="kv-content"><textarea rows="3" name="taskState"
										style="width: 90%;"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn-selection">
					<input type="submit" class="easyui-linkbutton save-btn" id="submitBtn" data-options="selected:true" value="保存"> 
					<input type="reset" class="easyui-linkbutton reset-btn" id="reset" data-options="selected:true" value="重置">
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
	$("input[name=executeTime]").datebox({
		formatter : easyUIFormater,
		parser : easyUIparser
	});
</script>
<script type="text/javascript">
	$(function(){
	//保存添加任务
		$("#submitBtn").click(function(){
			var isValid = $('#addTask').form('validate');
			if(!isValid){
				return;
			}	
			alert("aaaaa");
		//发送ajax请求完成添加操作			
			$.post(
					"payerAddTaskSaveServlet.action",
					$("#addTask").serialize(),
					function(data){	
						$.messager.alert({
		           			title:"提示",
		           			msg:data.msg,
	        			})			
					},
					"json"
					)
		});
		
		//重置
		$("#reset").click(function(){
			$("#addTask").form("reset")
		});
		
		//查询
		$("#payerCode").blur(function(){
			window.location.href = "toGetAddTaskServlet.action?payerCode="+$("#payerCode").val()
		});
	});
</script>
</html>