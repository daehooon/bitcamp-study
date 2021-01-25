// 오버라이딩(overriding) - 레퍼런스가 가리키는 메서드
package com.eomcs.oop.ex06.c;

public class Exam0511 {
  public static void main(String[] args) {
    X4 x4 = new X4();
    x4.m1();

    // 인스턴스 필드와 달리 메서드의 경우는
    // 레퍼런스에 대한 형변환에 상관없이
    // 실제 레퍼런스가 가리키는 클래스에서 메서드를 찾아 올라간다.
    //
    ((X3)x4).m1();
    ((X2)x4).m1();
    ((X)x4).m1();
  }
}








