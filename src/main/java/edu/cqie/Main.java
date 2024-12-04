package edu.cqie;

import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        // 读取整行输入并分割成部分
        String[] s = cin.nextLine().split(" ");
        cin.close();
        // 将字符串输入转换为长整型并存储在数组中
        long[] arr = new long[s.length];
        for (int i = 0; i < s.length; i++) {
            arr[i] = Long.parseLong(s[i]);  // 使用 Long 来正确处理较大的数字
        }
        // 对长整型数组进行排序
        Arrays.sort(arr);
        // 计算将要创建的字符串数量
        int numberOfStrings = (int) Math.ceil(Math.sqrt(arr.length)); // 改为使用 ceil，确保覆盖所有数字
        StringBuilder[] str = new StringBuilder[numberOfStrings];

        // 声明并初始化 index 变量
        int index = 0;

        // 用格式化字符串填充 StringBuilder
        for (int i = 0; i < numberOfStrings; i++) {
            str[i] = new StringBuilder();
            for (int j = 0; j <= i && index < arr.length; j++, index++) {
                str[i].append(arr[index]).append(" ");  // 直接使用 append 添加
            }
        }

        // 找到最大长度以便进行填充
        int maxLength = str[numberOfStrings - 1].length();

        // 打印时进行居中对齐
        for (int i = 0; i < numberOfStrings; i++) {
            int count = (maxLength - str[i].length()) / 2;
            // 手动生成空格
            for (int j = 0; j < count; j++) {
                System.out.print(" ");
            }
            System.out.println(str[i].toString().trim());  // trim 去掉尾部空格
        }
    }
}