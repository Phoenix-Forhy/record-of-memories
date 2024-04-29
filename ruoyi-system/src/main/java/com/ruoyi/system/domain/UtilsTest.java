package com.ruoyi.system.domain;

public class UtilsTest {
    public static void main(String[] args) {
        caculate(60);
    }
    private static double caculate(int num){
        double result=1;
        double red=0.025;
        if(num<=50)
        {
            for(int i=1;i<=num;i++){
                result*=(1-red);
            }
        }else{
            for(int i=1;i<=50;i++){
                result*=(1-red);
            }
            for(int i=51;i<=num;i++){
                red+=0.05;
                result*=(1-red);
            }
        }
        System.out.printf("%d抽没出红卡的概率是：%f%%",num,result*100);
        return result;
    }
}
