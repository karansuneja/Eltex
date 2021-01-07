// window.onload=initAll;
// var add_to_Cart;
// function initAll(){
// 	add_to_Cart=document.getElementById('add_cart');
// 	add_to_Cart.onclick=addcart;
// }

function addcart(id){
	// alert("added")
	var object_id=id
	// alert(object_id)
	var url='/addcaa?id='+object_id;
	var req = new XMLHttpRequest();
  req.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	new_cart_count=req.responseText
    	// alert(new_cart_count)
    	('#cart_count').text(new_cart_count);
    	// alert(req.responseText)
    }
  };
  	// alert(url) 
  	req.open("GET", url, true);
  	req.send();

  
}