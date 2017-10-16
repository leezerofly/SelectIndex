<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>jQuery EasyUI Demo</title>

  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/demo/demo.css">

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
              field:'unitcost',
              type:'numberbox',
              options:{precision:1},
              op:['equal','notequal','less','greater']
          },{
              field:'level',
              type:'combobox',
              options:{
                  panelHeight:'auto',
                  data:[{value:'',text:'all'},{value:'P',text:'二线'},{value:'N',text:'三线'}],
                  onChange:function(value){
                      if (value == ''){
                          dg.datagrid('removeFilterRule', 'level');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'level',
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
<h1>DataGrid Filter Row</h1>

<h2>Search Category</h2>
<p>Select a category and click search button or press enter key in input box to do searching.</p>
<div style="margin:20px 0;"></div>
<input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm',searcher:doSearch" style="width:300px"></input>
<div id="mm">
  <div data-options="name:'all',iconCls:'icon-ok'">All News</div>
  <div data-options="name:'sports'">Sports News</div>
</div>
<script>
    function doSearch(value,name){
        alert('You input: ' + value+'('+name+')');
    }
</script>

<table id="dg" title="DataGrid" style="width:100%;height:80%" data-options="
				singleSelect:true,
				url:'datagrid_data1.json'
			">
  <thead>
  <tr>
    <th data-options="field:'productid',width:70,align:'center'">项目编号</th>
   <th data-options="field:'productname',width:70,align:'center'">项目名称</th>
    <th data-options="field:'level',width:70,align:'center'">城市级别</th>
   <th data-options="field:'status',width:70,align:'center'">甲方单位</th>
   <th data-options="field:'status',width:70,align:'center'">甲方单位电话</th>
    <th data-options="field:'status',width:70,align:'center'">所属行业</th>
    <th data-options="field:'status',width:70,align:'center'">所属省</th>
    <th data-options="field:'status',width:70,align:'center'">所属市</th>
    <th data-options="field:'listprice',width:80,align:'center'">定标时间</th>
   <th data-options="field:'status',width:70,align:'center'">中标单位</th>
    <th data-options="field:'listprice',width:80,align:'center'">中标单位电话</th>
    <th data-options="field:'status',width:70,align:'center'">中标产品</th>
   <th data-options="field:'listprice',width:80,align:'center'">中标金额</th>
  </tr>
  </thead>
</table>

<input type ="button" value="1234" onclick ="showData()">
<div id="test"></div>

</body>
</html>
