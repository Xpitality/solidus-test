const handleSummaryPosition= () =>{
    const code = document.querySelector('.code-holder');
    if(code){
        document.querySelector('#checkout-summary').classList.add('abstract')
    }else{
        document.querySelector('#checkout-summary').classList.remove('abstract')
    }
}