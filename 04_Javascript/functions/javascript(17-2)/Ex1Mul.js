//1. Without paasing parameters, display the multiplication table with two variables , one variable for the number , and other for the limit.

function mul(){
    let start = 5;
    let limit = 14;

    for(let i = 1; i<= limit;i++){
        console.log(start +" x "+ i +" = "+ start*i)
    }
}
mul();