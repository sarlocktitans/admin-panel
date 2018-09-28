function userTyped(c,b, e){
    if(e.value.length > 0){
        document.getElementById(c).disabled=false;
        document.getElementById(b).disabled=false;
    }else{
        document.getElementById(c).disabled=true;
        document.getElementById(c).checked=false;
        document.getElementById(b).disabled=true;
        document.getElementById(b).checked=false;
    }
 }