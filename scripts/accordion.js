
document.addEventListener("DOMContentLoaded", function(event) { 
    var acc = document.getElementsByClassName("accordion");
    var panel = document.getElementsByClassName('panel');
    [...acc].map(function(me){
	me.onclick = function(){
	    this.classList.toggle("active");
	    this.nextElementSibling.classList.toggle("show");
	};
    });
});
