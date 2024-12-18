import 'dart:math';

sumInt(int a, int b){
    return a + b;
}

main(List<String> args){
    var sum;
    var a = 10;
    sum = sumInt (a, 20);
    print ('Tong la: $sum');

    var sqrtSum = sqrt(sum);
    print ('Can bac 2 cua $sum la: $sqrtSum')
}