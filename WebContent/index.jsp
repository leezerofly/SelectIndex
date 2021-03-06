﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>jQuery EasyUI Demo</title>

  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/demo/demo.css">
  
  <link rel="stylesheet" type="text/css" href="css/main.css">

  <script type="text/javascript" src="jquery-easyui-1.5.3/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="js/datagrid-filter.js"></script>

  <script type="text/javascript" src="js/ajax.js"></script>

  <style>
    .icon-filter{
      background:url('img/filter.png') no-repeat center center;
    }
  </style>
  
  <script>
      $(function(){
          var dg = $('#dg').datagrid({
        	  filterMenuIconCls:'icon-ok',
              filterBtnIconCls:'icon-filter'
          });
          dg.datagrid('enableFilter', [{
              field:'listprice',
              type:'numberbox',
              options:{precision:1},
              op:['equal','notequal','less','greater']
          },{
              field:'attr1',
              type:'numberbox',
              options:{precision:1},
              op:['equal','notequal','less','greater']
          },{
              type:'combobox',
              options:{
                  panelHeight:'auto',
                  data:[{value:'',text:'所有行业'},{value:'0',text:'行业0'},{value:'1',text:'行业1'},{value:'2',text:'行业2'}],
                  onChange:function(value){
                      if (value == ''){
                          dg.datagrid('removeFilterRule', 'citylevel');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'citylevel',
                          dg.datagrid('removeFilterRule', 'trareType');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'trareType',
                              op: 'equal',
                              value: value
                          });
                      }
                      dg.datagrid('doFilter');
                  }
              }
          },{
              field:'projectProvince',
              type:'combobox',
              options:{
                  panelHeight:'auto',
                  data:[{value:'',text:'全部'},{value:'1省',text:'1省'},{value:'2省',text:'2省'},{value:'3省',text:'3省'}],
                  onChange:function(value){
                      if (value == ''){
                          dg.datagrid('removeFilterRule', 'projectProvince');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'projectProvince',
                              op: 'equal',
                              value: value
                          });
                      }
                      dg.datagrid('doFilter');
                  }
              }
          },{
              field:'projectCity',
              type:'combobox',
              options:{
                  panelHeight:'auto',
                  data:[{value:'',text:'全部'},{value:'0',text:'00省'},{value:'1',text:'01省'},{value:'2',text:'02省'}],
                  onChange:function(value){
                      if (value == ''){
                          dg.datagrid('removeFilterRule', 'projectCity');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'projectCity',
                              op: 'equal',
                              value: value
                          });
                      }
                      dg.datagrid('doFilter');
                  }
              }
          },{
              field:'projectArea',
              type:'combobox',
              options:{
                  panelHeight:'auto',
                  data:[{value:'',text:'全部'},{value:'0',text:'00省'},{value:'1',text:'01省'},{value:'2',text:'02省'}],
                  onChange:function(value){
                      if (value == ''){
                          dg.datagrid('removeFilterRule', 'projectArea');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'projectArea',
                              op: 'equal',
                              value: value
                          });
                      }
                      dg.datagrid('doFilter');
                  }
              }
          },{
              field:'cityLevel',
              type:'combobox',
              options:{
                  panelHeight:'auto',
                  data:[{value:'',text:'全部'},{value:'1',text:'1'},{value:'2',text:'2'},{value:'3',text:'3'},{value:'4',text:'4'}],
                  onChange:function(value){
                      if (value == ''){
                          dg.datagrid('removeFilterRule', 'cityLevel');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'cityLevel',
                              op: 'equal',
                              value: value
                          });
                      }
                      dg.datagrid('doFilter');
                  }
              }
          }]);
      });
  </script>
</head>
<body onload="showData()">

<table id="dg" title="项目表" rownumbers="true" pagination="true" style="width:100%;height:80%" 
	data-options="
		singleSelect:true,
		url:'dbData.json'
	">
  <thead>
  <tr>
<<<<<<< HEAD
                <th data-options="field:'itemid',width:80">项目编号</th>
				<th data-options="field:'productname',width:100,align:'center'">项目名称</th>
				<th data-options="field:'citylevel',width:60,align:'center'">城市级别</th>
				<th data-options="field:'partyA',width:100,align:'center'">甲方单位</th>
				<th data-options="field:'attr1',width:80,align:'center'">甲方单位电话</th>
				<th data-options="field:'job',width:80,align:'center'">所属行业</th>
				<th data-options="field:'province',width:80,align:'center'">
                <input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm'" style="width:120px"></input>
                 <div id="mm">
                    <div data-options="name:'all'">所属省</div>
                    <div data-options="name:'sports'">江西</div>
                 </div>
                    </th>
				<th data-options="field:'city',width:80,align:'center'">
				<input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm'" style="width:120px"></input>
                 <div id="mm">
                    <div data-options="name:'all'">所属市</div>
                    <div data-options="name:'sports'">南昌</div>
                    </div>
                    </th>
				<th data-options="field:'time',width:80,align:'center'">中标时间</th>
				<th data-options="field:'bid',width:80,align:'center'">中标单位</th>
				<th data-options="field:'attr2',width:250">中标单位电话</th>
				<th data-options="field:'bidproduct',width:80,align:'ceneter'">中标产品</th>
				<th data-options="field:'money',width:80,align:'center'">中标金额</th>
=======
    <th data-options="field:'projectNo',width:90,align:'center'">项目编号</th>
   <th data-options="field:'projectName',width:90,align:'center'">项目名称</th>
    <th data-options="field:'projectProvince',width:90,align:'center'">所属省</th>
   <th data-options="field:'projectCity',width:90,align:'center'">所属市</th>
   <th data-options="field:'projectArea',width:90,align:'center'">所属区域</th>
    <th data-options="field:'cityLevel',width:90,align:'center'">城市级别</th>
    <th data-options="field:'trareType',width:90,align:'center'">所属行业</th>
    <th data-options="field:'bidUnit',width:90,align:'center'">甲方单位</th>
    <th data-options="field:'bidConcatTel',width:90,align:'center'">甲方单位电话</th>
   <th data-options="field:'fixBidDate',width:90,align:'center'">定标日期</th>
    <th data-options="field:'widbidAmount',width:90,align:'center'">中标单位</th>
    <th data-options="field:'widbidConcatTel',width:90,align:'center'">中标单位电话</th>
   <th data-options="field:'widbidProduct',width:90,align:'center'">中标产品</th>
>>>>>>> 9feef579edf4c5814458d701c802df6911a35dac
  </tr>
  </thead>
</table>
</body>
</html>
