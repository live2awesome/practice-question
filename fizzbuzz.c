void fizzBuzz(int n){
    for (int i=1;i<=n;i++){
        if(i%3==0 && i%5==0){
            printf("FizzBuzz");
        }
        if(i%3==0 && i%5!=0){
            printf("Fizz");
        }
        if(i%3!=0 && i%5==0){
            printf("Buzz");
        }
        if(i%3!=0 && i%5!=0){
            printf("%d",i);
        }
    }
}