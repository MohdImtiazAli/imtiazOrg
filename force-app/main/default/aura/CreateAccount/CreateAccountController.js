({
    doInit : function(c,e,h){
        alert("Page Reloaded !");
    },
	handleClick: function (c, e, h) {
        console.log("controller");
        h.doInit_helper(c,e,h);
    }
})