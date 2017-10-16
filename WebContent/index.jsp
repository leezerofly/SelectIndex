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



  <style>
    .icon-filter{
      background:url('img/filter.png') no-repeat center center;
    }
  </style>
  <script>
      var data = [
          {"productid":"FI-SW-01","productname":"Koi","attr1":10.00,"citylevel":"P","listprice":36.50,"attr1":"Large","itemid":"EST-1"},
          {"productid":"K9-DL-01","productname":"Dalmation","attr1":12.00,"citylevel":"P","listprice":18.50,"attr1":"Spotted Adult Female","itemid":"EST-10"},
          {"productid":"RP-SN-01","productname":"Rattlesnake","attr1":12.00,"citylevel":"P","listprice":38.50,"attr1":"Venomless","itemid":"EST-11"},
          {"productid":"RP-SN-01","productname":"Rattlesnake","attr1":12.00,"citylevel":"P","listprice":26.50,"attr1":"Rattleless","itemid":"EST-12"},
          {"productid":"RP-LI-02","productname":"Iguana","attr1":12.00,"citylevel":"P","listprice":35.50,"attr1":"Green Adult","itemid":"EST-13"},
          {"productid":"FL-DSH-01","productname":"Manx","attr1":12.00,"citylevel":"N","listprice":158.50,"attr1":"Tailless","itemid":"EST-14"},
          {"productid":"FL-DSH-01","productname":"Manx","attr1":12.00,"citylevel":"P","listprice":83.50,"attr1":"With tail","itemid":"EST-15"},
          {"productid":"FL-DLH-02","productname":"Persian","attr1":12.00,"citylevel":"P","listprice":23.50,"attr1":"Adult Female","itemid":"EST-16"},
          {"productid":"FL-DLH-02","productname":"Persian","attr1":12.00,"citylevel":"N","listprice":89.50,"attr1":"Adult Male","itemid":"EST-17"},
          {"productid":"AV-CB-01","productname":"Amazon Parrot","attr1":92.00,"citylevel":"N","listprice":63.50,"attr1":"Adult Male","itemid":"EST-18"}
      ];
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
              field:'citylevel',
              type:'combobox',
              options:{
                  panelHeight:'auto',
                  data:[{value:'',text:'all'},{value:'P',text:'二线'},{value:'N',text:'三线'}],
                  onChange:function(value){
                      if (value == ''){
                          dg.datagrid('removeFilterRule', 'citylevel');
                      } else {
                          dg.datagrid('addFilterRule', {
                              field: 'citylevel',
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
<body>
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

<!-- <table id="dg" title="DataGrid" style="width:100%;height:80%" data-options="
				singleSelect:true,
				data:data
			">
  <thead>
  <tr>
    <th data-options="field:'productid',width:70,align:'center'">项目编号</th>
   <th data-options="field:'productname',width:70,align:'center'">项目名称</th>
    <th data-options="field:'citylevel',width:70,align:'center'">城市级别</th>
   <th data-options="field:'citylevel',width:70,align:'center'">甲方单位</th>
   <th data-options="field:'citylevel',width:70,align:'center'">甲方单位电话</th>
    <th data-options="field:'citylevel',width:70,align:'center'">所属行业</th>
    <th data-options="field:'citylevel',width:70,align:'center'">所属省</th>
    <th data-options="field:'citylevel',width:70,align:'center'">所属市</th>
    <th data-options="field:'listprice',width:80,align:'center'">定标时间</th>
   <th data-options="field:'citylevel',width:70,align:'center'">中标单位</th>
    <th data-options="field:'listprice',width:80,align:'center'">中标单位电话</th>
    <th data-options="field:'citylevel',width:70,align:'center'">中标产品</th>
   <th data-options="field:'listprice',width:80,align:'center'">中标金额</th>
  </tr>
  </thead>
</table> -->

	<h2>Basic DataGrid</h2>
	<p>The DataGrid is created from markup, no JavaScript code needed.</p>
	<div style="margin:20px 0;"></div>
	
	<table class="easyui-datagrid" title="Basic DataGrid" style="width:100%;height:80%"
			data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">项目编号
				<select>
  					<option value ="selItem ID">selItem ID</option>
  					<option value ="saab">Saab</option>
  					<option value="opel">Opel</option>
  					<option value="audi">Audi</option>
				</select>
				</th>
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
			</tr>
		</thead>
	</table>
</body>
</html>
