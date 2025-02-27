// 3. Pass a number, and find if the sum of their digits is an even or odd number
function sum(num){
    let a = 0;
    while(num > 0){
        a += num %10
        num = Math.floor(num/10)
    }
    console.log(a)
    if(a % 2 == 0){
        console.log("even")
    }else{
        console.log("odd")
    }
}
sum(123)