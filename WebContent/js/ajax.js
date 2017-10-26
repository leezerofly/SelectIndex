//ajax

var xmlhttp;

function loadXMLDoc(url,cfunc)
{
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=cfunc;
xmlhttp.open("POST",url,true);
xmlhttp.send();
}

function showData()
{
loadXMLDoc("DataServlet",function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	  var data = xmlhttp.responseText;
	  document.getElementById("test").innerHTML=xmlhttp.responseText;
    }
  });
}